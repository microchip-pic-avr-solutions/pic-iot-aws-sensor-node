/*
    \file   time_service.h

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
#ifndef TIME_SERVICE_H_
#define TIME_SERVICE_H_
#include <stdint.h>

#include "winc/m2m/m2m_types.h"

void TIME_setCurrent(uint32_t);
uint32_t TIME_getCurrent(void);
void TIME_setStamp(uint32_t);
uint32_t TIME_getStamp(void);
void Time_startTask(void);
void Time_endTask(void);
uint32_t TIME_getOffset_UNIX(void);
char  *TIME_GetcTime(uint32_t timeToConvert);
int32_t TIME_getDiffTime(int32_t diffTime1, int32_t diffTime0);
void TIME_ntpTimeStamp(tstrSystemTime* WINCTime);

#endif /* TIME_SERVICE_H_ */
