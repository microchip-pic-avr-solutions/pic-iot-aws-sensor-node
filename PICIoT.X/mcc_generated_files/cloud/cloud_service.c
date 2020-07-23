/*
    \file   cloud_service.c

    \brief  Cloud Service Abstraction Layer

    (c) 2018 Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip software and any
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party
    license terms applicable to your use of third party software (including open source software) that
    may accompany Microchip software.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS
    FOR A PARTICULAR PURPOSE.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS
    SOFTWARE.
*/ 

#include <string.h>
#include <time.h>
#include "../clock.h"
#include "../config/conf_winc.h"
#include "cloud_service.h"
#include "../debug_print.h"
#include "../mqtt/mqtt_winc_adapter.h"
#include "../drivers/timeout.h"
#include "mqtt_service.h"
#include "../mqtt/mqtt_core/mqtt_core.h"
#include "wifi_service.h" 
#include "../credentials_storage/credentials_storage.h"

#include "../led.h"
#include "../time_service.h"
#include "cloud_interface.h"
  

// Scheduler Callback functions
uint32_t cloudTask(void *param);
uint32_t mqttTimeoutTask(void *payload);
uint32_t cloudResetTask(void *payload);

static void dnsHandler(uint8_t * domainName, uint32_t serverIP);
static uint8_t reInit(void);
static int32_t getMQTT_ConnectionAge(void);
static void CLOUD_handleReceptionDebugMessage(void);
static void CLOUD_handleTransmitDebugMessage(void);
static void startMqttConnectionTimeout();
static bool hasLostWifi();
static void setMqttStateToDisconnected();
static bool isTimeAvailable();
static void setHaveSocketFor(socketState_t socketState, int32_t thisAge);
static void handleSocketConnection();
static void handleSocketState(socketState_t socketState, int32_t thisAge);

#define CLOUD_TASK_INTERVAL            500L
#define CLOUD_MQTT_TIMEOUT_COUNT	      10000L   // 10 seconds max allowed to establish a connection
#define MQTT_CONN_AGE_TIMEOUT          3600L      // 3600 seconds = 60minutes

// Create the timers for scheduler_timeout which runs these tasks
timerStruct_t cloudTaskTimer            = {cloudTask};
timerStruct_t mqttTimeoutTaskTimer       = {mqttTimeoutTask};
timerStruct_t cloudResetTaskTimer       = {cloudResetTask};

uint32_t mqttBrokerIP;
shared_networking_params_t shared_networking_params;
cloudStatus_t cloudStatus;
packetReceptionHandler_t cloud_packetReceiveCallBackTable[CLOUD_PACKET_RECV_TABLE_SIZE];

cloudContext_t cloudContext = 
{
    CLOUD_init,
    CLOUD_connectSocket, 
    CLOUD_connectAppProtocol, 
    CLOUD_subscribe,
    CLOUD_publish, 
    CLOUD_disconnect, 
    CLOUD_isConnected, 
    CLOUD_isDisconnected
};


void CLOUD_reset(void)
{
    debug_printError("CLOUD: Cloud Reset");
    cloudStatus.cloudInitialized = false;
}

void CLOUD_setupTask(char* attDeviceID)
{     
    // Create timers for the application scheduler
    timeout_create(&cloudTaskTimer, 500);
}

void CLOUD_registerSubscription(uint8_t *topic, imqttHandlePublishDataFuncPtr subscriptionCallback)
{
    static uint8_t subscriptionTopicCount = 0;
    
    if(subscriptionTopicCount < NUM_TOPICS_SUBSCRIBE)
    {
        imqtt_publishReceiveCallBackTable[subscriptionTopicCount].topic = topic;
        imqtt_publishReceiveCallBackTable[subscriptionTopicCount].mqttHandlePublishDataCallBack = subscriptionCallback;            
    }    
    subscriptionTopicCount++;
    MQTT_SetPublishReceptionHandlerTable(imqtt_publishReceiveCallBackTable);
}

void CLOUD_publishData(uint8_t* refToPublishTopic, uint8_t* data, uint16_t len)
{
    cloudContext.cloudPublish(refToPublishTopic, data, len);
}

bool CLOUD_checkIsConnected(void)
{
    return cloudContext.cloudIsConnected();
}

uint32_t mqttTimeoutTask(void *payload) 
{
    debug_printError("CLOUD: MQTT Connection Timeout");
    CLOUD_reset();
    
    cloudStatus.waitingForMQTT = false;
    
    return 0;  
}

uint32_t cloudResetTask(void *payload) 
{
	debug_printError("CLOUD: Reset task");
    if(reInit())
    {
        cloudStatus.cloudInitialized = true;
    }
    else
    {
        cloudStatus.cloudInitialized = false;
    }
    return 0;
}

uint32_t cloudTask(void *param)
{
	if ((cloudStatus.cloudInitialized == false) && (cloudStatus.isResetting == false))
	{
        cloudContext.cloudInit(&mqttTimeoutTaskTimer, &cloudResetTaskTimer);     
	} 
    else if ((cloudStatus.waitingForMQTT == false)
            && (!cloudContext.cloudIsConnected())
            && (cloudStatus.cloudResetTimerFlag == false))
    {
        startMqttConnectionTimeout();
    }
    
    if(hasLostWifi()) {
        setMqttStateToDisconnected();
    }
    else
    {
        handleSocketConnection();
    }
	return CLOUD_TASK_INTERVAL;
}

static void startMqttConnectionTimeout() 
{
    debug_printError("MQTT: MQTT reset timer is created");
    timeout_create(&mqttTimeoutTaskTimer, CLOUD_MQTT_TIMEOUT_COUNT);
    shared_networking_params.haveDataConnection = 0;
    cloudStatus.waitingForMQTT = true;
}

static bool hasLostWifi() 
{
    return shared_networking_params.haveAPConnection == 0;
}

static void setMqttStateToDisconnected() 
{
    if(cloudContext.cloudIsConnected())
    {
        MQTT_initialiseState();
    }
}

static bool isTimeAvailable() 
{
    uint32_t theTime = TIME_getCurrent();
    if(theTime<=0)
    {
        debug_printError("CLOUD: time not ready");
        return false;
    }
    return true;
}

static void setHaveSocketFor(socketState_t socketState, int32_t thisAge) 
{
    static int32_t lastAge = -1;
    
    if(cloudContext.cloudIsConnected())
    {
        shared_networking_params.haveDataConnection = 1;
        if(lastAge != thisAge)
        {
            debug_printInfo("CLOUD: Uptime %lus SocketState (%d) MQTT (%d)", thisAge , socketState, MQTT_GetConnectionState());
            lastAge = thisAge;
        }
    }
}

static void handleSocketConnection() 
{
    mqttContext* mqttConnnectionInfo = MQTT_GetClientConnectionInfo();
    socketState_t socketState = BSD_GetSocketState(*mqttConnnectionInfo->tcpClientSocket);

    int32_t thisAge = getMQTT_ConnectionAge();
    if(isTimeAvailable()) 
    {
        setHaveSocketFor(socketState, thisAge);
    }

    handleSocketState(socketState, thisAge);
}

static void handleSocketState(socketState_t socketState, int32_t thisAge) 
{
    switch(socketState)
    {
        case NOT_A_SOCKET:
            // Intentionally fall into Socket Closed

        case SOCKET_CLOSED:
            // Reinitialize MQTT
            MQTT_ClientInitialise();			   
            if(cloudContext.cloudConnectSocket(mqttBrokerIP) == BSD_ERROR)
            {
                shared_networking_params.haveError = 1;
            }
            else
            {
                // ToDo Check LED behavior
                shared_networking_params.amConnectingSocket = 1;
            }
            break;

        case SOCKET_IN_PROGRESS:
            // The TCP listen or initiate a connection
            // WG Application requires no action
            break;

        case SOCKET_CONNECTED:
            // If MQTT was disconnected but the socket is up we retry the MQTT connection
            if (cloudContext.cloudIsDisconnected())
            {
                cloudContext.cloudConnectAppProtocol();
            } 
            else 
            {
                mqttCurrentState receptionResponse;
                mqttContext* mqttConnnectionInfo = MQTT_GetClientConnectionInfo();
                receptionResponse = MQTT_ReceptionHandler(mqttConnnectionInfo);
                if (receptionResponse != MQTT_UNKNOWN_RECEIVE_STATE)
                {
                    CLOUD_handleReceptionDebugMessage();
                }
                else
                {
                    debug_printError("MQTT: Packet type: %d. MQTT Client does not currently support the received packet type.", receptionResponse);
                }	   

                MQTT_TransmissionHandler(mqttConnnectionInfo);
                CLOUD_handleTransmitDebugMessage();

                // Todo: We already processed the data in place using PEEK, this just flushes the buffer
                BSD_recv(*MQTT_GetClientConnectionInfo()->tcpClientSocket, MQTT_GetClientConnectionInfo()->mqttDataExchangeBuffers.rxbuff.start, MQTT_GetClientConnectionInfo()->mqttDataExchangeBuffers.rxbuff.bufferLength, 0);

                if (cloudContext.cloudIsConnected())
                {
                    shared_networking_params.amConnectingSocket = 0;
                    shared_networking_params.haveError = 0;         
                    timeout_delete(&mqttTimeoutTaskTimer);
                    timeout_delete(&cloudResetTaskTimer);
                    cloudStatus.isResetting = false;

                    cloudStatus.waitingForMQTT = false;      

                    if(cloudStatus.sendSubscribe == true)
                    { 
                        cloudContext.cloudSubscribe();
                    }				 

                    // The Authorization timeout is set to 3600, so we need to re-connect that often
                    if (getMQTT_ConnectionAge() > MQTT_CONN_AGE_TIMEOUT) 
                    {
                        debug_printError("MQTT: Connection aged, Uptime %lus SocketState (%d) MQTT (%d)", thisAge , socketState, MQTT_GetConnectionState());
                        cloudContext.cloudDisconnect();
                        BSD_close(*mqttConnnectionInfo->tcpClientSocket);
                    }
                } 
            }
            break;

        case SOCKET_CLOSING:
            // The user initiate the closing procedure for this socket
            // WG Application requires no action
            break;

        default:
            // Unknown State
            shared_networking_params.haveError = 1; 
            break;
    }
}

static void CLOUD_handleReceptionDebugMessage(void)
{
    uint32_t timeStampReference = 0;
	mqttHandlerState_t receptionState = MQTT_NO_ERROR;
    mqttHeaderFlags lastPacketHeader;
    
	receptionState = MQTT_GetLastHandlerState();
    
    switch (receptionState)
    {
        case MQTT_CONNACK_TIMEOUT:
            debug_printError("MQTT: CONNACK TIMEOUT");
            break;
        case MQTT_INCORRECT_RESPONSE:
            lastPacketHeader = MQTT_GetLastReceivedPacketHeader();
            debug_printError("MQTT: DISCONNECT (%d) from (%d)", lastPacketHeader.controlPacketType, MQTT_GetLastReceivedLength);
            break;
        case MQTT_CONNACK_ERROR:
            debug_printError("MQTT: CONNACK DISCONNECTED :(");
            break;
        case MQTT_CONNACK:
            timeStampReference = TIME_getCurrent();
            TIME_setStamp(timeStampReference);
            debug_printGOOD("MQTT: CONNACK CONNECTED at %s", TIME_GetcTime(TIME_getStamp()));
            break;
        case MQTT_NO_ERROR:
            // Do Nothing            
            break;
        default:
            debug_printError("MQTT: STATE ERROR_OCCURED");
            break;
    }
}

static void CLOUD_handleTransmitDebugMessage(void)
{
	mqttHandlerState_t transmitState = MQTT_NO_ERROR;
	transmitState = MQTT_GetLastHandlerState();
    
    switch (transmitState)
    {
        case MQTT_SEND_SUCCESS:
            debug_print("MQTT: sendresult (%d)", MQTT_LastSentSize());
            break;
        case MQTT_SEND_ERROR:
            debug_printError("MQTT: Send Error");
            break;
        default:
            break;
    }
}

static void dnsHandler(uint8_t* domainName, uint32_t serverIP)
{
    if(serverIP != 0)
    {
        mqttBrokerIP = serverIP;
        debug_printInfo("CLOUD: mqttBrokerIP = (%lu.%lu.%lu.%lu)",(0x0FF & (serverIP)),(0x0FF & (serverIP>>8)),(0x0FF & (serverIP>>16)),(0x0FF & (serverIP>>24)));
    }
}

static uint8_t reInit(void)
{
    debug_printInfo("CLOUD: reinit");
    
    mqttBrokerIP = 0;
    shared_networking_params.haveAPConnection = 0;
    shared_networking_params.amConnectingAP = 1;
    cloudStatus.waitingForMQTT = false;
    cloudStatus.isResetting = false;
    uint8_t wifi_creds;
    
    //Re-init the WiFi
    wifi_reinit();
    
    registerSocketCallback(BSD_SocketHandler, dnsHandler);
    
    MQTT_ClientInitialise();
    memset(&cloud_packetReceiveCallBackTable, 0, sizeof(cloud_packetReceiveCallBackTable));
    BSD_SetRecvHandlerTable(cloud_packetReceiveCallBackTable);
    
    cloud_packetReceiveCallBackTable[0].socket = MQTT_GetClientConnectionInfo()->tcpClientSocket;
    cloud_packetReceiveCallBackTable[0].recvCallBack = MQTT_CLIENT_receive;
    
    //When the input comes through cli/.cfg
    if((strcmp(ssid,"") != 0) &&  (strcmp(authType,"") != 0))
    {
        wifi_creds = NEW_CREDENTIALS;
        debug_printInfo("Connecting to AP with new credentials");
    }
    //This works provided the board had connected to the AP successfully	
    else 
    {
        wifi_creds = DEFAULT_CREDENTIALS;
        debug_printInfo("Connecting to AP with the last used credentials");
    }
	
    if(!wifi_connectToAp(wifi_creds))
    {
        return false;
    }
	
    timeout_delete(&cloudResetTaskTimer);
    debug_printInfo("CLOUD: Cloud reset timer is deleted");
    timeout_create(&mqttTimeoutTaskTimer, CLOUD_MQTT_TIMEOUT_COUNT);
    cloudStatus.cloudResetTimerFlag = false;
    cloudStatus.waitingForMQTT = true;		
    
    return true;
}

static int32_t getMQTT_ConnectionAge(void) 
{
	int32_t currentTime = 0;
	int32_t age = 0;
	int32_t lastConnectionTime = TIME_getStamp();
	if (lastConnectionTime > 0)
	{
		currentTime = TIME_getCurrent();
		age = TIME_getDiffTime(currentTime, lastConnectionTime);
	}
	return age;
}

