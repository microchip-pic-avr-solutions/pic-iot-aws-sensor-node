/*
    \file   credentials_storage.h

    \brief  Credential Storage header file.

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


#ifndef CREDENTIALS_STORAGE_H
#define CREDENTIALS_STORAGE_H

#include "../winc/m2m/m2m_types.h"

#define MAX_NTP_SERVER_LENGTH	20

extern char ssid[M2M_MAX_SSID_LEN];
extern char pass[M2M_MAX_PSK_LEN];
extern char authType[2];
extern char ntpServerName[MAX_NTP_SERVER_LENGTH];

void CREDENTIALS_STORAGE_clearWifiCredentials(void);
void CREDENTIALS_STORAGE_readNTPServerName(char *serverNameBuffer);
void CREDENTIALS_STORAGE_writeNTPServerName(char *serverNameBuffer);

#endif /* CREDENTIALS_STORAGE_H */