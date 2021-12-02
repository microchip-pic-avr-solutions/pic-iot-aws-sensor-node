#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PICIoT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PICIoT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/cli/cli.c mcc_generated_files/cloud/crypto_client/crypto_client.c mcc_generated_files/cloud/wifi_service.c mcc_generated_files/cloud/cloud_service.c mcc_generated_files/cloud/aws_cloud_service.c mcc_generated_files/cloud/mqtt_service.c mcc_generated_files/credentials_storage/credentials_storage.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.c mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.c mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.c mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.c mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.c mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.c mcc_generated_files/CryptoAuthenticationLibrary/atca_command.c mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.c mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.c mcc_generated_files/CryptoAuthenticationLibrary/atca_device.c mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.c mcc_generated_files/drivers/i2c_simple_master.c mcc_generated_files/drivers/i2c_types.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/drivers/i2c_master.c mcc_generated_files/drivers/uart.c mcc_generated_files/drivers/timeout.c mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.c mcc_generated_files/mqtt/mqtt_core/mqtt_core.c mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.c mcc_generated_files/mqtt/mqtt_packetTransfer_interface.c mcc_generated_files/mqtt/mqtt_winc_adapter.c mcc_generated_files/winc/driver/winc_spi.c mcc_generated_files/winc/driver/winc_hif.c mcc_generated_files/winc/driver/winc_asic.c mcc_generated_files/winc/driver/winc_adapter.c mcc_generated_files/winc/driver/winc_drv.c mcc_generated_files/winc/m2m/m2m_ota.c mcc_generated_files/winc/m2m/m2m_crypto.c mcc_generated_files/winc/m2m/m2m_fwinfo.c mcc_generated_files/winc/m2m/m2m_ssl.c mcc_generated_files/winc/m2m/m2m_wifi.c mcc_generated_files/winc/m2m/m2m_periph.c mcc_generated_files/winc/socket/socket.c mcc_generated_files/winc/spi_flash/flexible_flash.c mcc_generated_files/winc/spi_flash/spi_flash.c mcc_generated_files/adc1.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/application_manager.c mcc_generated_files/sensors_handling.c mcc_generated_files/delay.c mcc_generated_files/clock.c mcc_generated_files/tmr2.c mcc_generated_files/tmr1.c mcc_generated_files/uart1.c mcc_generated_files/system.c mcc_generated_files/led.c mcc_generated_files/debug_print.c mcc_generated_files/i2c2_driver.c mcc_generated_files/interrupt_manager.c mcc_generated_files/traps.c mcc_generated_files/spi1_driver.c mcc_generated_files/time_service.c mcc_generated_files/CryptoAuth_init.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/cli/cli.o ${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o ${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o ${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o ${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o ${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o ${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o ${OBJECTDIR}/mcc_generated_files/drivers/uart.o ${OBJECTDIR}/mcc_generated_files/drivers/timeout.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/application_manager.o ${OBJECTDIR}/mcc_generated_files/sensors_handling.o ${OBJECTDIR}/mcc_generated_files/delay.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/led.o ${OBJECTDIR}/mcc_generated_files/debug_print.o ${OBJECTDIR}/mcc_generated_files/i2c2_driver.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o ${OBJECTDIR}/mcc_generated_files/time_service.o ${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/cli/cli.o.d ${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o.d ${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o.d ${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o.d ${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o.d ${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o.d ${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o.d ${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o.d ${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o.d ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d ${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o.d ${OBJECTDIR}/mcc_generated_files/drivers/uart.o.d ${OBJECTDIR}/mcc_generated_files/drivers/timeout.o.d ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o.d ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o.d ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o.d ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o.d ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d ${OBJECTDIR}/mcc_generated_files/adc1.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/application_manager.o.d ${OBJECTDIR}/mcc_generated_files/sensors_handling.o.d ${OBJECTDIR}/mcc_generated_files/delay.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/tmr2.o.d ${OBJECTDIR}/mcc_generated_files/tmr1.o.d ${OBJECTDIR}/mcc_generated_files/uart1.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/led.o.d ${OBJECTDIR}/mcc_generated_files/debug_print.o.d ${OBJECTDIR}/mcc_generated_files/i2c2_driver.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d ${OBJECTDIR}/mcc_generated_files/time_service.o.d ${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/cli/cli.o ${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o ${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o ${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o ${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o ${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o ${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o ${OBJECTDIR}/mcc_generated_files/drivers/uart.o ${OBJECTDIR}/mcc_generated_files/drivers/timeout.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/application_manager.o ${OBJECTDIR}/mcc_generated_files/sensors_handling.o ${OBJECTDIR}/mcc_generated_files/delay.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/led.o ${OBJECTDIR}/mcc_generated_files/debug_print.o ${OBJECTDIR}/mcc_generated_files/i2c2_driver.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o ${OBJECTDIR}/mcc_generated_files/time_service.o ${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=mcc_generated_files/cli/cli.c mcc_generated_files/cloud/crypto_client/crypto_client.c mcc_generated_files/cloud/wifi_service.c mcc_generated_files/cloud/cloud_service.c mcc_generated_files/cloud/aws_cloud_service.c mcc_generated_files/cloud/mqtt_service.c mcc_generated_files/credentials_storage/credentials_storage.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.c mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.c mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.c mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.c mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.c mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.c mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.c mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.c mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.c mcc_generated_files/CryptoAuthenticationLibrary/atca_command.c mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.c mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.c mcc_generated_files/CryptoAuthenticationLibrary/atca_device.c mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.c mcc_generated_files/drivers/i2c_simple_master.c mcc_generated_files/drivers/i2c_types.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/drivers/i2c_master.c mcc_generated_files/drivers/uart.c mcc_generated_files/drivers/timeout.c mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.c mcc_generated_files/mqtt/mqtt_core/mqtt_core.c mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.c mcc_generated_files/mqtt/mqtt_packetTransfer_interface.c mcc_generated_files/mqtt/mqtt_winc_adapter.c mcc_generated_files/winc/driver/winc_spi.c mcc_generated_files/winc/driver/winc_hif.c mcc_generated_files/winc/driver/winc_asic.c mcc_generated_files/winc/driver/winc_adapter.c mcc_generated_files/winc/driver/winc_drv.c mcc_generated_files/winc/m2m/m2m_ota.c mcc_generated_files/winc/m2m/m2m_crypto.c mcc_generated_files/winc/m2m/m2m_fwinfo.c mcc_generated_files/winc/m2m/m2m_ssl.c mcc_generated_files/winc/m2m/m2m_wifi.c mcc_generated_files/winc/m2m/m2m_periph.c mcc_generated_files/winc/socket/socket.c mcc_generated_files/winc/spi_flash/flexible_flash.c mcc_generated_files/winc/spi_flash/spi_flash.c mcc_generated_files/adc1.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/application_manager.c mcc_generated_files/sensors_handling.c mcc_generated_files/delay.c mcc_generated_files/clock.c mcc_generated_files/tmr2.c mcc_generated_files/tmr1.c mcc_generated_files/uart1.c mcc_generated_files/system.c mcc_generated_files/led.c mcc_generated_files/debug_print.c mcc_generated_files/i2c2_driver.c mcc_generated_files/interrupt_manager.c mcc_generated_files/traps.c mcc_generated_files/spi1_driver.c mcc_generated_files/time_service.c mcc_generated_files/CryptoAuth_init.c main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PICIoT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ128GA705
MP_LINKER_FILE_OPTION=,--script=p24FJ128GA705.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/cli/cli.o: mcc_generated_files/cli/cli.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cli" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cli/cli.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cli/cli.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cli/cli.c  -o ${OBJECTDIR}/mcc_generated_files/cli/cli.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cli/cli.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cli/cli.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o: mcc_generated_files/cloud/crypto_client/crypto_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud/crypto_client" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/crypto_client/crypto_client.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o: mcc_generated_files/cloud/wifi_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/wifi_service.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o: mcc_generated_files/cloud/cloud_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/cloud_service.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o: mcc_generated_files/cloud/aws_cloud_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/aws_cloud_service.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o: mcc_generated_files/cloud/mqtt_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/mqtt_service.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o: mcc_generated_files/credentials_storage/credentials_storage.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/credentials_storage" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/credentials_storage/credentials_storage.c  -o ${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o: mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o: mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o: mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o: mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o: mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_command.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_device.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o: mcc_generated_files/drivers/i2c_simple_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/i2c_simple_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o: mcc_generated_files/drivers/i2c_types.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/i2c_types.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/spi_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o: mcc_generated_files/drivers/i2c_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/i2c_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/uart.o: mcc_generated_files/drivers/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/uart.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/uart.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/uart.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/timeout.o: mcc_generated_files/drivers/timeout.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/timeout.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/timeout.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/timeout.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/timeout.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/timeout.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/timeout.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o: mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o: mcc_generated_files/mqtt/mqtt_core/mqtt_core.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_core/mqtt_core.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o: mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o: mcc_generated_files/mqtt/mqtt_packetTransfer_interface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_packetTransfer_interface.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o: mcc_generated_files/mqtt/mqtt_winc_adapter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_winc_adapter.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o: mcc_generated_files/winc/driver/winc_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_spi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o: mcc_generated_files/winc/driver/winc_hif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_hif.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o: mcc_generated_files/winc/driver/winc_asic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_asic.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o: mcc_generated_files/winc/driver/winc_adapter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_adapter.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o: mcc_generated_files/winc/driver/winc_drv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_drv.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o: mcc_generated_files/winc/m2m/m2m_ota.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ota.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o: mcc_generated_files/winc/m2m/m2m_crypto.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_crypto.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o: mcc_generated_files/winc/m2m/m2m_fwinfo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_fwinfo.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o: mcc_generated_files/winc/m2m/m2m_ssl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ssl.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o: mcc_generated_files/winc/m2m/m2m_wifi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_wifi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o: mcc_generated_files/winc/m2m/m2m_periph.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_periph.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o: mcc_generated_files/winc/socket/socket.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/socket" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/socket/socket.c  -o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o: mcc_generated_files/winc/spi_flash/flexible_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/flexible_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o: mcc_generated_files/winc/spi_flash/spi_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/spi_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/adc1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mcc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/application_manager.o: mcc_generated_files/application_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/application_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/application_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/application_manager.c  -o ${OBJECTDIR}/mcc_generated_files/application_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/application_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/application_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/sensors_handling.o: mcc_generated_files/sensors_handling.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/sensors_handling.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/sensors_handling.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/sensors_handling.c  -o ${OBJECTDIR}/mcc_generated_files/sensors_handling.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/sensors_handling.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/sensors_handling.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/delay.c  -o ${OBJECTDIR}/mcc_generated_files/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/delay.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/delay.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/clock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr2.c  -o ${OBJECTDIR}/mcc_generated_files/tmr2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/uart1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/led.o: mcc_generated_files/led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/led.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/led.c  -o ${OBJECTDIR}/mcc_generated_files/led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/led.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/debug_print.o: mcc_generated_files/debug_print.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/debug_print.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/debug_print.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/debug_print.c  -o ${OBJECTDIR}/mcc_generated_files/debug_print.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/debug_print.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/debug_print.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/i2c2_driver.o: mcc_generated_files/i2c2_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c2_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c2_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/i2c2_driver.c  -o ${OBJECTDIR}/mcc_generated_files/i2c2_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c2_driver.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/i2c2_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi1_driver.c  -o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/time_service.o: mcc_generated_files/time_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/time_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/time_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/time_service.c  -o ${OBJECTDIR}/mcc_generated_files/time_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/time_service.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/time_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o: mcc_generated_files/CryptoAuth_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuth_init.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/mcc_generated_files/cli/cli.o: mcc_generated_files/cli/cli.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cli" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cli/cli.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cli/cli.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cli/cli.c  -o ${OBJECTDIR}/mcc_generated_files/cli/cli.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cli/cli.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cli/cli.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o: mcc_generated_files/cloud/crypto_client/crypto_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud/crypto_client" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/crypto_client/crypto_client.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/crypto_client/crypto_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o: mcc_generated_files/cloud/wifi_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/wifi_service.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/wifi_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o: mcc_generated_files/cloud/cloud_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/cloud_service.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/cloud_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o: mcc_generated_files/cloud/aws_cloud_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/aws_cloud_service.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/aws_cloud_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o: mcc_generated_files/cloud/mqtt_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cloud" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cloud/mqtt_service.c  -o ${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/cloud/mqtt_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o: mcc_generated_files/credentials_storage/credentials_storage.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/credentials_storage" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/credentials_storage/credentials_storage.c  -o ${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/credentials_storage/credentials_storage.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_pem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_der.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_def.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_hw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_host_sw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o: mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atcacert/atcacert_date.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_selftest.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_ecdh.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_nonce.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_privwrite.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_helpers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_counter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_aes.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_gendig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_hmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_write.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_kdf.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_random.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_genkey.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sign.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_verify.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_secureboot.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_derivekey.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_read.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_info.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_mac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_checkmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_sha.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_updateextra.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o: mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/basic/atca_basic_lock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha1_routines.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/hashes/sha2_routines.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_ecdsa.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_rand.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o: mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/crypto/atca_crypto_sw_sha1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o: mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_i2c_hal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o: mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/atca_hal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o: mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/hal/hal_i2c_timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o: mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/host/atca_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o: mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/jwt/atca_jwt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_command.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_command.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_execution.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_cfgs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_device.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_device.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o: mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuthenticationLibrary/atca_iface.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o: mcc_generated_files/drivers/i2c_simple_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/i2c_simple_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/i2c_simple_master.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o: mcc_generated_files/drivers/i2c_types.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/i2c_types.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/i2c_types.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/spi_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o: mcc_generated_files/drivers/i2c_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/i2c_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/i2c_master.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/uart.o: mcc_generated_files/drivers/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/uart.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/uart.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/uart.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/drivers/timeout.o: mcc_generated_files/drivers/timeout.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/timeout.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/timeout.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/timeout.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/timeout.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/timeout.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/drivers/timeout.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o: mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_comm_bsd/mqtt_comm_layer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o: mcc_generated_files/mqtt/mqtt_core/mqtt_core.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_core/mqtt_core.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_core/mqtt_core.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o: mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_exchange_buffer/mqtt_exchange_buffer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o: mcc_generated_files/mqtt/mqtt_packetTransfer_interface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_packetTransfer_interface.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_packetTransfer_interface.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o: mcc_generated_files/mqtt/mqtt_winc_adapter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mqtt" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mqtt/mqtt_winc_adapter.c  -o ${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mqtt/mqtt_winc_adapter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o: mcc_generated_files/winc/driver/winc_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_spi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o: mcc_generated_files/winc/driver/winc_hif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_hif.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o: mcc_generated_files/winc/driver/winc_asic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_asic.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o: mcc_generated_files/winc/driver/winc_adapter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_adapter.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o: mcc_generated_files/winc/driver/winc_drv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_drv.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o: mcc_generated_files/winc/m2m/m2m_ota.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ota.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o: mcc_generated_files/winc/m2m/m2m_crypto.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_crypto.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o: mcc_generated_files/winc/m2m/m2m_fwinfo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_fwinfo.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o: mcc_generated_files/winc/m2m/m2m_ssl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ssl.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o: mcc_generated_files/winc/m2m/m2m_wifi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_wifi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o: mcc_generated_files/winc/m2m/m2m_periph.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_periph.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o: mcc_generated_files/winc/socket/socket.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/socket" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/socket/socket.c  -o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o: mcc_generated_files/winc/spi_flash/flexible_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/flexible_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o: mcc_generated_files/winc/spi_flash/spi_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/spi_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/adc1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mcc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/application_manager.o: mcc_generated_files/application_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/application_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/application_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/application_manager.c  -o ${OBJECTDIR}/mcc_generated_files/application_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/application_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/application_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/sensors_handling.o: mcc_generated_files/sensors_handling.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/sensors_handling.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/sensors_handling.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/sensors_handling.c  -o ${OBJECTDIR}/mcc_generated_files/sensors_handling.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/sensors_handling.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/sensors_handling.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/delay.c  -o ${OBJECTDIR}/mcc_generated_files/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/delay.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/clock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr2.c  -o ${OBJECTDIR}/mcc_generated_files/tmr2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/uart1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/led.o: mcc_generated_files/led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/led.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/led.c  -o ${OBJECTDIR}/mcc_generated_files/led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/led.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/debug_print.o: mcc_generated_files/debug_print.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/debug_print.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/debug_print.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/debug_print.c  -o ${OBJECTDIR}/mcc_generated_files/debug_print.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/debug_print.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/debug_print.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/i2c2_driver.o: mcc_generated_files/i2c2_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c2_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c2_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/i2c2_driver.c  -o ${OBJECTDIR}/mcc_generated_files/i2c2_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c2_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/i2c2_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi1_driver.c  -o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/time_service.o: mcc_generated_files/time_service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/time_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/time_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/time_service.c  -o ${OBJECTDIR}/mcc_generated_files/time_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/time_service.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/time_service.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o: mcc_generated_files/CryptoAuth_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/CryptoAuth_init.c  -o ${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/CryptoAuth_init.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -ffunction-sections -O0 -DAWS_IOT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PICIoT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PICIoT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary"     -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PICIoT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PICIoT.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -I"mcc_generated_files" -I"mcc_generated_files/CryptoAuthenticationLibrary" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PICIoT.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default
