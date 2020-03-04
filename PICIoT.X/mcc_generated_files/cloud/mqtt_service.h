/*
    \file   mqtt_service.h

    \brief  Application MQTT Service header file.

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
#ifndef MQTT_SERVICE_H
#define MQTT_SERVICE_H

#include <stdbool.h>
#include <stdint.h>
#include "../mqtt/mqtt_packetTransfer_interface.h"


extern char cid[];
extern char awsEndpoint[];

// The call back table prototype for sending the payload received as part of  
// PUBLISH packet to the correct publish reception handler function defined in     
// the application manager. An instance of this table needs to be initialised by  
// the user application to specify the total number of topics to subscribe to,  
// the path of each topic and the call back function for handling the payload 
// received as part of the PUBLISH packet.
typedef struct
{
    uint8_t *topic;
    imqttHandlePublishDataFuncPtr mqttHandlePublishDataCallBack;
} publishReceptionHandler_t;


void MQTT_CLIENT_publish(uint8_t* refToPublishTopic, uint8_t *data, uint16_t len);
bool MQTT_CLIENT_subscribe(void);
void MQTT_CLIENT_receive(uint8_t *data, uint8_t len);
void MQTT_CLIENT_connect(void);

/** \brief Set the publish reception handler table information.
 *
 * This function is called by the user application to inform the MQTT core of 
 * the call back table defined to handler the received PUBLISH messages. 
 *
 * @param appPublishReceptionInfo Instance of publishReceptionHandler_t with
 *                                callback functions to handle PUBLISH messages 
 *                                received for each topic
 */
void MQTT_SetPublishReceptionHandlerTable(publishReceptionHandler_t *appPublishReceptionInfo);

/** \brief Obtain the publishReceptionHandler_t table information defined in the 
 * user application that the application. 
 *
 * Whenever a PUBLISH baclet is received by the MQTT core, the publish handlers
 * returned by this function are called to process the payload of the PUBLISH 
 * packet.
 *
 * @return publish reception handler details defined in the user application
 */
publishReceptionHandler_t *MQTT_GetPublishReceptionHandlerTable();

#endif /* MQTT_SERVICE_H */