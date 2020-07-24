/*
 * cloud_service.h
 *
 * Created: 9/27/2018 2:25:12 PM
 *  Author: C14674
 */ 

#ifndef CLOUD_SERVICE_H_
#define CLOUD_SERVICE_H_

#include <stdbool.h>
#include <stdint.h>
#include "../mqtt/mqtt_packetTransfer_interface.h"


#define CLOUD_PACKET_RECV_TABLE_SIZE	2


typedef union
{
    uint8_t allBits;
    struct
    {
        unsigned amDisconnecting :1;           
        unsigned haveAPConnection :1;
        unsigned haveError :1;
        unsigned amConnectingAP : 1;
        unsigned amConnectingSocket : 1;
        unsigned amSoftAP: 1;
        unsigned amDefaultCred : 1;
        unsigned haveDataConnection : 1;
    };
} shared_networking_params_t;

extern shared_networking_params_t shared_networking_params;

void CLOUD_setupTask(char* deviceId);
void CLOUD_publishData(uint8_t* refToPublishTopic, uint8_t* data, unsigned int len);
void CLOUD_registerSubscription(uint8_t *topic, imqttHandlePublishDataFuncPtr subscriptionCallback);
bool CLOUD_checkIsConnected(void);
void CLOUD_reset(void);
#endif /* CLOUD_SERVICE_H_ */