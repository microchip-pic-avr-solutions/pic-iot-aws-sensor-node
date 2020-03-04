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

#include <stdbool.h>
#include "mcc.h"
#include "delay.h"
#include "led.h"
#include "drivers/timeout.h"
#include "config/mqtt_config.h"

#define LED_ON				false
#define LED_OFF				true
#define LEDS_TEST_INTERVAL	50L
#define LED_SERVICE_INTERVAL 250L

static ledTickState_t redLed_2SecLoop;
static ledTickState_t yellowLed_2SecLoop;
static ledTickState_t greenLed_2SecLoop;
static ledTickState_t blueLed_2SecLoop;

static uint8_t redTicker = 0;
static uint8_t yellowTicker = 0;
static uint8_t greenTicker = 0;
static uint8_t blueTicker = 0;

static uint32_t LED_service(void *payload);
static timerstruct_t LED_service_timer = {LED_service};



void LED_modeRed(ledTickState_t configLed_2SecLoop)
{
    redLed_2SecLoop.Full2Sec = configLed_2SecLoop.Full2Sec;
    redTicker = 0;    
    }

void LED_modeBlue(ledTickState_t configLed_2SecLoop)
{
    blueLed_2SecLoop.Full2Sec = configLed_2SecLoop.Full2Sec;
    blueTicker = 0; 
}

void LED_modeGreen(ledTickState_t configLed_2SecLoop)
{
    greenLed_2SecLoop.Full2Sec = configLed_2SecLoop.Full2Sec;
    greenTicker = 0;
}

void LED_modeYellow(ledTickState_t configLed_2SecLoop)
{
    yellowLed_2SecLoop.Full2Sec = configLed_2SecLoop.Full2Sec; 
    yellowTicker = 0;
}

static void LED_redService(void)
{
    static bool ledStatus = LED_OFF;  
    switch(redTicker)
    {
        case 0:
            ledStatus = redLed_2SecLoop.tick0;
        break;
        case 1:
            ledStatus = redLed_2SecLoop.tick1;
        break;
        case 2:
            ledStatus = redLed_2SecLoop.tick2;
        break;
        case 3:
            ledStatus = redLed_2SecLoop.tick3;
        break;
        case 4:
            ledStatus = redLed_2SecLoop.tick4;
        break;
        case 5:
            ledStatus = redLed_2SecLoop.tick5;
        break;
        case 6:
            ledStatus = redLed_2SecLoop.tick6;
        break;
        case 7:
            ledStatus = redLed_2SecLoop.tick7;
        break;
        default:
            // This should never be true
        break;  
}

    // Manage LED State
    if (ledStatus == LED_ON)
{
        LED_RED_SetLow();
}
    else
    {
        LED_RED_SetHigh();
    }

    // Reset Ticker
    if (redTicker >= 7)
{
        redTicker = 0;
    }
    else
    {
        redTicker++;
    }
}

static void LED_yellowService(void)
{
    static bool ledStatus = LED_OFF;
    switch(yellowTicker)
    {
        case 0:
        ledStatus = yellowLed_2SecLoop.tick0;
        break;
        case 1:
        ledStatus = yellowLed_2SecLoop.tick1;
        break;
        case 2:
        ledStatus = yellowLed_2SecLoop.tick2;
        break;
        case 3:
        ledStatus = yellowLed_2SecLoop.tick3;
        break;
        case 4:
        ledStatus = yellowLed_2SecLoop.tick4;
        break;
        case 5:
        ledStatus = yellowLed_2SecLoop.tick5;
        break;
        case 6:
        ledStatus = yellowLed_2SecLoop.tick6;
        break;
        case 7:
        ledStatus = yellowLed_2SecLoop.tick7;
        break;
        default:
        // This should never be true
        break;
}

    // Manage LED State
    if (ledStatus == LED_ON)
{
        LED_YELLOW_SetLow();
    }
    else
    {
        LED_YELLOW_SetHigh();
    }

    // Reset Ticker
    if (yellowTicker >= 7)
    {
        yellowTicker = 0;
}
    else
    {
        yellowTicker++;
    }
}

static void LED_greenService(void)
{
    static bool ledStatus = LED_OFF;
    switch(greenTicker)
    {
        case 0:
        ledStatus = greenLed_2SecLoop.tick0;
        break;
        case 1:
        ledStatus = greenLed_2SecLoop.tick1;
        break;
        case 2:
        ledStatus = greenLed_2SecLoop.tick2;
        break;
        case 3:
        ledStatus = greenLed_2SecLoop.tick3;
        break;
        case 4:
        ledStatus = greenLed_2SecLoop.tick4;
        break;
        case 5:
        ledStatus = greenLed_2SecLoop.tick5;
        break;
        case 6:
        ledStatus = greenLed_2SecLoop.tick6;
        break;
        case 7:
        ledStatus = greenLed_2SecLoop.tick7;
        break;
        default:
        // This should never be true
        break;
}

    // Manage LED State
    if (ledStatus == LED_ON)
{
        LED_GREEN_SetLow();
    }
    else
    {
        LED_GREEN_SetHigh();
    }

    // Reset Ticker
    if (greenTicker >= 7)
    {
        greenTicker = 0;
    }
    else
    {
        greenTicker++;
    }
}

static void LED_blueService(void)
{
    static bool ledStatus = LED_OFF;
    switch(blueTicker)
    {
        case 0:
        ledStatus = blueLed_2SecLoop.tick0;
        break;
        case 1:
        ledStatus = blueLed_2SecLoop.tick1;
        break;
        case 2:
        ledStatus = blueLed_2SecLoop.tick2;
        break;
        case 3:
        ledStatus = blueLed_2SecLoop.tick3;
        break;
        case 4:
        ledStatus = blueLed_2SecLoop.tick4;
        break;
        case 5:
        ledStatus = blueLed_2SecLoop.tick5;
        break;
        case 6:
        ledStatus = blueLed_2SecLoop.tick6;
        break;
        case 7:
        ledStatus = blueLed_2SecLoop.tick7;
        break;
        default:
        // This should never be true
        break;
}

    // Manage LED State
    if (ledStatus == LED_ON)
{
        LED_BLUE_SetLow();
    }
    else
    {
        LED_BLUE_SetHigh();
    }

    // Reset Ticker
    if (blueTicker >= 7)
    {
        blueTicker = 0;
}
    else
    {
        blueTicker++;
    }
} 

static uint32_t LED_service(void *payload)
{
    LED_redService();
    LED_blueService();
    LED_greenService();
    LED_yellowService();
    return LED_SERVICE_INTERVAL;
}

static void testSequence (uint8_t ledState)
{
    if(LED_OFF == ledState){
        LED_BLUE_SetHigh();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
        LED_GREEN_SetHigh();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
        LED_YELLOW_SetHigh();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
        LED_RED_SetHigh();
        DELAY_milliseconds(LEDS_TEST_INTERVAL);
    } else {
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

void LED_serviceInit(void)
{
    timeout_create(&LED_service_timer, LED_SERVICE_INTERVAL);
}