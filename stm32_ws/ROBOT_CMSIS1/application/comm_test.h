#ifndef __COMM_TEST_H__
#define __COMM_TEST_H__

#ifdef COMM_TEST_H_GLOBAL
  #define COMM_TEST_H_EXTERN 
#else
  #define COMM_TEST_H_EXTERN extern
#endif

#define CHASSIS_CAN_ID        0x600

#define RECV_PROTOCOL_SIGNAL      ( 1 << 0 )
#define SEND_PROTOCOL_SIGNAL      ( 1 << 1 )

#define CHASSIS_ADDRESS        0x01
#define CMD_REPORT_VERSION                  (0x0002u)
#define FIRMWARE_VERSION ((FIRMWARE_VERSION_3 << 24) | (FIRMWARE_VERSION_2 << 16) | (FIRMWARE_VERSION_1 << 8) | FIRMWARE_VERSION_0)

#define CMD_PUSH_CHASSIS_INFO               (0x0201u)
#define CMD_SET_CHASSIS_MODE                (0x0202u)
#define CMD_SET_CHASSIS_SPEED               (0x0203u)
#define CMD_GET_CHASSIS_PARAM               (0x0204u)
#define CMD_SET_CHASSIS_SPD_ACC             (0x0205u)

enum interface{
  USB_INTERFACE = 0,
};


void comm_test_task(void const * argument);

#endif // __COMM_TEST_H__
