/*
    \file   led.h

    \brief  led header file.

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


#ifndef LED_H_
#define LED_H_
#include <stdint.h>
#include <stdbool.h>

#define LED_ON_STATIC   0x00        // OFF
#define LED_BLINK       0x55        // On-Off @ 250 mSec Interval
#define LED_BLIP        0x33        // On 500 @ mSec mSec Interval
#define LED_1_SEC_ON    0x0F        // On 1 Sec, Off Remaining
#define LED_OFF_STATIC  0xFF

typedef union
{
    uint8_t Full2Sec;
    struct
    {
        unsigned tick0 : 1;
        unsigned tick1 : 1;
        unsigned tick2 : 1;
        unsigned tick3 : 1;
        unsigned tick4 : 1;
        unsigned tick5 : 1;
        unsigned tick6 : 1;
        unsigned tick7 : 1;
    };
} ledTickState_t;

void LED_serviceInit();
void LED_test(void);

void LED_modeRed(ledTickState_t configLed_2SecLoop);
void LED_modeBlue(ledTickState_t configLed_2SecLoop);
void LED_modeGreen(ledTickState_t configLed_2SecLoop);
void LED_modeYellow(ledTickState_t configLed_2SecLoop);
#endif /* LED_H_ */
