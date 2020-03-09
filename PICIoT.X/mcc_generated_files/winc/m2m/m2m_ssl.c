/**
 *
 * \file
 *
 * \brief WINC SSL Interface.
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
#include "../common/ecc_types.h"
#include "../common/winc_debug.h"
#include "m2m_types.h"
#include "m2m_ssl.h"
#include "../driver/winc_hif.h"
#include "../driver/winc_asic.h"
#include "../socket/socket.h"

/*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
MACROS
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*/

/*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
DATA TYPES
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*/
static tpfAppSSLCb gpfAppSSLCb       = NULL;
static uint32_t gu32HIFAddr          = 0;
static tenuTlsFlashStatus genuStatus = TLS_FLASH_ERR_UNKNOWN;

/*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
FUNCTION PROTOTYPES
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*/

/*!
@fn \       void m2m_ssl_cb(uint8_t u8OpCode, uint16_t u16DataSize, uint32_t u32Addr)
@brief      Internal SSL callback function.
@param [in] u8OpCode
                HIF Opcode type.
@param [in] u16DataSize
                HIF data length.
@param [in] u32Addr
            HIF address.
*/
void m2m_ssl_cb(uint8_t u8OpCode, uint16_t u16DataSize, uint32_t u32Addr)
{
    UNUSED_VAR(u16DataSize);

    int8_t s8tmp = M2M_SUCCESS;
    switch(u8OpCode)
    {
        case M2M_SSL_REQ_ECC:
        {
            tstrEccReqInfo strEccREQ;
            s8tmp = winc_hif_receive(u32Addr, &strEccREQ, sizeof(tstrEccReqInfo));
            if(s8tmp == M2M_SUCCESS)
            {
                if (gpfAppSSLCb)
                {
                    gu32HIFAddr = u32Addr + sizeof(tstrEccReqInfo);
                    gpfAppSSLCb(M2M_SSL_REQ_ECC, &strEccREQ);
                }
            }
        }
        break;
        case M2M_SSL_RESP_SET_CS_LIST:
        {
            tstrSslSetActiveCsList strCsList;
            s8tmp = winc_hif_receive(u32Addr, &strCsList, sizeof(tstrSslSetActiveCsList));
            if(s8tmp == M2M_SUCCESS)
            {
                if (gpfAppSSLCb)
                    gpfAppSSLCb(M2M_SSL_RESP_SET_CS_LIST, &strCsList);
            }
        }
        break;
        case M2M_SSL_RESP_WRITE_OWN_CERTS:
        {
            tstrTlsSrvChunkHdr strTlsSrvChunkRsp;
            uint8_t bCallApp = 1;

            s8tmp = winc_hif_receive(u32Addr, &strTlsSrvChunkRsp, sizeof(tstrTlsSrvChunkHdr));
            if(s8tmp == M2M_SUCCESS)
            {
                uint16_t offset = strTlsSrvChunkRsp.u16Offset32;
                uint16_t chunk_size = strTlsSrvChunkRsp.u16Size32;
                uint16_t total_size = strTlsSrvChunkRsp.u16TotalSize32;
                tenuTlsFlashStatus status = (tenuTlsFlashStatus)(strTlsSrvChunkRsp.u16Sig);

                /* If first chunk, reset status. */
                if (offset == 0)
                    genuStatus = TLS_FLASH_OK_NO_CHANGE;
                /* Only send status to app when processing last chunk. */
                if (offset + chunk_size != total_size)
                    bCallApp = 0;

                switch (status)
                {
                    case TLS_FLASH_OK:
                        // Good flash write. Update status if no errors yet.
                        if (genuStatus == TLS_FLASH_OK_NO_CHANGE)
                            genuStatus = status;
                    break;
                    case TLS_FLASH_OK_NO_CHANGE:
                        // No change, don't update status.
                    break;
                    case TLS_FLASH_ERR_CORRUPT:
                        // Corrupt. Always update status.
                        genuStatus = status;
                    break;
                    case TLS_FLASH_ERR_NO_CHANGE:
                        // Failed flash write. Update status if no more serious error.
                        if ((genuStatus != TLS_FLASH_ERR_CORRUPT) && (genuStatus != TLS_FLASH_ERR_UNKNOWN))
                            genuStatus = status;
                    break;
                    default:
                        // Don't expect any other case. Ensure we don't mask a previous corrupt error.
                        if (genuStatus != TLS_FLASH_ERR_CORRUPT)
                            genuStatus = TLS_FLASH_ERR_UNKNOWN;
                    break;
                }
            }
            if (bCallApp && gpfAppSSLCb)
                gpfAppSSLCb(M2M_SSL_RESP_WRITE_OWN_CERTS, &genuStatus);
        }
        break;
    }
    if(s8tmp != M2M_SUCCESS)
    {
        WINC_LOG_ERROR("Error receiving SSL from the HIF");
    }
}

/*!
@fn \       int8_t m2m_ssl_init(tpfAppSslCb pfAppSslCb);
@brief      Initializes the SSL layer.
@param [in] pfAppSslCb
                Application SSL callback function.
@return     The function returns @ref M2M_SUCCESS for success and a negative value otherwise.
*/
int8_t m2m_ssl_init(tpfAppSSLCb pfAppSSLCb)
{
    gpfAppSSLCb = pfAppSSLCb;
    gu32HIFAddr = 0;
    genuStatus = TLS_FLASH_ERR_UNKNOWN;

    return M2M_SUCCESS;
}

/*!
@fn \       int8_t m2m_ssl_handshake_rsp(tstrEccReqInfo* strECCResp, uint8_t* pu8RspDataBuff, uint16_t u16RspDataSz)
@brief      Sends ECC responses to the WINC.
@param[in]  strECCResp
                ECC Response struct.
@param[in]  pu8RspDataBuff
                Pointer of the response data to be sent.
@param[in]  u16RspDataSz
                Response data size.
@return     The function returns @ref M2M_SUCCESS for success and a negative value otherwise.
*/
int8_t m2m_ssl_handshake_rsp(tstrEccReqInfo* strECCResp, uint8_t* pu8RspDataBuff, uint16_t u16RspDataSz)
{
    int8_t s8Ret = M2M_SUCCESS;

    s8Ret = winc_hif_send(M2M_REQ_GROUP_SSL, (M2M_SSL_RESP_ECC | M2M_REQ_DATA_PKT), strECCResp, sizeof(tstrEccReqInfo), pu8RspDataBuff, u16RspDataSz, sizeof(tstrEccReqInfo));

    return s8Ret;
}

/*!
@fn \       int8_t m2m_ssl_send_certs_to_winc(uint8_t* sector_buffer, uint32_t sector_size)
@brief      Sends certificates to the WINC
@param[in]  pu8Buffer
                Pointer to the certificates.
@param[in]  u32BufferSz
                Size of the certificates.
@return     The function returns @ref M2M_SUCCESS for success and a negative value otherwise.
*/
#define TXLIMIT     (256 * 6)
#define CHUNKHDRSZ  (sizeof(tstrTlsSrvChunkHdr))
#define CHUNKSZ     (TXLIMIT - 256) // divisible by 4

int8_t m2m_ssl_send_certs_to_winc(uint8_t *pu8Buffer, uint32_t u32BufferSz)
{
    tstrTlsSrvChunkHdr strChkHdr;

    strChkHdr.u16Sig         = TLS_CERTS_CHUNKED_SIG_VALUE;
    strChkHdr.u16TotalSize32 = (uint16_t)((u32BufferSz + 3) >> 2);
    strChkHdr.u16Offset32    = 0;

    if(u32BufferSz <= TXLIMIT)
    {
        // set chunk header for one chunk

        strChkHdr.u16Size32 = strChkHdr.u16TotalSize32;

        memcpy(pu8Buffer, &strChkHdr, CHUNKHDRSZ);

        if (M2M_SUCCESS != winc_hif_send(M2M_REQ_GROUP_SSL, (M2M_SSL_REQ_WRITE_OWN_CERTS | M2M_REQ_DATA_PKT), NULL, 0, pu8Buffer, (uint16_t)u32BufferSz, 0))
            return M2M_ERR_FAIL;

        WINC_LOG_INFO("Transferred %" PRIu32 " bytes of cert data NON-CHUNKED", u32BufferSz);
    }
    else
    {
        // chunk it
        // We are sneaking in a header - tstrTlsSrvChunkHdr
        uint8_t u8BackupBufData[CHUNKHDRSZ];
        uint16_t u16ThisChunkSz = CHUNKSZ;
        uint32_t u32BufRemain;

        memcpy(u8BackupBufData, pu8Buffer, CHUNKHDRSZ);

        // CHUNKSZ is always less than TXLIMIT, so u32BufferSz is always greater than CHUNKSZ, therefore u16ThisChunkSz = CHUNKSZ

        strChkHdr.u16Size32 = (CHUNKSZ >> 2);

        memcpy(pu8Buffer, &strChkHdr, CHUNKHDRSZ);

        if (M2M_SUCCESS != winc_hif_send(M2M_REQ_GROUP_SSL, (M2M_SSL_REQ_WRITE_OWN_CERTS | M2M_REQ_DATA_PKT), NULL, 0, pu8Buffer, CHUNKSZ, 0))
            return M2M_ERR_FAIL;

        WINC_LOG_INFO("Transferred %" PRIu16 " bytes of cert data CHUNKED to offset 0 total %" PRIu32, CHUNKSZ, u32BufferSz);
        memcpy(pu8Buffer, u8BackupBufData, CHUNKHDRSZ);

        pu8Buffer             += (CHUNKSZ - CHUNKHDRSZ);
        strChkHdr.u16Offset32 += (CHUNKSZ >> 2);

        u32BufRemain = u32BufferSz - CHUNKSZ;

        while (u32BufRemain)
        {
            // pu8Buffer points to next chunk data - CHUNKHDRSZ

            memcpy(u8BackupBufData, pu8Buffer, CHUNKHDRSZ);

            if (u32BufRemain < CHUNKSZ)
            {
                u16ThisChunkSz = (uint16_t)u32BufRemain;
                u16ThisChunkSz = (u16ThisChunkSz + 3) & 0xFFFC; // needs to round up to quad word length

                strChkHdr.u16Size32 = (u16ThisChunkSz >> 2);
            }

            memcpy(pu8Buffer, &strChkHdr, CHUNKHDRSZ);

            if (M2M_SUCCESS != winc_hif_send(M2M_REQ_GROUP_SSL, (M2M_SSL_REQ_WRITE_OWN_CERTS | M2M_REQ_DATA_PKT), NULL, 0, pu8Buffer, u16ThisChunkSz + CHUNKHDRSZ, 0))
                return M2M_ERR_FAIL;

            WINC_LOG_INFO("Transferred %" PRIu16 " bytes of cert data CHUNKED to offset %d total %" PRIu32, u16ThisChunkSz, (strChkHdr.u16Offset32 << 2), u32BufferSz);
            memcpy(pu8Buffer, u8BackupBufData, CHUNKHDRSZ);

            pu8Buffer             += CHUNKSZ;
            strChkHdr.u16Offset32 += (CHUNKSZ >> 2);

            u32BufRemain -= u16ThisChunkSz;
        }
    }

    return M2M_SUCCESS;
}

/*!
@fn \       int8_t m2m_ssl_retrieve_cert(uint32_t u32ReadAddr, uint16_t* pu16CurveType, uint8_t* pu8Hash, uint8_t* pu8Sig, tstrECPoint* pu8Key)
@brief      Retrieve the certificate to be verified from the WINC
@param[in]  pu16CurveType
                Pointer to the certificate curve type.
@param[in]  pu8Hash
                Pointer to the certificate hash.
@param[in]  pu8Sig
                Pointer to the certificate signature.
@param[in]  pu8Key
                Pointer to the certificate Key.
@return     The function returns @ref M2M_SUCCESS for success and a negative value otherwise.
*/
int8_t m2m_ssl_retrieve_cert(uint16_t* pu16CurveType, uint8_t* pu8Hash, uint8_t* pu8Sig, tstrECPoint* pu8Key)
{
    uint16_t  u16HashSz, u16SigSz, u16KeySz;

    if (gu32HIFAddr == 0)
        return M2M_ERR_FAIL;

    if (winc_hif_receive(gu32HIFAddr, pu16CurveType, 2) != M2M_SUCCESS)
        return M2M_ERR_FAIL;
    gu32HIFAddr += 2;

    if (winc_hif_receive(gu32HIFAddr, &u16KeySz, 2) != M2M_SUCCESS)
        return M2M_ERR_FAIL;
    gu32HIFAddr += 2;

    if (winc_hif_receive(gu32HIFAddr, &u16HashSz, 2) != M2M_SUCCESS)
        return M2M_ERR_FAIL;
    gu32HIFAddr += 2;

    if (winc_hif_receive(gu32HIFAddr, &u16SigSz, 2) != M2M_SUCCESS)
        return M2M_ERR_FAIL;
    gu32HIFAddr += 2;

    (*pu16CurveType)= _htons((*pu16CurveType));
    pu8Key->u16Size = _htons(u16KeySz);
    u16HashSz       = _htons(u16HashSz);
    u16SigSz        = _htons(u16SigSz);

    if (winc_hif_receive(gu32HIFAddr, pu8Key->X, pu8Key->u16Size * 2) != M2M_SUCCESS)
        return M2M_ERR_FAIL;
    gu32HIFAddr += (pu8Key->u16Size * 2);

    if (winc_hif_receive(gu32HIFAddr, pu8Hash, u16HashSz) != M2M_SUCCESS)
        return M2M_ERR_FAIL;
    gu32HIFAddr += u16HashSz;

    if (winc_hif_receive(gu32HIFAddr, pu8Sig, u16SigSz) != M2M_SUCCESS)
        return M2M_ERR_FAIL;
    gu32HIFAddr += u16SigSz;

    return M2M_SUCCESS;
}

/*!
@fn \       int8_t m2m_ssl_retrieve_hash(uint32_t u32ReadAddr, uint8_t* pu8Hash, uint16_t u16HashSz)
@brief      Retrieve the certificate hash.
@param[in]  pu8Hash
                Pointer to the certificate hash.
@param[in]  u16HashSz
                Hash size.
@return     The function returns @ref M2M_SUCCESS for success and a negative value otherwise.
*/
int8_t m2m_ssl_retrieve_hash(uint8_t* pu8Hash, uint16_t u16HashSz)
{
    if (gu32HIFAddr == 0)
        return M2M_ERR_FAIL;

    if (winc_hif_receive(gu32HIFAddr, pu8Hash, u16HashSz) != M2M_SUCCESS)
        return M2M_ERR_FAIL;

    return M2M_SUCCESS;
}

/*!
@fn \       void m2m_ssl_stop_processing_certs(void)
@brief      Stops receiving from the HIF.
*/
void m2m_ssl_stop_processing_certs(void)
{
}

/*!
@fn \       void m2m_ssl_ecc_process_done(void)
@brief      Stops receiving from the HIF.
*/
void m2m_ssl_ecc_process_done(void)
{
    gu32HIFAddr = 0;
}

/*!
@fn         int8_t m2m_ssl_set_active_ciphersuites(uint32_t u32SslCsBMP);
@brief      Sets the active cipher suites.

@param [in] u32SslCsBMP
                Bitmap containing the desired ciphers to be enabled for the SSL module. The cipher suites are defined in
                @ref SSLCipherSuiteID.
                The default cipher suites are all cipher suites supported by the firmware with the exception of ECC cipher suites.
                The caller can override the default with any desired combination, except for combinations involving both RSA
                and ECC; if any RSA ciphersuite is enabled, then firmware will disable all ECC cipher suites.
                If u32SslCsBMP does not contain any cipher suites supported by firmware, then the current active list will not
                change.

@return
            - @ref SOCK_ERR_NO_ERROR
            - @ref SOCK_ERR_INVALID_ARG
*/
int8_t m2m_ssl_set_active_ciphersuites(uint32_t u32SslCsBMP)
{
    int8_t s8Ret = M2M_SUCCESS;
    tstrSslSetActiveCsList  strCsList;

    strCsList.u32CsBMP = u32SslCsBMP;
    s8Ret = winc_hif_send_no_data(M2M_REQ_GROUP_SSL, M2M_SSL_REQ_SET_CS_LIST, &strCsList, sizeof(tstrSslSetActiveCsList));
    return s8Ret;
}
