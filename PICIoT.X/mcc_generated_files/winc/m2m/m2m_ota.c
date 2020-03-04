/**
 *
 * \file
 *
 * \brief WINC IoT OTA Interface.
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
 
/*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
INCLUDES
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*/

#include "../driver/winc_adapter.h"
#include "../common/winc_defines.h"
#include "../common/winc_debug.h"
#include "m2m_types.h"
#include "m2m_wifi.h"
#include "m2m_ota.h"
#include "m2m_fwinfo.h"
#include "../driver/winc_hif.h"
#include "../spi_flash/spi_flash.h"
#include "../spi_flash/spi_flash_map.h"
#include "../spi_flash/flexible_flash.h"

/*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
MACROS
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*/
/*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
DATA TYPES
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*/
static tpfOtaUpdateCb gpfOtaUpdateCb = NULL;
static tpfOtaNotifCb  gpfOtaNotifCb  = NULL;
static tpfFileGetCb   gpfHFDGetCb    = NULL;
static tpfFileReadCb  gpfHFDReadCb   = NULL;
static tpfFileEraseCb gpfHFDEraseCb  = NULL;

typedef struct {
    uint32_t u32Offset;
    uint32_t u32Size;
} FileBlockDescriptor;

static FileBlockDescriptor FileBlock;

static uint8_t  gu8CurrFileHandlerID  = HFD_INVALID_HANDLER;

/*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
FUNCTION PROTOTYPES
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*/

/**
*   @fn         m2m_ota_cb(uint8_t u8OpCode, uint16_t u16DataSize, uint32_t u32Addr)
*   @brief      OTA call back function
*   @param [in] u8OpCode
*                   HIF Opcode type.
*   @param [in] u16DataSize
*                   HIF data length.
*   @param [in] u32Addr
*                   HIF address.
*/
void m2m_ota_cb(uint8_t u8OpCode, uint16_t u16DataSize, uint32_t u32Addr)
{
    UNUSED_VAR(u16DataSize);

    int8_t s8Ret = M2M_SUCCESS;
    if(u8OpCode == M2M_OTA_RESP_NOTIF_UPDATE_INFO)
    {
        tstrOtaUpdateInfo strOtaUpdateInfo;
        memset(&strOtaUpdateInfo,0,sizeof(tstrOtaUpdateInfo));
        s8Ret = winc_hif_receive(u32Addr, &strOtaUpdateInfo, sizeof(tstrOtaUpdateInfo));
        if(s8Ret == M2M_SUCCESS)
        {
            if(gpfOtaNotifCb)
                gpfOtaNotifCb(&strOtaUpdateInfo);
        }
    }
    else if (u8OpCode == M2M_OTA_RESP_UPDATE_STATUS)
    {
        tstrOtaUpdateStatusResp strOtaUpdateStatusResp;
        memset(&strOtaUpdateStatusResp,0,sizeof(tstrOtaUpdateStatusResp));
        s8Ret = winc_hif_receive(u32Addr, &strOtaUpdateStatusResp, sizeof(tstrOtaUpdateStatusResp));
        if(s8Ret == M2M_SUCCESS)
        {
            if(gpfOtaUpdateCb)
                gpfOtaUpdateCb(strOtaUpdateStatusResp.u8OtaUpdateStatusType,strOtaUpdateStatusResp.u8OtaUpdateStatus);
        }
    }
    else if (u8OpCode == M2M_OTA_RESP_HOST_FILE_STATUS)
    {
        tstrOtaHostFileGetStatusResp strOtaHostFileGetStatusResp = {0};
        s8Ret = winc_hif_receive(u32Addr, &strOtaHostFileGetStatusResp, sizeof(tstrOtaHostFileGetStatusResp));
        if(M2M_SUCCESS == s8Ret)
        {
            if(strOtaHostFileGetStatusResp.u8OtaFileGetStatus == OTA_STATUS_SUCCESS) {
                gu8CurrFileHandlerID = strOtaHostFileGetStatusResp.u8CFHandler;
            }
        }
    }
    else if (u8OpCode == M2M_OTA_RESP_HOST_FILE_DOWNLOAD)
    {
        tstrOtaHostFileGetStatusResp strOtaHostFileGetStatusResp = {0};
        s8Ret = winc_hif_receive(u32Addr, &strOtaHostFileGetStatusResp, sizeof(tstrOtaHostFileGetStatusResp));
        if(M2M_SUCCESS == s8Ret)
        {
            if(strOtaHostFileGetStatusResp.u8OtaFileGetStatus == OTA_STATUS_SUCCESS) {
                gu8CurrFileHandlerID = strOtaHostFileGetStatusResp.u8CFHandler;
                WINC_LOG_INFO("Generated HostFileHandlerID is %u", gu8CurrFileHandlerID);
            }

            if(gpfHFDGetCb) {
                gpfHFDGetCb(strOtaHostFileGetStatusResp.u8OtaFileGetStatus, gu8CurrFileHandlerID, strOtaHostFileGetStatusResp.u32OtaFileSize);
                gpfHFDGetCb = NULL;
            }
        }
    }
    else if (u8OpCode == M2M_OTA_RESP_HOST_FILE_READ)
    {
        tstrOtaHostFileReadStatusResp strOtaHostFileReadStatusResp;
        memset(&strOtaHostFileReadStatusResp, 0, sizeof(tstrOtaHostFileReadStatusResp));
        s8Ret = winc_hif_receive(u32Addr, &strOtaHostFileReadStatusResp, sizeof(tstrOtaHostFileReadStatusResp));
        if(M2M_SUCCESS == s8Ret)
            if(gpfHFDReadCb)
                gpfHFDReadCb(strOtaHostFileReadStatusResp.u8OtaFileReadStatus, strOtaHostFileReadStatusResp.pFileBuf, strOtaHostFileReadStatusResp.u16FileBlockSz);
    }
    else if (u8OpCode == M2M_OTA_RESP_HOST_FILE_ERASE)
    {
        tstrOtaHostFileEraseStatusResp strOtaHostFileEraseStatusResp = {0};
        s8Ret = winc_hif_receive(u32Addr, &strOtaHostFileEraseStatusResp, sizeof(tstrOtaHostFileEraseStatusResp));
        if(M2M_SUCCESS == s8Ret)
        {
            if(gpfHFDEraseCb)
            {
                gpfHFDEraseCb(strOtaHostFileEraseStatusResp.u8OtaFileEraseStatus);
                gpfHFDEraseCb = NULL;
            }
        }
    }
    else
    {
        WINC_LOG_ERROR("Invalid OTA resp %u",u8OpCode);
    }
}
/*!
@fn \
    int8_t m2m_ota_init(tpfOtaUpdateCb pfOtaUpdateCb, tpfOtaNotifCb pfOtaNotifCb);

@brief
    Initialize the OTA layer.

@param [in] pfOtaUpdateCb
                OTA Update callback function

@param [in] pfOtaNotifCb
                OTA Notify callback function

@return
    The function SHALL return 0 for success and a negative value otherwise.
*/
int8_t m2m_ota_init(tpfOtaUpdateCb pfOtaUpdateCb, tpfOtaNotifCb pfOtaNotifCb)
{
    gpfOtaUpdateCb = pfOtaUpdateCb;
    gpfOtaNotifCb  = pfOtaNotifCb;

    return winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_HOST_FILE_STATUS, NULL, 0);
}
/*!
@fn \
    int8_t m2m_ota_notif_set_url(uint8_t * u8Url);

@brief
    Set the OTA url

@param [in] u8Url
             The url server address

@return
    The function SHALL return 0 for success and a negative value otherwise.
*/
int8_t m2m_ota_notif_set_url(uint8_t * u8Url)
{
    int8_t ret = M2M_SUCCESS;
    uint16_t u16UrlSize = (uint16_t)strlen((const char*)u8Url) + 1;
    /*Todo: we may change it to data pkt but we need to give it higher priority
            but the priority is not implemented yet in data pkt
    */
    ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_NOTIF_SET_URL, u8Url, u16UrlSize);
    return ret;

}

/*!
@fn \
    int8_t m2m_ota_notif_check_for_update(void);

@brief
    check for OTA update

@return
    The function SHALL return 0 for success and a negative value otherwise.
*/
int8_t m2m_ota_notif_check_for_update(void)
{
    int8_t ret = M2M_SUCCESS;
    ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_NOTIF_CHECK_FOR_UPDATE, NULL, 0);
    return ret;
}

/*!
@fn \
    int8_t m2m_ota_notif_sched(uint32_t u32Period);

@brief
    Schedule OTA update

@param [in] u32Period
    Period in days

@return
    The function SHALL return 0 for success and a negative value otherwise.
*/
int8_t m2m_ota_notif_sched(uint32_t u32Period)
{
    UNUSED_VAR(u32Period);

    int8_t ret = M2M_SUCCESS;
    ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_NOTIF_CHECK_FOR_UPDATE, NULL, 0);
    return ret;
}

/*!
@fn \
    int8_t m2m_ota_start_update(unsigned char * pcDownloadUrl);

@brief
    Request OTA start update using the downloaded url

@param [in] pcDownloadUrl
        The download firmware url, you get it from device info

@return
    The function SHALL return 0 for success and a negative value otherwise.

*/
int8_t m2m_ota_start_update(unsigned char * pcDownloadUrl)
{
    int8_t ret = M2M_SUCCESS;
    uint16_t u16DurlSize = (uint16_t)strlen((const char*)pcDownloadUrl) + 1;
    /*Todo: we may change it to data pkt but we need to give it higher priority
            but the priority is not implemented yet in data pkt
    */
    ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_START_FW_UPDATE, pcDownloadUrl, u16DurlSize);
    return ret;
}

/*!
@fn \
    int8_t m2m_ota_rollback(void);

@brief
    Request OTA Rollback image

@return
    The function SHALL return 0 for success and a negative value otherwise.
*/
int8_t m2m_ota_rollback(void)
{
    int8_t ret = M2M_SUCCESS;
    ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_ROLLBACK_FW, NULL, 0);
    return ret;
}

/*!
@fn \
    int8_t m2m_ota_abort(void);

@brief
    Request OTA Abort

@return
    The function SHALL return 0 for success and a negative value otherwise.
*/
int8_t m2m_ota_abort(void)
{
    int8_t ret = M2M_SUCCESS;
    ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_ABORT, NULL, 0);
    return ret;
}


/*!
@fn \
    int8_t m2m_ota_switch_firmware(void);

@brief
    Switch to the upgraded Firmware

@return
    The function SHALL return 0 for success and a negative value otherwise.
*/
int8_t m2m_ota_switch_firmware(void)
{
    int8_t ret = M2M_SUCCESS;
    ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_SWITCH_FIRMWARE, NULL, 0);
    return ret;
}

/*!
@fn \
    int8_t m2m_ota_get_firmware_version(tstrM2mRev * pstrRev);

@brief
    Get the OTA Firmware version.

@return
    The function SHALL return 0 for success and a negative value otherwise.
*/
int8_t m2m_ota_get_firmware_version(tstrM2mRev * pstrRev)
{
    int8_t ret;

    ret = winc_hif_chip_wake();
    if(ret != M2M_SUCCESS)
        return ret;

    ret = m2m_fwinfo_get_firmware_info(false, pstrRev);
    winc_hif_chip_sleep();

    if(ret != M2M_SUCCESS)
        return ret;

    return m2m_fwinfo_version_check(pstrRev);
}
/*!
@fn \
            m2m_ota_host_file_get(unsigned char *pcDownloadUrl, tpfFileGetCb pfHFDGetCb);

@brief
            Download a file from a remote location and store it in the WINC's Flash.

@param[in]  pcDownloadUrl
                Url pointing to the remote file. HTTP/HTTPS only.

@param[in]  pfHFDGetCb
                Pointer to a callback to be executed when the download finishes.

@return
            Status of the get operation

@warning    1. Providing a callback is mandatory.
            2. This functionality is only supported from WINC release 19.6.0 onwards.
*/
int8_t m2m_ota_host_file_get(unsigned char *pcDownloadUrl, tpfFileGetCb pfHFDGetCb)
{
    int8_t s8Ret = M2M_ERR_FAIL;
    uint16_t u16DUrlSize = (uint16_t)strlen((const char*)pcDownloadUrl);

    if((NULL == pfHFDGetCb) || (0 == u16DUrlSize))
    {
        WINC_LOG_ERROR("Invalid parameters.");
        goto EXIT;
    }

    if('\0' != pcDownloadUrl[u16DUrlSize])
        pcDownloadUrl[u16DUrlSize] = '\0';
    else
        u16DUrlSize++;

    WINC_LOG_INFO("GetHostFile - URL: %s, urlSize: %u", pcDownloadUrl, u16DUrlSize);

    s8Ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_HOST_FILE_DOWNLOAD, pcDownloadUrl, u16DUrlSize);
    if(s8Ret == M2M_SUCCESS)
    {
        gpfHFDGetCb = pfHFDGetCb;
        gu8CurrFileHandlerID = HFD_INVALID_HANDLER;
    }

EXIT:
    return s8Ret;
}

/*!
@fn \
            m2m_ota_host_file_read_hif(uint8_t u8Handler, uint32_t u32Offset, uint32_t u32Size, tpfFileReadCb pfHFDReadCb);
@brief
            Read a certain amount of bytes from a file in WINC's Flash using HIF transfer.

@param[in]  u8Handler
                ID of the file we are trying to read from. Must be valid.

@param[in]  u32Offset
                Offset from start of the file to read from (in bytes).

@param[in]  u32Size
                The amount of data to read (in bytes).

@param[in]  pfHFDReadCb
                Callback to be executed when the read operation completes.

@return
            Status of the read operation

@warning    1. Providing a callback is mandatory.
            2. This functionality is only supported from WINC release 19.6.0 onwards.
*/
int8_t m2m_ota_host_file_read_hif(uint8_t u8Handler, uint32_t u32Offset, uint32_t u32Size, tpfFileReadCb pfHFDReadCb)
{
    int8_t s8Ret         = M2M_ERR_INVALID_ARG;
    FileBlock.u32Offset = u32Offset;
    FileBlock.u32Size   = u32Size;

    if((u8Handler != gu8CurrFileHandlerID) || (HFD_INVALID_HANDLER == gu8CurrFileHandlerID) || (NULL == pfHFDReadCb)) goto EXIT;
    s8Ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_HOST_FILE_READ, &FileBlock, sizeof(FileBlockDescriptor));

    if(M2M_SUCCESS == s8Ret)
        gpfHFDReadCb = pfHFDReadCb;
EXIT:
    return s8Ret;
}

/*!
@fn \
            m2m_ota_host_file_read_spi(uint8_t u8Handler, uint8_t *pu8Buff, uint32_t u32Offset, uint32_t u32Size);
@brief
            Read a certain amount of bytes from a file in WINC's Flash using SPI transfer.

@param[in]  u8Handler
                ID of the file we are trying to read from. Must be valid.

@param[in]  pu8Buff
                Pointer to a buffer to store the data being read. Must be valid.

@param[in]  u32Offset
                Offset from start of the file to read from (in bytes).

@param[in]  u32Size
                The amount of data to read (in Bytes).

@return
            Status of the read operation

@warning    1. Before using m2m_ota_host_file_read_spi, the WINC needs to be put in a special
               mode to allow for a safe access to the Flash. This can be done by calling
               @ref m2m_wifi_download_mode or @ref m2m_wifi_reinit_hold before trying to read.

            2. This functionality is only supported from WINC release 19.6.0 onwards.
*/
int8_t m2m_ota_host_file_read_spi(uint8_t u8Handler, uint8_t *pu8Buff, uint32_t u32Offset, uint32_t u32Size)
{
    static uint32_t u32FlashHFDStart = 0;
    static uint32_t u32FlashHFDSize  = 0;
    int8_t s8Ret = M2M_ERR_INVALID_ARG;
    if((u8Handler == HFD_INVALID_HANDLER) || (NULL == pu8Buff)) goto EXIT;

    if(WIFI_STATE_INIT != m2m_wifi_get_state())
    {
        s8Ret = M2M_ERR_FAIL;
        WINC_LOG_ERROR("WINC is not in an appropriate state for this operation!");
        goto EXIT;
    }

    if((u32FlashHFDStart == 0) || (u32FlashHFDSize == 0))
    {
        s8Ret = spi_flexible_flash_find_section(ENTRY_ID_HOSTFILE, &u32FlashHFDStart, &u32FlashHFDSize);
        if(M2M_SUCCESS != s8Ret) goto EXIT;
    }

    s8Ret = spi_flash_read(pu8Buff, u32FlashHFDStart, 4);

    if((M2M_SUCCESS != s8Ret) || (pu8Buff[0] != u8Handler)) goto EXIT;

    if((u32Offset >= u32FlashHFDSize) ||
       (u32Size   >  u32FlashHFDSize) ||
       ((u32Offset + u32Size) >= u32FlashHFDSize))
    {
        s8Ret = M2M_ERR_FAIL;
        goto EXIT;
    }

    s8Ret = spi_flash_read(pu8Buff, u32FlashHFDStart + FLASH_SECTOR_SZ + u32Offset, u32Size);

    if(M2M_SUCCESS != s8Ret)
    {
        WINC_LOG_ERROR("Unable to read SPI Flash");
    }

EXIT:
    return s8Ret;
}

/*!
@fn \
            m2m_ota_host_file_erase(uint8_t u8Handler, tpfFileEraseCb pfHFDEraseCb);
@brief
            Erase any traces of an existing file, this means from host driver and WINC firmware.

@param[in]  u8Handler
                ID of the file we are trying to erase. Must be valid.

@param[in]  pfHFDEraseCb
                Pointer to callback to execute when the file erase in the WINC completes.

@return
            Status of the erase operation

@note       Providing a callback is optional.
            If the current handler is invalid at this point, it means one of the three:
                1. The file never existed;
                2. The file has already been already deleted;
                3. The request to get the file hasn't fully completed.
            For 1. and 2. there is no need to signal the WINC to erase the file in Flash.
            For 3. the Flash can't be erased while a file download is ongoing.

@warning    This functionality is only supported from WINC release 19.6.0 onwards.
*/
int8_t m2m_ota_host_file_erase(uint8_t u8Handler, tpfFileEraseCb pfHFDEraseCb)
{
    int8_t s8Ret = M2M_ERR_INVALID_ARG;
    if((u8Handler != gu8CurrFileHandlerID) || (HFD_INVALID_HANDLER == gu8CurrFileHandlerID)) goto EXIT;

    gu8CurrFileHandlerID = HFD_INVALID_HANDLER;
    gpfHFDReadCb  = NULL;
    gpfHFDEraseCb = pfHFDEraseCb;

    s8Ret = winc_hif_send_no_data(M2M_REQ_GROUP_OTA, M2M_OTA_REQ_HOST_FILE_ERASE, NULL, 0);
EXIT:
    return s8Ret;
}