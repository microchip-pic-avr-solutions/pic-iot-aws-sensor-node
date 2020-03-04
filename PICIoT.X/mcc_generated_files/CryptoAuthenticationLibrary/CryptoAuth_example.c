/*

 * \file
 * \brief CryptoAuthLib Basic API methods - a simple crypto authentication API.
 * These methods manage a global ATCADevice object behind the scenes. They also
 * manage the wake/idle state transitions so callers don't need to.
 *
 * \copyright (c) 2015-2018 Microchip Technology Inc. and its subsidiaries.
 *
 * \page License
 *
 * Subject to your compliance with these terms, you may use Microchip software
 * and any derivatives exclusively with Microchip products. It is your
 * responsibility to comply with third party license terms applicable to your
 * use of third party software (including open source software) that may
 * accompany Microchip software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
 * PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT,
 * SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE
 * OF ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF
 * MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
 * FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL
 * LIABILITY ON ALL CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED
 * THE AMOUNT OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR
 * THIS SOFTWARE.
*/

#include "CryptoAuth_example.h"
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


void CryptoAuth_Example(void){
    
    uint8_t random_number[32];
    uint8_t serial_number[9];
    int i = 0;
    int j = 0;
    int loop = 10;

    while(loop--)
    {
        atcab_read_serial_number(serial_number);
        
        printf("Serial Number: \r\n");
         
        while (i < 9) {
                printf("%02X ", serial_number[i]);
                i++;
            }
            printf("\r\n");
            printf("\r\n");
            
            i = 0;
            
        atcab_random(random_number);

        printf("Generated 32-byte Random Number: \r\n");
         
        while (i < 32) {
            while (j < 4) {
                printf("0x%02X ", random_number[i]);
                j++;
                i++;
            }
            printf("\r\n");
            j = 0;
        }
        printf("\r\n");
        i = 0;
        j = 0;
        
    }
    
    
    printf("\r\n");
    
}
    
