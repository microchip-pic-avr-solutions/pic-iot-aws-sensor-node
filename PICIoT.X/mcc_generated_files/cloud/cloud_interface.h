/*
 * cloud_type.h
 *
 */ 

#ifndef CLOUD_INTERFACE_H
#define CLOUD_INTERFACE_H

#include <stdbool.h>
#include <stdint.h>
#include "../drivers/timeout.h"
#include "mqtt_service.h"

#define CLOUD_RESET_TIMEOUT            2000L   // 2 seconds

typedef union
{
    uint8_t allBits;
    struct
    {
        unsigned cloudInitialized :1;
        unsigned cloudResetTimerFlag :1;
        unsigned isResetting :1;
        unsigned waitingForMQTT :1;
        unsigned sendSubscribe :1;
        unsigned unassigned :3;
    };
}cloudStatus_t;

extern cloudStatus_t cloudStatus;

extern publishReceptionHandler_t imqtt_publishReceiveCallBackTable[];

/** \brief Function pointer for interaction between the cloud core and user 
 * application to transition through differet cloud states.
 **/
typedef void (*cloudInitPtr)(timerStruct_t*, timerStruct_t*); 
typedef int8_t (*cloudConnectSocketPtr)(uint32_t);
typedef void (*cloudConnectAppProtocolPtr) (void);
typedef void (*cloudSubscribePtr) (void);
typedef void (*cloudPublishPtr) (uint8_t* , uint8_t*, uint16_t);
typedef void (*cloudDisconnectPtr) (void);
typedef bool (*cloudIsConnectedPtr) (void);
typedef bool (*cloudIsDisconnectedPtr) (void);

typedef struct
{
    cloudInitPtr cloudInit;
    cloudConnectSocketPtr cloudConnectSocket;
    cloudConnectAppProtocolPtr cloudConnectAppProtocol;
    cloudSubscribePtr cloudSubscribe;
    cloudPublishPtr cloudPublish;
    cloudDisconnectPtr cloudDisconnect;
    cloudIsConnectedPtr cloudIsConnected;
    cloudIsDisconnectedPtr cloudIsDisconnected;
}cloudContext_t;

void CLOUD_init(timerStruct_t* appProtocolTimeoutTaskTimer, timerStruct_t* cloudResetTaskTimer);
int8_t CLOUD_connectSocket(uint32_t ipAddress);
void CLOUD_connectAppProtocol(void);
void CLOUD_subscribe(void);
void CLOUD_publish(uint8_t* refToPublishTopic, uint8_t* data, uint16_t len);
void CLOUD_disconnect(void);
bool CLOUD_isConnected(void);
bool CLOUD_isDisconnected(void);

#endif /* CLOUD_INTERFACE_H */
