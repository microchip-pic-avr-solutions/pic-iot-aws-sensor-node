/*
    \file   mqtt_comm_layer.c

    \brief  MQTT Communication layer source file.

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
#include <stdio.h>
#include "mqtt_comm_layer.h"
#include "../mqtt_core/mqtt_core.h"
#include "../mqtt_winc_adapter.h"

static mqttContext mqttConn;
static uint8_t mqttTxBuff[CFG_MQTT_TXBUFFER_SIZE];
static uint8_t mqttRxBuff[CFG_MQTT_RXBUFFER_SIZE];
static int8_t  mqqtSocket = -1;

static int lastSentSize;

void MQTT_ClientInitialise(void)
{
	MQTT_initialiseState();
	memset(mqttTxBuff, 0 , sizeof(CFG_MQTT_TXBUFFER_SIZE));
	memset(mqttRxBuff, 0 , sizeof(CFG_MQTT_RXBUFFER_SIZE));
	mqttConn.mqttDataExchangeBuffers.txbuff.start = mqttTxBuff;
	mqttConn.mqttDataExchangeBuffers.txbuff.bufferLength = CFG_MQTT_TXBUFFER_SIZE;
	mqttConn.mqttDataExchangeBuffers.txbuff.currentLocation = mqttConn.mqttDataExchangeBuffers.txbuff.start;
	mqttConn.mqttDataExchangeBuffers.txbuff.dataLength = 0;
	mqttConn.mqttDataExchangeBuffers.rxbuff.start = mqttRxBuff;
	mqttConn.mqttDataExchangeBuffers.rxbuff.bufferLength = CFG_MQTT_RXBUFFER_SIZE;
	mqttConn.mqttDataExchangeBuffers.rxbuff.currentLocation = mqttConn.mqttDataExchangeBuffers.rxbuff.start;
	mqttConn.mqttDataExchangeBuffers.rxbuff.dataLength = 0;
   
   mqttConn.tcpClientSocket = &mqqtSocket;
}

mqttContext* MQTT_GetClientConnectionInfo()
{
	return &mqttConn;
}


bool MQTT_Send(mqttContext *connectionPtr)
{
	bool ret = false;
	if((lastSentSize = BSD_send(*connectionPtr->tcpClientSocket, connectionPtr->mqttDataExchangeBuffers.txbuff.start, connectionPtr->mqttDataExchangeBuffers.txbuff.dataLength, 0)) > BSD_SUCCESS)
	{
		ret = true;
	}
	return ret;
}

int MQTT_LastSentSize (void)
{
	return lastSentSize;
}

bool MQTT_Close(mqttContext *connectionPtr)
{
	bool ret = false;
	if(BSD_close(*connectionPtr->tcpClientSocket) == BSD_SUCCESS)
	{
		ret = true;
	}
	return ret;
}

void MQTT_GetReceivedData(uint8_t *pData, uint8_t len)
{
	MQTT_ExchangeBufferInit(&mqttConn.mqttDataExchangeBuffers.rxbuff);
	MQTT_ExchangeBufferWrite(&mqttConn.mqttDataExchangeBuffers.rxbuff, pData, len);
}
