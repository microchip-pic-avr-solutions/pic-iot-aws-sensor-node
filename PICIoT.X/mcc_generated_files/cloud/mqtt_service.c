/*
    \file   mqtt_service.c

    \brief  Application MQTT Service source file.

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
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "mqtt_service.h"
#include "mqtt/mqtt_core/mqtt_core.h"
#include "../mqtt/mqtt_packetTransfer_interface.h"
#include "../config/IoT_Sensor_Node_config.h"
#include "../debug_print.h"
#include "../config/cloud_config.h"

char awsEndpoint[AWS_ENDPOINT_LEN];
char cid[MQTT_CID_LENGTH];
static publishReceptionHandler_t *publishRecvInfo;


static void manageSubscriptionMessage(uint8_t *topic, uint8_t *payload);

static void manageSubscriptionMessage(uint8_t *topic, uint8_t *payload)
{
    const publishReceptionHandler_t *publishRecvHandlerInfo;
    uint8_t subTopicIndex;
    const char multiLevelWildcard = '#';
    
    // Direct messages published on a topic to the correct callback function.
    publishRecvHandlerInfo = MQTT_GetPublishReceptionHandlerTable();
    for (subTopicIndex = 0; subTopicIndex < NUM_TOPICS_SUBSCRIBE; subTopicIndex++) 
    {
        if (publishRecvHandlerInfo) 
        {
            if(strchr((const char*)publishRecvHandlerInfo->topic, multiLevelWildcard))
            {
                if(!strncmp((const char*)topic, (const char*)publishRecvHandlerInfo->topic, (strlen((const char*)publishRecvHandlerInfo->topic) - 1)))
                {
                    publishRecvHandlerInfo->mqttHandlePublishDataCallBack(topic, payload);
                    break;
                }
            }
            else if(memcmp((void*) publishRecvHandlerInfo->topic, (void*) topic, strlen((const char*)publishRecvHandlerInfo->topic)) == 0) 
            {
                publishRecvHandlerInfo->mqttHandlePublishDataCallBack(topic, payload);
                break;
            }
        }
        publishRecvHandlerInfo++;
    }
}

void MQTT_SetPublishReceptionHandlerTable(publishReceptionHandler_t *appPublishReceptionInfo) 
{
    publishRecvInfo = appPublishReceptionInfo;
}

publishReceptionHandler_t *MQTT_GetPublishReceptionHandlerTable()
{
    return publishRecvInfo;
}



void MQTT_CLIENT_publish(uint8_t* refToPublishTopic, uint8_t *data, uint16_t len)
{
	 mqttPublishPacket cloudPublishPacket;
    
    // Fixed header
    cloudPublishPacket.publishHeaderFlags.duplicate = 0;
    cloudPublishPacket.publishHeaderFlags.qos = 0;
    cloudPublishPacket.publishHeaderFlags.retain = 0;
        
    // Variable header
    cloudPublishPacket.topic = (uint8_t*)refToPublishTopic;
    
    // Payload
    cloudPublishPacket.payload = data;
    // ToDo Check whether sizeof can be used for integers and strings
    cloudPublishPacket.payloadLength = len;
    
    if(MQTT_CreatePublishPacket(&cloudPublishPacket) != true)
    {
		debug_printError("MQTT: Connection lost PUBLISH failed");
    }
}

bool MQTT_CLIENT_subscribe(void)
{
    mqttSubscribePacket cloudSubscribePacket;
	uint8_t topicCount = 0;

    publishReceptionHandler_t *subscriptionTablePointer = MQTT_GetPublishReceptionHandlerTable();
    
	// Variable header
	cloudSubscribePacket.packetIdentifierLSB = 1;
	cloudSubscribePacket.packetIdentifierMSB = 0;
    
	// Payload
	for(topicCount = 0; topicCount < NUM_TOPICS_SUBSCRIBE; topicCount++)
	{
		cloudSubscribePacket.subscribePayload[topicCount].topic = subscriptionTablePointer->topic;
		cloudSubscribePacket.subscribePayload[topicCount].topicLength = strlen((const char*)(subscriptionTablePointer->topic));
		cloudSubscribePacket.subscribePayload[topicCount].requestedQoS = 0;
        subscriptionTablePointer++;
	}
	
	if(MQTT_CreateSubscribePacket(&cloudSubscribePacket) == true)
	{
		debug_printInfo("CLOUD: SUBSCRIBE packet created");
        return true;
	}
    return false;
}

void MQTT_CLIENT_receive(uint8_t *data, uint8_t len)
{
    MQTT_GetReceivedData(data, len);
}

void MQTT_CLIENT_connect(void)
{
	mqttConnectPacket cloudConnectPacket;

	memset(&cloudConnectPacket, 0, sizeof(mqttConnectPacket));

	cloudConnectPacket.connectVariableHeader.connectFlagsByte.All = 0x02;
	cloudConnectPacket.connectVariableHeader.keepAliveTimer = 10;
	cloudConnectPacket.clientID = (uint8_t*)cid;
    // Set the subscription callback handler here
    MQTT_SetPublishReceptionCallback(manageSubscriptionMessage);
	MQTT_CreateConnectPacket(&cloudConnectPacket);
}
