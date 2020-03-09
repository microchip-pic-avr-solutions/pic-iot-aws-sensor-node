/********************************************************************
 *
 © [2018] Microchip Technology Inc. and its subsidiaries.

   Subject to your compliance with these terms, you may use Microchip software  
 * and any derivatives exclusively with Microchip products. It is your 
 * responsibility to comply with third party license terms applicable to your 
 * use of third party software (including open source software) that may 
 * accompany Microchip software.
   THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER  
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A PARTICULAR 
 * PURPOSE.
 *
   IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN 
 * ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY, 
 * THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *************************************************************************
 *
 *                           mqtt_connection_handler.c
 *
 * About:
 *  MQTT Connection Handler to maintain TCP connection for MQTT communication. 
 *
 * 
 ******************************************************************************/
#include <time.h>
#include "mqtt_connection_handler.h"
#include "../mqtt_core/mqtt_core.h"
#include "../mqtt_comm_tcpipLite/mqtt_comm_layer.h"
#include "tcpip_config.h"


/********************MQTT Connection Handler definitions**********************/
//Consider enough time for both broker to send an SYNACK after client sends out 
// a SYN packet, and client to send an ACK to broder, we take 60 seconds as 
// timeout
#define MQTT_SOCKETCONNECT_TIMEOUT  60   

/*****************MQTT Connection Handler definitions*(END)********************/


/******************MQTT Connection Handler variables***************************/
// Create the socket for the TCP Client
volatile sockaddr_in4_t mqttSocket;


mqttContext mqttConn; 


/*****************MQTT Connection Handler variables*(END)**********************/


/**********************Function implementations********************************/
void MQTT_ClientInitialise(mqttConnectionInfo *mqttClientInfo)
{ 
    mqttSocket.addr.s_addr = MAKE_IPV4_ADDRESS(mqttClientInfo->ipAddress[0], mqttClientInfo->ipAddress[1], mqttClientInfo->ipAddress[2], mqttClientInfo->ipAddress[3]); 
    mqttSocket.port = mqttClientInfo->mqttTCPCommunicationPortNumber;
    mqttConn.mqttDataExchangeBuffers.txbuff.start = mqttClientInfo->txDataBuffer;
    mqttConn.mqttDataExchangeBuffers.txbuff.bufferLength = mqttClientInfo->txDataBufferLength;
    mqttConn.mqttDataExchangeBuffers.rxbuff.start = mqttClientInfo->rxDataBuffer;
    mqttConn.mqttDataExchangeBuffers.rxbuff.bufferLength = mqttClientInfo->rxDataBufferLength;
}


// ToDo Maintain prevState and currState of MQTT_Handler() to close the TCP 
// connection in the event of MQTT DISCONNECT.
void MQTT_Manage(void)
{
    static time_t t_client;
    static time_t socketTimeout;
    static bool mqtt_conn_sent = false;
    uint16_t rxLength;
    socketState_t socketState;
    rxLength = 0;    
    
    socketState = MQTT_SocketPoll(&mqttConn);

    time(&t_client);

    switch(socketState)
    {
        case NOT_A_SOCKET:
            //Try to send out MQTT connect request after MQTT_SOCKETCONNECT_TIMEOUT
            socketTimeout = t_client + MQTT_SOCKETCONNECT_TIMEOUT;
            MQTT_SocketInit(&mqttConn);
            break;
        case SOCKET_CLOSED:
            // If the socket is closed we will try to connect again
            MQTT_InsertRxBuffer(&mqttConn);
            if (!mqtt_conn_sent)
            {
                MQTT_initialiseState();
                MQTT_SocketConnect(&mqttConn, &mqttSocket);
                mqtt_conn_sent = true;
            }
            else
            {
                if(t_client > socketTimeout)
                {
                    socketTimeout = t_client + MQTT_SOCKETCONNECT_TIMEOUT;
                    MQTT_SocketConnect(&mqttConn, &mqttSocket);
                }
            }

            // ToDo Update the MQTT handler state here
            // If the MQTT state is DISCONNECTED, the TCP connection needs to be
            // closed.
            break;
        case SOCKET_IN_PROGRESS:
            // If the socket is closed try to connect again
            // ToDo This might require some modifications
            if(t_client >= socketTimeout)
            {
                MQTT_Close(&mqttConn);
            }
            break;
        case SOCKET_CONNECTED:
            // ToDo Maintain prevState and currState of MQTT_Handler() to 
            // close the TCP connection in the event of MQTT DISCONNECT.
            rxLength = MQTT_GetReceivedData(&mqttConn);
            if(rxLength > 0)
            {
                MQTT_ExchangeBufferWrite(&mqttConn.mqttDataExchangeBuffers.rxbuff, mqttConn.tcbInfo.rxBufferStart, rxLength);
                MQTT_ReceptionHandler(&mqttConn);
                MQTT_InsertRxBuffer(&mqttConn);
            }
            MQTT_TransmissionHandler(&mqttConn);
            break;
        case SOCKET_CLOSING:
            MQTT_SocketRemove(&mqttConn);
            mqtt_conn_sent = false;
            break;
        default:
            break;
    }
}

/**********************Function implementations********************************/

