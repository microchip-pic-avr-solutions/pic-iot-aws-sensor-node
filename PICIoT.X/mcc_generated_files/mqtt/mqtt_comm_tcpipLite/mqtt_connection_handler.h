/********************************************************************
 *
 * Copyright (C) 2014 Microchip Technology Inc. and its subsidiaries
 * (Microchip).  All rights reserved.
 *
 * You are permitted to use the software and its derivatives with Microchip
 * products. See the license agreement accompanying this software, if any, for
 * more info about your rights and obligations.
 *
 * SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
 * MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR
 * PURPOSE. IN NO EVENT SHALL MICROCHIP, SMSC, OR ITS LICENSORS BE LIABLE OR
 * OBLIGATED UNDER CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH
 * OF WARRANTY, OR OTHER LEGAL EQUITABLE THEORY FOR ANY DIRECT OR INDIRECT
 * DAMAGES OR EXPENSES INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL,
 * INDIRECT OR CONSEQUENTIAL DAMAGES, OR OTHER SIMILAR COSTS. To the fullest
 * extend allowed by law, Microchip and its licensors liability will not exceed
 * the amount of fees, if any, that you paid directly to Microchip to use this
 * software.
 *************************************************************************
 *
 *                           mqtt_connection_handler.h
 *
 * About:
 *  Definition of the MQTT TCP Connection 
 *
 * 
 ******************************************************************************/
#ifndef MQTT_CONNECTION_HANDLER_H
#define MQTT_CONNECTION_HANDLER_H

#include <stdint.h>


typedef struct
{
    uint8_t *ipAddress;
    uint16_t mqttTCPCommunicationPortNumber;
    uint8_t *txDataBuffer;
    uint8_t txDataBufferLength;
    uint8_t *rxDataBuffer;
    uint8_t rxDataBufferLength;
} mqttConnectionInfo;


// ToDo Add description of APIs
void MQTT_ClientInitialise(mqttConnectionInfo *mqttClientInfo);


void MQTT_SetBrokerIPAddr(uint8_t *ipAddress);


void MQTT_SetTCPConnectionPort(uint16_t mqttTCPCommunicationPort);


void MQTT_SetTxDataBuffer(uint8_t *txDataBuffer, uint8_t txDataBufferLength);


void MQTT_SetRxDataBuffer(uint8_t *rxDataBuffer, uint8_t rxDataBufferLength);


void MQTT_Manage(void);


void DEMO_TCP_Client(void);


void TCP_Client_Initialize();

#endif	/* MQTT_CONNECTION_HANDLER_H */
