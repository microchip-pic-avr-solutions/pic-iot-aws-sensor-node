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

#define SOLID_ON        (1)
#define SOLID_OFF       (0)
#define LED_BLINK       (250) //ms
#define LED_BLIP        (500) //ms
#define LED_1_SEC_ON    (1000) //ms

typedef enum
{
    RED = 0,
    YELLOW = 1,
    GREEN = 2,
    BLUE = 3
} ledList_type;


typedef struct
{
    uint32_t onTime;
    uint32_t offTime;
    ledList_type ledColor;
} ledControl_type;

// All LEDs are off at start-up
extern ledControl_type ledParameterBlue;
extern ledControl_type ledParameterGreen;
extern ledControl_type ledParameterYellow;
extern ledControl_type ledParameterRed;

void LED_control(ledControl_type *ledParameters);
void LED_test(void);

#endif /* LED_H_ */
