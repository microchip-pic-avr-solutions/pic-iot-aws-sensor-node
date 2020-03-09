/**
 *
 * \file
 *
 * \brief WINC ADAPTER API Declarations.
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

/** @defgroup winc_adapter
    @brief
        The ADAPTER is an architecture specific package implemented to support the common WINC driver. When
        porting the driver to a new architecture this package will need to be written to provide the
        functionality described here.
    @{
        @defgroup   ADAPTERDefine   Defines
        @defgroup   ADAPTERInit     Initialization and de-initialization functions
        @defgroup   ADAPTERSleep    Sleep/delay functions
        @defgroup   ADAPTERInt      Interrupt handling functions
        @defgroup   ADAPTERSPI      SPI interface functions
        @defgroup   ADAPTERGPIO     GPIO control functions
        @defgroup   ADAPTERUART     UART interface functions
        @note
            These functions are only required for supporting the serial bridge functionality of the
            driver.
    @}
 */

#ifndef _WINC_ADAPTER_H_
#define _WINC_ADAPTER_H_

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "../../config/conf_winc.h"

/**@addtogroup ADAPTERDefine
 * @{
 */
#if defined(CONF_WINC_MCU_ARCH_LITTLE_ENDIAN)
#define HOST_TO_WINC_U32(U32)      (U32)
#define HOST_TO_WINC_U16(U16)      (U16)
#elif defined(CONF_WINC_MCU_ARCH_BIG_ENDIAN)
#define HOST_TO_WINC_U32(U32)      CONF_WINC_UINT32_SWAP(U32)
#define HOST_TO_WINC_U16(U16)      CONF_WINC_UINT16_SWAP(U16)
#endif

#define WINC_TO_HOST_U32            HOST_TO_WINC_U32
#define WINC_TO_HOST_U16            HOST_TO_WINC_U16
/**@}*/     // ADAPTERDefine

#ifdef __cplusplus
extern "C" {
#endif

/**@addtogroup ADAPTERInit
 * @{
 */
/*!
 @fn \
    int_fast8_t winc_adapter_init(void);

 @brief
    This function is used to initialize the ADAPTER in order to prepare the WINC before any
    WINC API calls.

 @details
    The winc_adapter_init function is the first function that should be called at the beginning of
    every application to initialize the ADAPTER and the WINC board. Otherwise, the rest of the ADAPTER
    function calls will return with failure. This function should also be called after the WINC
    has been switched off with a successful call to @ref winc_adapter_deinit in order to reinitialize
    the ADAPTER before the Application can use any of the WINC APIs again. After the function
    initializes the WINC.

@note
    Implementation of this function is host dependent.

@warning
    Omitting this function will lead to unavailability of host-chip communication.

@see    winc_adapter_deinit

@return
    The function returns a value of 1 for successful operations and a 0 value otherwise.
*/
int_fast8_t winc_adapter_init(void);

/*!
@fn \
    int_fast8_t winc_adapter_deinit(void);

@brief
    This function is used to de-initialize the ADAPTER and turn off the WINC board.

@details
    The winc_adapter_deinit is the last function that should be called after the application has
    finished and before the WINC is switched off. Every function call of @ref winc_adapter_init
    should be matched with a call to winc_adapter_deinit. Failure to do so may result in the WINC
    consuming higher power than expected, since it won't be properly de-initialized.

@pre
    The ADAPTER should be initialized through @ref winc_adapter_init first.

@note
    Implementation of this function is host dependent.

@warning
    Omitting this function may lead to unknown behavior in case of soft reset.

@see    winc_adapter_init

@return
    The function returns a value of 1 for successful operations and a 0 value otherwise.
*/
int_fast8_t winc_adapter_deinit(void);

/**@}*/     // ADAPTERInit
/**@addtogroup ADAPTERSleep
 * @{
 */
/*!
@fn \
    void winc_adapter_sleep(uint32_t u32TimeMsec);

@brief
    Used to put the host to sleep for the specified duration (in milliseconds).
    Forcing the host to sleep for extended period may lead to host not being able to respond
    to WINC board events. It is important to be considerate while choosing the sleep period.

@param[in]  u32TimeMsec
    Time unit in milliseconds.

@pre
    Initialize @ref winc_adapter_init first.

@note
    Implementation of this function is host dependent.

@see    winc_adapter_init
*/
void winc_adapter_sleep(uint32_t u32TimeMsec);

/**@}*/     // ADAPTERSleep
/**@addtogroup ADAPTERInt
 * @{
 */
/*!
@fn \
    int_fast8_t winc_adapter_interrupt_request_pending(void);

@brief
    Indicates to the WINC driver is an interrupt request has been received. This function will be
    called by the WINC driver during @ref m2m_wifi_handle_events to determine if the WINC should be
    queried for possible messages.

@pre
    Initialize @ref winc_adapter_init first.

@note
    Implementation of this function is host dependent.

@see    winc_adapter_init

@return
    The functions returns a non-zero value to indicate if an interrupt has been received, otherwise zero.
*/
int_fast8_t winc_adapter_interrupt_request_pending(void);

/*!
@fn \
    int_fast8_t winc_adapter_interrupt_serviced(bool bEdgeInt);

@brief
    Indicates to the ADAPTER that a pending interrupt has been processed by the driver. The WINC driver
    will call this function to indicate that a message has been received from the WINC. @p bEdgeInt
    indicates if an edge interrupt should be serviced (true) or a level interrupt (false).

    If the ADAPTER is managing the WINC devices IRQn line as an edge interrupt then when @p bEdgeInt is true
    the ADAPTER should consider a pending interrupt has been serviced. If @p bEdgeInt is false the ADAPTER must
    ignore it. This ensures the interrupt is serviced before the WINC re-activates the IRQn line and thus
    before another interrupt can be received.

    If the ADAPTER is managing the WINC devices IRQn line as a level interrupt then when @p bEdgeInt is false
    the ADAPTER should consider a pending interrupt has been serviced. If @p bEdgeInt is true the ADAPTER must
    ignore it. This ensures the interrupt is serviced after the WINC re-activates the IRQn line and thus
    ensures any previous interrupt level has been de-asserted by the WINC.

@pre
    Initialize @ref winc_adapter_init first.

@note
    Implementation of this function is host dependent.

@see    winc_adapter_init

@return
    The functions returns a non-zero value to indicate if an interrupt service has been acknowledged by the ADAPTER.
*/
int_fast8_t winc_adapter_interrupt_serviced(bool bEdgeInt);

/**@}*/     // ADAPTERInt
/**@addtogroup ADAPTERSPI
 * @{
 */
/*!
@fn \
    int_fast8_t winc_adapter_spi_open(void);

@brief
    Called by the driver to open the SPI bus for use.

@pre
    Initialize @ref winc_adapter_init first.

@note
    Implementation of this function is host dependent.

@see    winc_adapter_init

@return
    The function returns a value of 1 for successful operations and a 0 value otherwise.
*/
int_fast8_t winc_adapter_spi_open(void);

/*!
@fn \
    int_fast8_t winc_adapter_spi_close(void);

@brief
    Called by the driver to close the SPI bus. @ref winc_adapter_spi_open should have been called before this.

@pre
    Initialize @ref winc_adapter_init first and @ref winc_adapter_spi_open must have been called.

@note
    Implementation of this function is host dependent.

@see    winc_adapter_init
@see    winc_adapter_spi_open

@return
    The function returns a value of 1 for successful operations and a 0 value otherwise.
*/
int_fast8_t winc_adapter_spi_close(void);

/*!
@fn \
    int_fast8_t winc_adapter_spi_write(const uint8_t *puBuf, size_t size);

@brief
    Called by the driver to write data to the SPI bus.

@param[in]  puBuf
    A pointer to the data to be written to the SPI bus.

@param[in]  size
    The number of bytes to be written.

@pre
    Initialize @ref winc_adapter_init first and @ref winc_adapter_spi_open must have been called.

@note
    Implementation of this function is host dependent.

@see    winc_adapter_init
@see    winc_adapter_spi_open

@return
    The function returns a value of 1 for successful operations and a 0 value otherwise.
*/
int_fast8_t winc_adapter_spi_write(const uint8_t *puBuf, size_t size);

/*!
@fn \
    int_fast8_t winc_adapter_spi_read(uint8_t *puBuf, size_t size);

@brief
    Called by the driver to read data from the SPI bus.

@param[in]  puBuf
    A pointer to a buffer to which the data should be written.

@param[in]  size
    The number of bytes to be read.

@pre
    Initialize @ref winc_adapter_init first and @ref winc_adapter_spi_open must have been called.

@note
    Implementation of this function is host dependent.

@see    winc_adapter_init
@see    winc_adapter_spi_open

@return
    The function returns a value of 1 for successful operations and a 0 value otherwise.
*/
int_fast8_t winc_adapter_spi_read(uint8_t *puBuf, size_t size);

/**@}*/     // ADAPTERSPI
/**@addtogroup ADAPTERGPIO
 * @{
 */
/*!
@fn \
    void winc_adapter_chip_enable_assert(void);

@brief
    Called by the driver when the chip enable line should be asserted.
*/
void winc_adapter_chip_enable_assert(void);

/*!
@fn \
    void winc_adapter_chip_enable_deassert(void);

@brief
    Called by the driver when the chip enable line should be de-asserted.
*/
void winc_adapter_chip_enable_deassert(void);

/*!
@fn \
    void winc_adapter_reset_assert(void);

@brief
    Called by the driver when the WINC reset line should be asserted.
*/
void winc_adapter_reset_assert(void);

/*!
@fn \
    void winc_adapter_reset_deassert(void);

@brief
    Called by the driver when the WINC reset line should be de-asserted.
*/
void winc_adapter_reset_deassert(void);

/**@}*/     // ADAPTERGPIO
/**@addtogroup ADAPTERUART
 * @{
 */
/*!
@fn \
    int_fast8_t winc_adapter_uart_open(uint32_t u32BaudRate);

@brief
    Called by the driver to open the UART.

@return
    The function returns a value of 1 for successful operations and a 0 value otherwise.
*/
int_fast8_t winc_adapter_uart_open(uint32_t u32BaudRate);

/*!
@fn \
    int_fast8_t winc_adapter_uart_close(void);

@brief
    Called by the driver to close the UART.

@return
    The function returns a value of 1 for successful operations and a 0 value otherwise.
*/
int_fast8_t winc_adapter_uart_close(void);

/*!
@fn \
    int_fast8_t winc_adapter_uart_set_baudrate(uint32_t u32BaudRate);

@brief
    Called by the driver to set the UART baud rate.

@return
    The function returns a value of 1 for successful operations and a 0 value otherwise.
*/
int_fast8_t winc_adapter_uart_set_baudrate(uint32_t u32BaudRate);

/*!
@fn \
    size_t winc_adapter_uart_write(const uint8_t *pu8Buf, size_t szLength);

@brief
    Called by the driver to write data to the UART.

@note
    This function must either indicate all bytes were accepted or an error occurred.

@return
    The number of bytes written to the UART or zero for no data/error.
*/
size_t winc_adapter_uart_write(const uint8_t *pu8Buf, size_t szLength);

/*!
@fn \
    size_t winc_adapter_uart_read(uint8_t *pu8Buf, size_t szLength);

@brief
    Called by the driver to read data from the UART.

@return
    The number of bytes read, this may be less than \p szLength
*/
size_t winc_adapter_uart_read(uint8_t *pu8Buf, size_t szLength);

/**@}*/     // ADAPTERUART

#ifdef __cplusplus
}
#endif

#endif  /*_WINC_ADAPTER_H_*/
