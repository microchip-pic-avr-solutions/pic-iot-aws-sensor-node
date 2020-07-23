/*
    (c) 2019 Microchip Technology Inc. and its subsidiaries.  
	
    Subject to your compliance with these terms, you may use this 
    software and any derivatives exclusively with Microchip products. 

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
    FOR A PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, 
    COMBINATION WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
	
    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO 
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
    SOFTWARE. 

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
    TERMS.
*/

#include <string.h>
#include "atca_hal.h"
#include "atca_i2c_hal.h"
#include "../atca_device.h"
#include "../atca_status.h"
#include "../../clock.h"

#include "../../../mcc_generated_files/drivers/i2c_simple_master.h"

#define FCY (_XTAL_FREQ/2) // instruction cycle freq
#include <libpic30.h>


/** \brief initialize an I2C interface using given config
 * \param[in] hal - opaque ptr to HAL data
 * \param[in] cfg - interface configuration
 */
uint8_t i2c_address = 0;

ATCA_STATUS hal_i2c_init(void *hal, ATCAIfaceCfg *cfg)
{
        i2c_address = (cfg->atcai2c.slave_address) >> 1;
	
	return ATCA_SUCCESS;
}


/** \brief HAL implementation of I2C post init
 * \param[in] iface  instance
 * \return ATCA_SUCCESS
 */
ATCA_STATUS hal_i2c_post_init(ATCAIface iface)
{
    return ATCA_SUCCESS;
}


/** \brief HAL implementation of I2C send over ASF
 * \param[in] iface     instance
 * \param[in] txdata    pointer to space to bytes to send
 * \param[in] txlength  number of bytes to send
 * \return ATCA_STATUS
 */

ATCA_STATUS hal_i2c_send(ATCAIface iface, uint8_t *txdata, int txlength)
{
	txdata[0] = 0x03; // insert the Word Address Value, Command token
	txlength++;       // account for word address value byte.

	i2c_writeNBytes(i2c_address, txdata, txlength);

	return ATCA_SUCCESS;
}

/** \brief HAL implementation of I2C receive function for ASF I2C
 * \param[in] iface     instance
 * \param[in] rxdata    pointer to space to receive the data
 * \param[in] rxlength  ptr to expected number of receive bytes to request
 * \return ATCA_STATUS
 */

ATCA_STATUS hal_i2c_receive(ATCAIface iface, uint8_t *rxdata, uint16_t *rxlength)
{
	uint16_t      rxdata_max_size = *rxlength;

	*rxlength = 0;
	if (rxdata_max_size < 1) {
		return ATCA_SMALL_BUFFER;
	}

	*rxdata = 0;
	i2c_readNBytes(i2c_address, rxdata, 1);

	if ((rxdata[0] < ATCA_RSP_SIZE_MIN) || (rxdata[0] > ATCA_RSP_SIZE_MAX)) {
		return ATCA_INVALID_SIZE;
	}
	if (rxdata[0] > rxdata_max_size) {
		return ATCA_SMALL_BUFFER;
	}

	i2c_readNBytes(i2c_address, &rxdata[1], rxdata[0] - 1);
	*rxlength = rxdata[0];

	return ATCA_SUCCESS;
}

/** \brief wake up CryptoAuth device using I2C bus
 * \param[in] iface  interface to logical device to wakeup
 */

ATCA_STATUS hal_i2c_wake(ATCAIface iface)
{
        ATCAIfaceCfg *cfg  = atgetifacecfg(iface);
	uint32_t      bdrt = cfg->atcai2c.baud;
	uint8_t       data[4];
	uint8_t       zero_byte = 0;

	
	i2c_writeNBytes(i2c_address, &zero_byte, 1);

	atca_delay_us(cfg->wake_delay);

	// receive the wake up response
	i2c_readNBytes(i2c_address, data, 4);

	return hal_check_wake(data, 4);

}

/** \brief idle CryptoAuth device using I2C bus
 * \param[in] iface  interface to logical device to idle
 */

ATCA_STATUS hal_i2c_idle(ATCAIface iface)
{
	uint8_t data = 0x02;

	i2c_writeNBytes(i2c_address, &data, 1);

	return ATCA_SUCCESS;
}

/** \brief sleep CryptoAuth device using I2C bus
 * \param[in] iface  interface to logical device to sleep
 */

ATCA_STATUS hal_i2c_sleep(ATCAIface iface)
{
	uint8_t data = 0x01;

	i2c_writeNBytes(i2c_address, &data, 1);
        return ATCA_SUCCESS;
}

/** \brief manages reference count on given bus and releases resource if no more refences exist
 * \param[in] hal_data - opaque pointer to hal data structure - known only to the HAL implementation
 * return ATCA_SUCCESS
 */

ATCA_STATUS hal_i2c_release(void *hal_data)
{
    //TODO: For the moment, don't do anything

    return ATCA_SUCCESS;
}

/** \brief discover i2c buses available for this hardware
 * this maintains a list of logical to physical bus mappings freeing the application
 * of the a-priori knowledge
 * \param[in] i2c_buses - an array of logical bus numbers
 * \param[in] max_buses - maximum number of buses the app wants to attempt to discover
 * \return ATCA_SUCCESS
 */

ATCA_STATUS hal_i2c_discover_buses(int i2c_buses[], int max_buses)
{

    //TODO: For the moment, don't do anything

    return ATCA_SUCCESS;
}

/** \brief discover any CryptoAuth devices on a given logical bus number
 * \param[in]  busNum  logical bus number on which to look for CryptoAuth devices
 * \param[out] cfg     pointer to head of an array of interface config structures which get filled in by this method
 * \param[out] found   number of devices found on this bus
 * \return ATCA_SUCCESS
 */

ATCA_STATUS hal_i2c_discover_devices(int busNum, ATCAIfaceCfg cfg[], int *found)
{
	//TODO: For the moment, don't do anything

    return ATCA_SUCCESS;
}


/** @} */
