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
 *                           nvmem_hwLibInteraction.c
 *
 * About:
 *  MQTT hardware abstraction layer implementation. This file implements the
 * APIs for handling the hardware dependent sections of the library. The 
 * function calls inside these APIs need to be replaced with hardware specific 
 * function calls depending on the device being used. 
 *
 * 
 ******************************************************************************/

#include <xc.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <time.h>
#include "nvmem_hwLibInteraction.h"
#include "memory.h"

/**********************Function implementations********************************/

uint8_t nvmem_readByte(uint32_t location)
{
    return DATAEE_ReadByte(location);
}


void nvmem_writeByte(uint32_t location, uint8_t value)
{
    DATAEE_WriteByte(location, value);
}


void nvmem_readBlock(uint32_t location, uint8_t *data, uint8_t numOfBytes)
{
    uint8_t i;
    
    for(i = 0; i < numOfBytes; i++)
    {
        data[i] = nvmem_readByte(location);
        location++;
    }
}


void nvmem_writeBlock(uint32_t location, uint8_t *data, uint8_t numOfBytes)
{
    uint8_t i;
    
    for(i = 0; i < numOfBytes; i++)
    {
        nvmem_writeByte(location, data[i]);
        location++;
    }
}



/**********************Function implementations*(END)**************************/