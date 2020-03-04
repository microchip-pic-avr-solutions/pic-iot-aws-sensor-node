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
 *                           mqtt_comm_layer.c
 *
 * About:
 *  MQTT communication layer to abstract the TCP function calls. Intermediate 
 *  layer linking the core of the MQTT Client to the MQTT TCP Connection 
 *  handler. It is this layer that provides the abstracted APIs for sending and 
 *  receiving TCP packets to the MQTT Client on one side, and for establishing
 *  TCP communication to the MQTT Connection Handler on the other. If a 
 *  different TCP library usage than the one being currently used (TCPIP Lite 
 *  library) is required, this is the only layer which will need changes thus 
 *  keeping the MQTT Client core independent of the underlying TCP library being 
 *  used.
 *
 * 
 ******************************************************************************/

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "mqtt_comm_layer.h"


/**********************Function implementations********************************/

socketState_t MQTT_SocketPoll(mqttContext *connectionPtr)
{
    socketState_t ret;
    
    ret = TCP_SocketPoll(&connectionPtr->tcbInfo);
    
    return ret;
}


error_msg MQTT_SocketInit(mqttContext *connectionPtr)
{
    error_msg ret = ERROR;
    
    ret = TCP_SocketInit(&connectionPtr->tcbInfo);
    
    return ret;
}


error_msg MQTT_InsertRxBuffer(mqttContext *connectionPtr)
{
    error_msg ret = ERROR;
    
    ret = TCP_InsertRxBuffer(&connectionPtr->tcbInfo, connectionPtr->mqttDataExchangeBuffers.rxbuff.start, connectionPtr->mqttDataExchangeBuffers.rxbuff.bufferLength);
    
    return ret;
}
            

error_msg MQTT_SocketConnect(mqttContext *connectionPtr, sockaddr_in4_t *srvaddr)
{
    error_msg ret = ERROR;
    
    ret = TCP_Connect(&connectionPtr->tcbInfo, srvaddr);
    
    return ret;
}


error_msg MQTT_Close(mqttContext *connectionPtr)
{
    error_msg ret = ERROR;
    
    ret =  TCP_Close(&connectionPtr->tcbInfo);
    
    return ret;
}


int16_t MQTT_GetReceivedData(mqttContext *connectionPtr)
{
    int16_t length = 0;
    
    length = TCP_GetReceivedData(&connectionPtr->tcbInfo);
    
    return length;
}



bool MQTT_Send(mqttContext *connectionPtr)
{
    bool ret = false;
    
    if(TCP_Send(&connectionPtr->tcbInfo, connectionPtr->mqttDataExchangeBuffers.txbuff.start, connectionPtr->mqttDataExchangeBuffers.txbuff.dataLength) == SUCCESS)
    {
        ret = true;
    }
    return ret;
}


error_msg MQTT_SocketRemove(mqttContext *connectionPtr)
{
    error_msg ret = ERROR;
    
    ret = TCP_SocketRemove(&connectionPtr->tcbInfo);
    
    return ret;
}



/**********************Function implementations*(END)**************************/