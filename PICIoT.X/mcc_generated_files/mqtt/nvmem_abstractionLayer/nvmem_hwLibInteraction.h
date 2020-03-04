/********************************************************************
 *
 ? [2018] Microchip Technology Inc. and its subsidiaries.

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
 *                           nvmem_hwLibInteraction.h
 *
 * About:
 *  Abstraction layer for non-volatile memory usage between MQTT client and the 
 * hardware platform being used.
 *
 ******************************************************************************/

#ifndef MQTT_HW_LIB_INTERACTION_H
#define	MQTT_HW_LIB_INTERACTION_H

#include <stdint.h>


/***********************MQTT Client definitions********************************/

#define MQTT_VALIDITY_CHECK_ADDR            0x00
#define MQTT_CLIENT_ID_ADDR                 0x01
#define MQTT_CLIENT_ID_CREATED              0xAA

/** \brief Read a byte from non-volatile memory.
 * 
 * @param location Location of the byte, in the range [0..(last memory location in device EEPROM/ external EEPROM)-1].
 * @return Value read from non-volatile memory.
 */
uint8_t nvmem_readByte(uint32_t location);


/** \brief Write a byte to non-volatile memory.
 * 
 * @param location Location of the byte, in the range [0..(last memory location in device EEPROM/ external EEPROM)-1].
 * @param value Value that needs to be written to non-volatile memory.
 */
void nvmem_writeByte(uint32_t location, uint8_t value);


/** \brief Read a block of data from non-volatile memory.
 * 
 * @param location Location of the byte, in the range [0..(last memory location in device EEPROM/ external EEPROM)-1].
 * @param data Pointer to the buffer location created for storing the read data.
 * @param numOfBytes Total number of bytes to read from non-volatile memory.
 */
void nvmem_readBlock(uint32_t location, uint8_t *data, uint8_t numOfBytes);


/** \brief Write a block of data to non-volatile memory.
 *
 * @param location Location of the byte, in the range [0..(last memory location in device EEPROM/ external EEPROM)-1].
 * @param data Pointer to the buffer location created for storing the data to be written.
 * @param numOfBytes Total number of bytes to be written to non-volatile memory.
 */
void nvmem_writeBlock(uint32_t location, uint8_t *data, uint8_t numOfBytes);




#endif	/* MQTT_HW_LIB_INTERACTION_H */

