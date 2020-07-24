/*
    \file   time_service.c

    \brief  Manage Application's Time Service Requirements

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
#include <time.h>
#include "time_service.h"
//#include "timeout.h"
#include "drivers/timeout.h"
#include "tmr2.h"

static uint32_t timeTicker(void *payload);
static timerStruct_t timeTask = {timeTicker};

static uint32_t currentTime = 0; 
static uint32_t stampTime = 0; 

#define ONE_SECOND_TICKER	1000L
// Default to 0 (PIC) if type is undefined
#define TIME_OFFSET 0

void TIME_setCurrent(uint32_t newTime)
{
	currentTime = newTime;
}

uint32_t TIME_getCurrent(void)
{
	return currentTime;
}

void TIME_setStamp(uint32_t newStamp)
{
	stampTime = newStamp;
}

uint32_t TIME_getStamp(void)
{
	return stampTime;
}

static uint32_t timeTicker(void *payload)
{
	currentTime++;	// Increment Reference each Second
	return ONE_SECOND_TICKER;	// Reload to call self
}

void TIME_startTask(void)
{
   timeout_create(&timeTask, ONE_SECOND_TICKER);
}

void TIME_endTask(void)
{
   timeout_delete(&timeTask);	
}

uint32_t TIME_getOffset_UNIX(void)
{
	return TIME_OFFSET;
}

char *TIME_GetcTime(uint32_t timeToConvert)
{
    return ctime((const time_t*)&timeToConvert);
}

int32_t TIME_getDiffTime(int32_t diffTime1, int32_t diffTime0)
{
	return difftime((time_t)diffTime1, (time_t)diffTime0);
}

void TIME_ntpTimeStamp(tstrSystemTime* WINCTime)
{
	struct tm theTime;
	uint32_t mkTimeResult = 0;
// Convert to UNIX_EPOCH, this mktime uses years since 1900 and months are 0 based so we
//    are doing a couple of adjustments here.
	theTime.tm_hour = WINCTime->u8Hour;
	theTime.tm_min = WINCTime->u8Minute;
	theTime.tm_sec = WINCTime->u8Second;
	theTime.tm_year = WINCTime->u16Year-1900;
	theTime.tm_mon = WINCTime->u8Month-1;
	theTime.tm_mday = WINCTime->u8Day;
	theTime.tm_isdst = 0;
// Capture and Store
	mkTimeResult = mktime(&theTime);
	TIME_setCurrent(mkTimeResult);
    TMR2_Counter32BitSet(mkTimeResult);
}