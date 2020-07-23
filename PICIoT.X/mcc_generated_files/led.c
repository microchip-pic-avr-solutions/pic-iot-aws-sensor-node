/*
    \file   led.c

    \brief  Manage board LED's

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

#include "mcc.h"
#include "delay.h"
#include "led.h"
#include "drivers/timeout.h"
#include "config/mqtt_config.h"


#define LEDS_TEST_INTERVAL	(50L)
#define LED_ON              (0)
#define LED_OFF             (1)

// All LEDs are off at start-up
ledControl_type ledParameterBlue = {SOLID_OFF, SOLID_ON, BLUE};
ledControl_type ledParameterGreen = {SOLID_OFF, SOLID_ON, GREEN};
ledControl_type ledParameterYellow = {SOLID_OFF, SOLID_ON, YELLOW};
ledControl_type ledParameterRed = {SOLID_OFF, SOLID_ON, RED};

static timerStruct_t onTimerBlue;
static timerStruct_t offTimerBlue;
static timerStruct_t onTimerGreen;
static timerStruct_t offTimerGreen;
static timerStruct_t onTimerYellow;
static timerStruct_t offTimerYellow;
static timerStruct_t onTimerRed;
static timerStruct_t offTimerRed;

static uint32_t LED_onServiceBlue(void *payload);
static uint32_t LED_offServiceBlue(void *payload);
static uint32_t LED_onServiceGreen(void *payload);
static uint32_t LED_offServiceGreen(void *payload);
static uint32_t LED_onServiceYellow(void *payload);
static uint32_t LED_offServiceYellow(void *payload);
static uint32_t LED_onServiceRed(void *payload);
static uint32_t LED_offServiceRed(void *payload);



static uint32_t LED_onServiceBlue(void *payload)
{
    ledControl_type *ledParameters = (ledControl_type *)payload;
    timeout_create(&offTimerBlue, ledParameters->onTime);
    LED_BLUE_SetLow();
    return 0;      
}


static uint32_t LED_offServiceBlue(void *payload)
{
    ledControl_type *ledParameters = (ledControl_type *)payload;
    timeout_create(&onTimerBlue, ledParameters->offTime);   
    LED_BLUE_SetHigh(); // LED is off for offTime till the onTimerBlue callback function is called
    return 0;  
}

static uint32_t LED_onServiceGreen(void *payload)
{
    ledControl_type *ledParameters = (ledControl_type *)payload;
    timeout_create(&offTimerGreen, ledParameters->onTime);
    LED_GREEN_SetLow();
    return 0;      
}


static uint32_t LED_offServiceGreen(void *payload)
{
    ledControl_type *ledParameters = (ledControl_type *)payload;
    timeout_create(&onTimerGreen, ledParameters->offTime);   
    LED_GREEN_SetHigh(); // LED is off for offTime till the onTimerGreen callback function is called
    return 0;  
}

static uint32_t LED_onServiceYellow(void *payload)
{
    ledControl_type *ledParameters = (ledControl_type *)payload;
    timeout_create(&offTimerYellow, ledParameters->onTime);
    LED_YELLOW_SetLow();
    return 0;      
}


static uint32_t LED_offServiceYellow(void *payload)
{
    ledControl_type *ledParameters = (ledControl_type *)payload;
    timeout_create(&onTimerYellow, ledParameters->offTime);   
    LED_YELLOW_SetHigh(); // LED is off for offTime till the onTimerYellow callback function is called
    return 0;  
}


static uint32_t LED_onServiceRed(void *payload)
{
    ledControl_type *ledParameters = (ledControl_type *)payload;
    timeout_create(&offTimerRed, ledParameters->onTime);
    LED_RED_SetLow();
    return 0;      
}


static uint32_t LED_offServiceRed(void *payload)
{
    ledControl_type *ledParameters = (ledControl_type *)payload;
    timeout_create(&onTimerRed, ledParameters->offTime);   
    LED_RED_SetHigh(); // LED is off for offTime till the onTimerRed callback function is called
    return 0;  
}

void LED_control(ledControl_type *ledParameters)
{
    void *parameters = (void *)ledParameters;
    switch(ledParameters->ledColor)
    {
        case BLUE:
            timeout_delete(&offTimerBlue);
            timeout_delete(&onTimerBlue);
            if(ledParameters->offTime == 0)
            {
                // LED should turn solid ON
                LED_BLUE_SetLow();
            }
            else if(ledParameters->onTime == 0)
            {
                // LED should turn solid off
                LED_BLUE_SetHigh();
            }
            else
            {
                onTimerBlue.payload = parameters;
                offTimerBlue.payload = parameters;
                onTimerBlue.callbackPtr = LED_onServiceBlue;
                offTimerBlue.callbackPtr = LED_offServiceBlue;

                timeout_create(&onTimerBlue, ledParameters->onTime);
            }
        break;
        case GREEN:
            timeout_delete(&offTimerGreen);
            timeout_delete(&onTimerGreen);
            if(ledParameters->offTime == 0)
            {
                LED_GREEN_SetLow();
            }
            else if(ledParameters->onTime == 0)
            {
                LED_GREEN_SetHigh();
            }
            else
            {
                onTimerGreen.payload = parameters;
                offTimerGreen.payload = parameters;
                onTimerGreen.callbackPtr = LED_onServiceGreen;
                offTimerGreen.callbackPtr = LED_offServiceGreen;

                timeout_create(&onTimerGreen, ledParameters->onTime);
            }
        break;
        case YELLOW:            
            timeout_delete(&offTimerYellow);
            timeout_delete(&onTimerYellow);
            if(ledParameters->offTime == 0)
            {
                LED_YELLOW_SetLow();
            }
            else if(ledParameters->onTime == 0)
            {
                LED_YELLOW_SetHigh();
            }
            else
            {
                onTimerYellow.payload = parameters;
                offTimerYellow.payload = parameters;
                onTimerYellow.callbackPtr = LED_onServiceYellow;
                offTimerYellow.callbackPtr = LED_offServiceYellow;

                timeout_create(&onTimerYellow, ledParameters->onTime);
            }
        break;
        case RED:
            timeout_delete(&offTimerRed);
            timeout_delete(&onTimerRed);
            if(ledParameters->offTime == 0)
            {
                LED_RED_SetLow();
            }
            else if(ledParameters->onTime == 0)
            {
                LED_RED_SetHigh();
            }
            else
            {
                onTimerRed.payload = parameters;
                offTimerRed.payload = parameters;
                onTimerRed.callbackPtr = LED_onServiceRed;
                offTimerRed.callbackPtr = LED_offServiceRed;

                timeout_create(&onTimerRed, ledParameters->onTime);
            }
        break;
        default:
        break;
    }
}


static void testSequence (uint8_t ledState)
{
    if(LED_OFF == ledState)
    {
        LED_BLUE_SetHigh();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
        LED_GREEN_SetHigh();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
        LED_YELLOW_SetHigh();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
        LED_RED_SetHigh();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
    } 
    else 
    {
        LED_BLUE_SetLow();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
        LED_GREEN_SetLow();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
        LED_YELLOW_SetLow();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
        LED_RED_SetLow();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
    }
}

void LED_test(void)
{
    testSequence(LED_ON);
    testSequence(LED_OFF);
}
