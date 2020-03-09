/**
 *
 * \file
 *
 * \brief WINC1500 configuration.
 *
 * Copyright (c) 2018 Microchip Technology Inc. and its subsidiaries.
 *
 * \asf_license_start
 *
 * \page License
 *
 * Subject to your compliance with these terms, you may use Microchip
 * software and any derivatives exclusively with Microchip products.
 * It is your responsibility to comply with third party license terms applicable
 * to your use of third party software (including open source software) that
 * may accompany Microchip software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
 * INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY,
 * AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE
 * LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL
 * LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE
 * SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE
 * POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE FULLEST EXTENT
 * ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN ANY WAY
 * RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
 * THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * \asf_license_stop
 *
 */
/*
 * Support and FAQ: visit <a href="https://www.microchip.com/support/">Microchip Support</a>
 */

#ifndef CONF_WINC_H_INCLUDED
#define CONF_WINC_H_INCLUDED

/* Define only on MCU little endian architectures */
#define CONF_WINC_MCU_ARCH_LITTLE_ENDIAN

/* Define if _Static_assert/static_assert is not supported on this tool chain */
#define CONF_WINC_HIF_STRUCT_SIZE_CHECK(STRUCTNAME)

#include "../winc/include/conf_winc_defaults.h"
#include "../winc/m2m/m2m_wifi.h"
#include "../winc/socket/socket.h"

/* Debug Options */
//#define CONF_WINC_DEBUG_LEVEL                       3
//#define CONF_WINC_PRINTF                            printf
//#define CONF_WINC_ASSERT

/* Define macro to swap endianness of 32-bit unsigned integer */
#define CONF_WINC_UINT32_SWAP(U32)                  ((((U32) & 0x000000FF) << 24) | (((U32) & 0x0000FF00) << 8) | (((U32) & 0x00FF0000) >> 8) | (((U32) & 0xFF000000) >> 24))

/* Define macro to swap endianness of 16-bit unsigned integer */
#define CONF_WINC_UINT16_SWAP(U16)                  ((((U16) & 0x00FF) << 8) | (((U16)  & 0xFF00) >> 8))

/* Define to allow legacy definitions of types and preprocessor macros */
//#define CONF_WINC_LEGACY_DEFINITIONS

/* Define if the socket API is exposed or not to the application */
//#define CONF_WINC_DISABLE_SOCKET_API

// <h> WLAN Configuration

// <s> SSID
// <i> Target WLAN SSID
// <id> main_wlan_ssid
#define CFG_MAIN_WLAN_SSID "MCHP.IOT"

// <y> Authentication
// <i> Target WLAN Authentication
// <M2M_WIFI_SEC_INVALID"> Invalid security type
// <M2M_WIFI_SEC_OPEN"> Wi-Fi network is not secured
// <M2M_WIFI_SEC_WPA_PSK"> Wi-Fi network is secured with WPA/WPA2 personal(PSK)
// <M2M_WIFI_SEC_WEP"> Security type WEP (40 or 104) OPEN OR SHARED
// <M2M_WIFI_SEC_802_1X"> Wi-Fi network is secured with WPA/WPA2 Enterprise.IEEE802.1x user-name/password authentication
// <id> main_wlan_auth
#define CFG_MAIN_WLAN_AUTH M2M_WIFI_SEC_WPA_PSK

// <s> Password
// <i> Target WLAN password
// <id> main_wlan_psk
#define CFG_MAIN_WLAN_PSK "microchip"

// </h>

// <h> AP Mode Configuration

// <s> Name
// <i> AP name
// <id> wlan_ap_name
#define CFG_WLAN_AP_NAME "MCHP.IOT.ACCESSPOINT"

// <s> IP Address
// <i> AP IP Address
// <id> wlan_ap_ip_address
#define CFG_WLAN_AP_IP_ADDRESS {192, 168, 1, 1}

// </h>

#endif /* CONF_WINC_H_INCLUDED */
