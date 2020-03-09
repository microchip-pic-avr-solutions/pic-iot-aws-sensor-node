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
 *                           mqtt_comm_layer.h
 *
 * About:
 *  Definition of the MQTT Communication Layer which provides abstraction of TCP 
 *  communication APIs for MQTT client.
 *
 * 
 ******************************************************************************/

#ifndef MQTT_CONNECTION_LAYER_H
#define	MQTT_CONNECTION_LAYER_H

#include <stdint.h>
#include <stdbool.h>
#include "tcpv4.h"
#include "tcpip_types.h"
#include "mac_address.h"
#include "../mqtt_exchange_buffer/mqtt_exchange_buffer.h"

/** \brief MQTT connection information
 *
 * This is used by the application to store TCB, transmit buffer and receive 
 * buffer information. 
 */
typedef struct
{
   tcpTCB_t tcbInfo;
   mqttBuffers mqttDataExchangeBuffers;
} mqttContext;


/** The function will provide an interface to read the status of the socket.
 *  This function internally calls the TCP_SocketPoll() from the TCPIP Lite
 *  library.
 * 
 * @param connectionPtr 
 *      pointer to MQTT connection information
 *
 * @return
 *      the socket state
 */
socketState_t MQTT_SocketPoll(mqttContext *connectionPtr);


/** Initialize the TCB for MQTT communication. This function internally calls
 * the TCP_SocketInit() from TCPIP Lite library which in turn puts the socket 
 * in the CLOSED state.
 *
 * The user is responsible to manage allocation and releasing of the memory.
 * 
 * @param connectionPtr
 *      pointer to MQTT connection information
 * 
 * @return
 *      ERROR if socket is not initialised for MQTT TCP connection
 * @return
 *      SUCCESS if the socket initialisation for MQTT was successful
 */
error_msg MQTT_SocketInit(mqttContext *connectionPtr);


/** Add the RX buffer to the socket for receiving MQTT packets. This function 
 * internally calls the TCP_InsertRxBuffer() function from the TCPIP Lite 
 * library
 *
 * @param connectionPtr
 *      pointer to MQTT connection information
 *
 * @return
 *      SUCCESS - The RX buffer was passed to socket successfully
 * @return
 *      ERROR - passing of the RX buffer to the socket failed.
 */
error_msg MQTT_InsertRxBuffer(mqttContext *connectionPtr);


/** Start the MQTT client for a specific socket. This function internally calls
 * TCP_Connect() from the TCPIP Lite library.
 *  
 * @param connectionPtr
 *      pointer to MQTT connection information
 * 
 * @param srvaddr
 *      port number and address used for establishing MQTT connection. 
 * 
 * @return
 *      SUCCESS - The server was started successfully
 * @return
 *      ERROR - The starting of the server fails
 */
error_msg MQTT_SocketConnect(mqttContext *connectionPtr, sockaddr_in4_t *srvaddr);


/** Close the MQTT connection. This function internally calls
 * TCP_Close() from the TCPIP Lite library. This will initiate the closing 
 * sequence for the TCP connection being used for MQTT.
 * 
 * @param connectionPtr
 *      pointer to MQTT connection information
 * 
 * @return
 *      SUCCESS - The close procedure was started successfully
 * @return
 *      ERROR - The close procedure failed
 */
error_msg MQTT_Close(mqttContext *connectionPtr);


/** This function reads the available data from the MQTT socket. This function 
 * internally calls TCP_GetReceivedData() from the TCPIP Lite library. 
 * 
 * @param connectionPtr
 *      pointer to MQTT connection information
 * 
 * @return
 *      Number of bytes received in the MQTT packet
 *      
 */
int16_t MQTT_GetReceivedData(mqttContext *connectionPtr);


/** Send a data to MQTT server using TCP connection.This function 
 * internally calls TCP_Send() from the TCPIP Lite library.
 * 
 * @param connectionPtr
 *      pointer to MQTT connection information
 * 
 * @return
 *      true - The data buffer was added to the socket/TCB successfully
 * @return
 *      false - Adding the data buffer to the socket failed
 */
bool MQTT_Send(mqttContext *connectionPtr);


/** Remove the socket pointer being used for MQTT connection from the TCP Stack.
 * This function internally calls TCP_SocketRemove() from the TCPIP Lite 
 * library.
 * 
 * @param connectionPtr
 *      pointer to MQTT connection information
 * 
 * @return
 *      ERROR if there was any problems
 * @return
 *       SUCCESS if the socket removal was successful
 */
error_msg MQTT_SocketRemove(mqttContext *connectionPtr);


#endif	/* MQTT_CONNECTION_LAYER_H */

