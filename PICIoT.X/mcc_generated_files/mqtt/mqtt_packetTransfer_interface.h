/*
    \file   mqtt_packetTransfer_interface.h

    \brief  MQTT Packet Transfer Interface  header file.

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
#ifndef MQTT_PACKET_TRANSFER_INTERFACE_H
#define	MQTT_PACKET_TRANSFER_INTERFACE_H

#include <stdint.h>

/*********************MQTT Interface layer definitions*************************/
/** \brief Function pointer for interaction between the MQTT core and user 
 * application to transfer the information received as part of the published  
 * packet to the application.
 **/
typedef void (*imqttHandlePublishDataFuncPtr)(uint8_t *topic, uint8_t *payload); 

/*******************MQTT Interface layer definitions*(END)*********************/

/** \brief Set the publish reception handler information.
 *
 * This function is called by the user application to inform the MQTT core of 
 * the call back table defined to handle the received PUBLISH messages. 
 *
 * @param appPublishReceptionCallback Instance of imqttHandlePublishDataFuncPtr 
 *                                    to handle PUBLISH messages received for 
 *                                    each topic.
 */
void MQTT_SetPublishReceptionCallback(imqttHandlePublishDataFuncPtr appPublishReceptionCallback);

/** \brief Obtain the imqttHandlePublishDataFuncPtr callback information defined  
 * in the user application for processing messages received over the subscribed 
 * topic. 
 *
 * Whenever a PUBLISH packet is received by the MQTT core, the publish handler
 * returned by this function is called to process the PUBLISH packet.
 *
 * @return generic publish reception handler defined in the user application
 */
imqttHandlePublishDataFuncPtr MQTT_GetPublishReceptionCallback(void);

#endif	/* MQTT_PACKET_TRANSFER_INTERFACE_H */

