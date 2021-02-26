/*
\file   wifi_service.c

\brief  Wifi service source file.

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
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "../clock.h"
#include <libpic30.h>
#include "../application_manager.h"
#include "../time_service.h"
#include "wifi_service.h"
#include "../winc/m2m/m2m_wifi.h"
#include "../winc/common/winc_defines.h"
#include "../winc/driver/winc_adapter.h"
#include "../drivers/timeout.h"
#include "../cloud/cloud_service.h"
#include "../debug_print.h"
#include "../config/IoT_Sensor_Node_config.h"
#include "../config/conf_winc.h"
#include "../config/mqtt_config.h"
#include "../config/cloud_config.h"
#include "../winc/socket/socket.h"
#include "../credentials_storage/credentials_storage.h"
#include "../led.h"
#include "winc/m2m/m2m_types.h"

#include "cloud/mqtt_service.h"
#include "winc/m2m/m2m_wifi.h"
#include "winc/spi_flash/spi_flash.h"
#include "winc/spi_flash/spi_flash_map.h"
#include "winc/common/winc_defines.h"
#include "config/cloud_config.h"


//Flash location to read thing Name from winc
#define THING_NAME_FLASH_OFFSET (M2M_TLS_SERVER_FLASH_OFFSET + M2M_TLS_SERVER_FLASH_SIZE - FLASH_PAGE_SZ) 
#define AWS_ENDPOINT_FLASH_OFFSET (THING_NAME_FLASH_OFFSET - FLASH_PAGE_SZ)
#define CLOUD_WIFI_TASK_INTERVAL        50L
#define CLOUD_NTP_TASK_INTERVAL         1000L
#define SOFT_AP_CONNECT_RETRY_INTERVAL  1000L

#define MAX_NTP_SERVER_LENGTH           20

// Scheduler
uint32_t ntpTimeFetchTask(void *payload);
uint32_t wifiHandlerTask(void * param);
uint32_t softApConnectTask(void* param);

timerStruct_t softApConnectTimer = {softApConnectTask};
timerStruct_t ntpTimeFetchTimer  = {ntpTimeFetchTask};
timerStruct_t wifiHandlerTimer  = {wifiHandlerTask};
	
uint32_t checkBackTask(void * param);
timerStruct_t checkBackTimer  = {checkBackTask};	
	
static bool responseFromProvisionConnect = false;
       
void (*callback_funcPtr)(uint8_t);
       
void enable_provision_ap(void);
       
// Callback function pointer for indicating status updates upwards
void  (*wifiConnectionStateChangedCallback)(uint8_t  status) = NULL;

// Function to be called by WifiModule on status updates from below
static void wifiCallback(uint8_t msgType, const void *pMsg);

// This is a workaround to wifi_deinit being broken in the winc, so we can de-init without hanging up
int8_t winc_hif_deinit(void * arg);

void wifi_reinit()
{
	tstrWifiInitParam param ;
     
    /* Initialize Wi-Fi parameters structure. */
    memset((uint8_t *)&param, 0, sizeof(tstrWifiInitParam));
     
    param.pfAppWifiCb = wifiCallback;
    socketDeinit();
    winc_hif_deinit(NULL);
    winc_adapter_deinit();

    wifiConnectionStateChangedCallback = callback_funcPtr;

    winc_adapter_init();

    m2m_wifi_init(&param);
    socketInit();
}

// funcPtr passed in here will be called indicating AP state changes with the following values
// Wi-Fi state is disconnected   == 0
// Wi-Fi state is connected      == 1
// Wi-Fi state is undefined      == 0xff
void wifi_init(void (*funcPtr)(uint8_t), uint8_t mode) 
{
    callback_funcPtr = funcPtr;
    
    // This uses the global ptr set above
    wifi_reinit();

    // Mode == 0 means AP configuration mode
    if(mode == WIFI_SOFT_AP)
    {
    	enable_provision_ap();
      	debug_printInfo("ACCESS POINT MODE for provisioning");
    }
    else
    {
      	timeout_create(&ntpTimeFetchTimer,CLOUD_NTP_TASK_INTERVAL);
    }
   
    timeout_create(&wifiHandlerTimer, CLOUD_WIFI_TASK_INTERVAL);
}

void wifi_readThingNameFromWinc(void)
{
    int8_t status;
    status =  m2m_wifi_download_mode();
    
    if(status != M2M_SUCCESS)
    {
        debug_printError("WINC download mode failed - Thing Name cannot be obtained");
    }
    else
    {
        debug_printInfo("WINC in download mode");
        		
	    status = spi_flash_read((uint8_t*)cid, THING_NAME_FLASH_OFFSET,MQTT_CID_LENGTH);        
        if(status != M2M_SUCCESS || (((uint8_t)cid[0]) == 0xFF) || (((uint8_t)cid[MQTT_CID_LENGTH-1]) == 0xFF))
        {
            sprintf(cid, "%s", AWS_THING_NAME); 
            debug_printIoTAppMsg("Thing Name is not present, error type %d, user defined thing ID is used",status);
        }
        else 
        {
            debug_printIoTAppMsg("Thing Name read from the device is %s",cid);
        }
    }
}

void wifi_readAWSEndpointFromWinc(void)
{
    int8_t status;
    
    status =  m2m_wifi_download_mode();
    
    if(status != M2M_SUCCESS)
    {
        debug_printError("WINC download mode failed - AWS Host URL cannot be obtained");
    }
    else
    {        
        debug_printInfo("WINC in download mode");

        status = spi_flash_read((uint8_t*)awsEndpoint, AWS_ENDPOINT_FLASH_OFFSET, AWS_ENDPOINT_LEN);
        if(status != M2M_SUCCESS )
        {
            debug_printError("Error reading AWS Endpoint from WINC");
        }
        else if(((uint8_t)awsEndpoint[0]) == 0xFF)
        {
            debug_printIoTAppMsg("AWS Endpoint is not present in WINC, either re-provision or microchip AWS sandbox endpoint will be used");
        }
        else
        {
            debug_printIoTAppMsg("AWS Endpoint read from WINC is %s",awsEndpoint);  
        }
    }
}

bool wifi_connectToAp(uint8_t passed_wifi_creds)
{
    int8_t wifiError = 0;
    
    if(passed_wifi_creds == NEW_CREDENTIALS)
    {
       wifiError = m2m_wifi_connect(ssid, strlen(ssid), atoi(authType), pass, M2M_WIFI_CH_ALL);
    }
    else
    {
       wifiError =  m2m_wifi_default_connect();
    }
    
    if(M2M_SUCCESS != wifiError)
    {
      debug_printError("WIFI: wifi error = %d",wifiError);
      shared_networking_params.haveError = 1;
      return false;
    }
    
    return true;
}

uint32_t softApConnectTask(void *param)
{
    if(!wifi_connectToAp((uint8_t)NEW_CREDENTIALS))
    {
        debug_printError("WIFI: Soft AP Connect Failure");
    }
    else
    {
        debug_printInfo("SOFT AP: New Connect credentials sent WINC");
    }
    return SOFT_AP_CONNECT_RETRY_INTERVAL;
}

bool wifi_disconnectFromAp(void)
{
    int8_t m2mDisconnectError;
    if(shared_networking_params.haveAPConnection == 1)
    {
        if(M2M_SUCCESS != (m2mDisconnectError=m2m_wifi_disconnect()))
        {
            debug_printError("WIFI: Disconnect from AP error = %d",m2mDisconnectError);
            return false;
        }	   
    }	
    return true;
}

// Update the system time every CLOUD_NTP_TASK_INTERVAL milliseconds
// Once time is obtained from NTP server WINC maintains the time internally. 
// The WINC will re-sync the time with NTP server utmost once per day or on DHCP renewal
uint32_t ntpTimeFetchTask(void *payload)
{
    if((strncmp(ntpServerName, CFG_NTP_SERVER, strlen(CFG_NTP_SERVER))) != 0)
    {
        strcpy(ntpServerName, CFG_NTP_SERVER);
        debug_printInfo("NTP server name: %s", ntpServerName);
        m2m_wifi_configure_sntp((uint8_t*)ntpServerName, sizeof(ntpServerName), SNTP_ENABLE_DHCP);
    }    
    m2m_wifi_get_system_time();
    
    return CLOUD_NTP_TASK_INTERVAL;
}


uint32_t wifiHandlerTask(void * param)
{
   m2m_wifi_handle_events(NULL);
   return CLOUD_WIFI_TASK_INTERVAL;
}

uint32_t checkBackTask(void * param)
{
    debug_printError("wifi_cb: M2M_WIFI_RESP_CON_STATE_CHANGED: DISCONNECTED");
    shared_networking_params.haveAPConnection = 0;
    shared_networking_params.amDisconnecting = 0;
    shared_networking_params.amConnectingSocket = 0;
    shared_networking_params.amConnectingAP = 1;
    return 0;
}

static void wifiCallback(uint8_t msgType, const void *pMsg)
{
    switch (msgType) {
        case M2M_WIFI_RESP_CON_STATE_CHANGED:
        {
            tstrM2mWifiStateChanged *pstrWifiState = (tstrM2mWifiStateChanged *)pMsg;
            if (pstrWifiState->u8CurrState == M2M_WIFI_CONNECTED) 
            {
                if (responseFromProvisionConnect)
                {
                    timeout_delete(&softApConnectTimer);
                    responseFromProvisionConnect = false;

                    ledParameterBlue.onTime = LED_BLINK;
                    ledParameterBlue.offTime = LED_BLINK;
                    LED_control(&ledParameterBlue);
                    timeout_create(&ntpTimeFetchTimer,CLOUD_NTP_TASK_INTERVAL);	
                    application_post_provisioning();
                }

                if ((shared_networking_params.amConnectingAP) && (!shared_networking_params.haveAPConnection))
                {
                    ledParameterGreen.onTime = LED_BLINK;
                    ledParameterGreen.offTime = LED_BLINK;
                    LED_control(&ledParameterGreen);
                    shared_networking_params.haveAPConnection = 1;
                    shared_networking_params.amConnectingAP = 0;
                    shared_networking_params.amDefaultCred = 0;
                    shared_networking_params.amConnectingSocket = 1;
                }
                
                if (shared_networking_params.amSoftAP)
                {   
                    // Connected to AS A SOFT AP
                    shared_networking_params.amSoftAP = 0;
                    ledParameterBlue.onTime = LED_1_SEC_ON;
                    ledParameterBlue.offTime = LED_1_SEC_ON;
                    ledParameterBlue.ledColor = BLUE;
                    LED_control(&ledParameterBlue);
                }
                debug_printGOOD("wifi_cb: M2M_WIFI_RESP_CON_STATE_CHANGED: CONNECTED");
		        CREDENTIALS_STORAGE_clearWifiCredentials();
                // We need more than AP to have an APConnection, we also need a DHCP IP address!
            } 
            else if (pstrWifiState->u8CurrState == M2M_WIFI_DISCONNECTED) 
            {   
                // Disconnected from AP
                ledParameterYellow.onTime = SOLID_OFF;
                ledParameterYellow.offTime = SOLID_ON;
                LED_control(&ledParameterYellow);
                ledParameterRed.onTime = SOLID_OFF;
                ledParameterRed.offTime = SOLID_ON;
                LED_control(&ledParameterRed);
                if (shared_networking_params.amDefaultCred == 0)
                {
                    ledParameterGreen.onTime = SOLID_OFF;
                    ledParameterGreen.offTime = SOLID_ON;
                    LED_control(&ledParameterGreen);
                    ledParameterBlue.onTime = LED_BLINK;
                    ledParameterBlue.offTime = LED_BLINK;
                    LED_control(&ledParameterBlue);
                }
                shared_networking_params.haveAPConnection = 0;
                shared_networking_params.amConnectingSocket = 0;
                shared_networking_params.amConnectingAP = 1;

                timeout_create(&checkBackTimer,CLOUD_WIFI_TASK_INTERVAL);
		        shared_networking_params.amDisconnecting = 1;
            }
            
            if ((wifiConnectionStateChangedCallback != NULL) && (shared_networking_params.amDisconnecting == 0))
            {
                wifiConnectionStateChangedCallback(pstrWifiState->u8CurrState);
            }            
            break;
        }
        
        case M2M_WIFI_REQ_DHCP_CONF:
        {
            // Now we are really connected, we have AP and we have DHCP, start off the MQTT host lookup now, response in 
			
            if (gethostbyname((const char*)awsEndpoint) == M2M_SUCCESS)
            {
                if (shared_networking_params.amDisconnecting == 1)
                {
                        timeout_delete(&checkBackTimer);
                        shared_networking_params.amDisconnecting = 0;
                }
                shared_networking_params.haveError = 0;
                debug_printGOOD("CLOUD: DHCP CONF");
            }
            break;
        }

        case M2M_WIFI_RESP_GET_SYS_TIME:
        {
            tstrSystemTime* WINCTime = (tstrSystemTime*)pMsg;
            // Convert to UNIX_EPOCH, this mktime uses years since 1900 and months are 0 based so we
            //    are doing a couple of adjustments here.
            if(WINCTime->u16Year > 0)
            {
		        TIME_ntpTimeStamp(WINCTime);
            }
            break;
        }
       
        
        case M2M_WIFI_RESP_PROVISION_INFO:
        {
            tstrM2MProvisionInfo *pstrProvInfo = (tstrM2MProvisionInfo*)pMsg;
            if(pstrProvInfo->u8Status == M2M_SUCCESS)
            {
                sprintf((char*)authType, "%d", pstrProvInfo->u8SecType);
                debug_printInfo("%s",pstrProvInfo->au8SSID);			   			   
                strcpy(ssid, (char *)pstrProvInfo->au8SSID);
                strcpy(pass, (char *)pstrProvInfo->au8Password);
                debug_printInfo("SOFT AP: Connect Credentials sent to WINC");
                responseFromProvisionConnect = true;
                timeout_create(&softApConnectTimer, 0);
            }
            break;
        }        

        default:
        {
            break;
        }
    }
}


void enable_provision_ap(void)
{
    tstrM2MAPConfig apConfig = {
      CFG_WLAN_AP_NAME, // Access Point Name.
      1, // Channel to use.
      0, // Wep key index.
      WEP_40_KEY_STRING_SIZE, // Wep key size.
      "1234567890", // Wep key.
      M2M_WIFI_SEC_OPEN, // Security mode.
      SSID_MODE_VISIBLE, // SSID visible.
      CFG_WLAN_AP_IP_ADDRESS
   };
   static char gacHttpProvDomainName[] = CFG_WLAN_AP_NAME;
   m2m_wifi_start_provision_mode(&apConfig, gacHttpProvDomainName, 1);
}


