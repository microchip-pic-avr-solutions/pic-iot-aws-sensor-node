#ifndef CLOUD_CONFIG_H
#define CLOUD_CONFIG_H

#define USE_CUSTOM_ENDPOINT_URL (0)
//Configure the macro "CFG_MQTT_HOSTURL" in "mqtt_config.h" in the
//event of using custom end point URL(not reading the AWS Endpoint from WINC)

#define AWS_ENDPOINT_LEN (52)

//Thing Name configuration

//Use this thing Name in the event of not reading it from WINC
#define AWS_THING_NAME        ""  


// </h>
#endif // CLOUD_CONFIG_H
