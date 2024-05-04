#ifndef APPLICATION_MB_PROTOCOL_MB_PROTOCOL_H_
#define APPLICATION_MB_PROTOCOL_MB_PROTOCOL_H_

#include <stdint.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

// CMD TYPES
#define __RESERVED__ 	    0x100
#define ACK 			    0x101
#define IGNORE 			    0x102

#define CMD_VEL 		    0x200
#define CMD_VEL_LINEAR_X 	0x201
#define CMD_VEL_LINEAR_Y 	0x202
#define CMD_VEL_LINEAR_Z    0x203
#define CMD_VEL_ANGULAR_X 	0x204
#define CMD_VEL_ANGULAR_Y 	0x205
#define CMD_VEL_ANGULAR_Z 	0x206

#define ODOM 			    0x300
#define ODOM_POINT_X 	    0x301
#define ODOM_POINT_Y 	    0x302
#define ODOM_POINT_Z 	    0x303
#define ODOM_QUATERNION_X 	0x304
#define ODOM_QUATERNION_Y 	0x305
#define ODOM_QUATERNION_Z 	0x306
#define ODOM_QUATERNION_W 	0x307
#define ODOM_LINEAR_X 	    0x308
#define ODOM_LINEAR_Y 	    0x309
#define ODOM_LINEAR_Z 	    0x310
#define ODOM_ANGULAR_X 	    0x311
#define ODOM_ANGULAR_Y 	    0x312
#define ODOM_ANGULAR_Z 	    0x313

#define IMU 			    0x400
#define IMU_QUATERNION_X 	0x401
#define IMU_QUATERNION_Y 	0x402
#define IMU_QUATERNION_Z 	0x403
#define IMU_QUATERNION_W 	0x404
#define IMU_ANGULAR_X 	    0x405
#define IMU_ANGULAR_Y 	    0x406
#define IMU_ANGULAR_Z 	    0x407
#define IMU_ACCEL_X 	    0x408
#define IMU_ACCEL_Y 	    0x409
#define IMU_ACCEL_Z 	    0x410

#define SIGNIFICANT_FIGURE	100000.0f
#define LITTLE_ENDIAN 		0

struct vector3_msg
{
    float x;
    float y;
    float z;
};

struct vector4_msg
{
    float x;
    float y;
    float z;
    float w;
};

struct twist_msg
{
    struct vector3_msg linear;
    struct vector3_msg angular;
};

struct odom_msg
{
    struct vector3_msg point;
    struct vector4_msg quaternion;
    struct vector3_msg linear;
    struct vector3_msg angular;
};

struct imu_msg
{
    struct vector4_msg quaternion;
    struct vector3_msg angular;
    struct vector3_msg accel;
};

int32_t process_request(uint8_t *buf);
uint8_t get_ready2send_status(void);

uint8_t int32_to_bytes(int32_t value, uint8_t *bytes, int8_t is_big_endian);
int32_t float_to_int32_scaled(float num);
float int32_to_float_scaled(int32_t num);
int32_t bytes_to_int32(uint8_t *bytes, int8_t is_big_endian);

#endif /* APPLICATION_MB_PROTOCOL_MB_PROTOCOL_H_ */
