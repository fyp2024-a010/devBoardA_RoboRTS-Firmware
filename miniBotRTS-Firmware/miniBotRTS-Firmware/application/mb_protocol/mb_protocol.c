#include "mb_protocol.h"
#include <stdint.h>

int32_t test32 = 0;
// REQ TYPE
int32_t request_type;
uint32_t receving_data = 0;
int32_t data_received = 0;
uint8_t ready2send = 0;

struct twist_msg twist;
struct odom_msg odom;
struct imu_msg imu;

uint8_t determine_receiving_data(int32_t cmd);

int32_t get_cmd_vel_response(int32_t cmd_type, int32_t cmd_data);
int32_t get_odom_response(int32_t odom_type);
int32_t get_imu_response(int32_t imu_type);

int32_t process_request(uint8_t *buf) {
  int32_t rcv_value = bytes_to_int32(buf, LITTLE_ENDIAN);
  test32 = rcv_value;
  if (receving_data == 1) {
    receving_data = 0;
    data_received = rcv_value;
  } else {
    request_type = rcv_value;
    receving_data = determine_receiving_data(request_type);
  }
  return rcv_value;
}

uint8_t get_ready2send_status(void) { return ready2send; }

uint8_t determine_receiving_data(int32_t cmd) {
  if (cmd == CMD_VEL_LINEAR_X || cmd == CMD_VEL_LINEAR_Y ||
      cmd == CMD_VEL_LINEAR_Z || cmd == CMD_VEL_ANGULAR_X ||
      cmd == CMD_VEL_ANGULAR_Y || cmd == CMD_VEL_ANGULAR_Z) {
    return 1;
  } else {
    return 0;
  }
}

int32_t get_response(void) {
  if (request_type == CMD_VEL_LINEAR_X || request_type == CMD_VEL_LINEAR_Y ||
      request_type == CMD_VEL_LINEAR_Z || request_type == CMD_VEL_ANGULAR_X ||
      request_type == CMD_VEL_ANGULAR_Y || request_type == CMD_VEL_ANGULAR_Z) {
    return get_cmd_vel_response(request_type, data_received);
  } else if (request_type == ODOM_POINT_X || request_type == ODOM_POINT_Y ||
             request_type == ODOM_POINT_Z || request_type == ODOM_LINEAR_X ||
             request_type == ODOM_LINEAR_Y || request_type == ODOM_LINEAR_Z ||
             request_type == ODOM_ANGULAR_X || request_type == ODOM_ANGULAR_Y ||
             request_type == ODOM_ANGULAR_Z ||
             request_type == ODOM_QUATERNION_X ||
             request_type == ODOM_QUATERNION_Y ||
             request_type == ODOM_QUATERNION_Z ||
             request_type == ODOM_QUATERNION_W) {
    return get_odom_response(request_type);
  } else if (request_type == IMU_ACCEL_X || request_type == IMU_ACCEL_Y ||
             request_type == IMU_ACCEL_Z || request_type == IMU_ANGULAR_X ||
             request_type == IMU_ANGULAR_Y || request_type == IMU_ANGULAR_Z ||
             request_type == IMU_QUATERNION_X ||
             request_type == IMU_QUATERNION_Y ||
             request_type == IMU_QUATERNION_Z ||
             request_type == IMU_QUATERNION_W) {
    return get_imu_response(request_type);
  } else {
    return ACK;
  }
}

int32_t get_cmd_vel_response(int32_t cmd_type, int32_t cmd_data) {
  float cmd_vel_data = int32_to_float_scaled(cmd_data);
  switch (cmd_type) {
  case CMD_VEL_LINEAR_X:
    twist.linear.x = cmd_vel_data;
    break;
  case CMD_VEL_LINEAR_Y:
    twist.linear.y = cmd_vel_data;
    break;
  case CMD_VEL_LINEAR_Z:
    twist.linear.z = cmd_vel_data;
    break;
  case CMD_VEL_ANGULAR_X:
    twist.angular.x = cmd_vel_data;
    break;
  case CMD_VEL_ANGULAR_Y:
    twist.angular.y = cmd_vel_data;
    break;
  case CMD_VEL_ANGULAR_Z:
    twist.angular.z = cmd_vel_data;
    break;
  default:
    twist.linear.x = 0;
    twist.linear.y = 0;
    twist.linear.z = 0;
    twist.angular.x = 0;
    twist.angular.y = 0;
    twist.angular.z = 0;
  }
  return ACK;
}

int32_t get_odom_response(int32_t odom_type) {
  switch (odom_type) {
  case ODOM_POINT_X:
    return float_to_int32_scaled(odom.point.x);
  case ODOM_POINT_Y:
    return float_to_int32_scaled(odom.point.y);
  case ODOM_POINT_Z:
    return float_to_int32_scaled(odom.point.z);
  case ODOM_QUATERNION_X:
    return float_to_int32_scaled(odom.quaternion.x);
  case ODOM_QUATERNION_Y:
    return float_to_int32_scaled(odom.quaternion.y);
  case ODOM_QUATERNION_Z:
    return float_to_int32_scaled(odom.quaternion.z);
  case ODOM_QUATERNION_W:
    return float_to_int32_scaled(odom.quaternion.w);
  case ODOM_LINEAR_X:
    return float_to_int32_scaled(odom.linear.x);
  case ODOM_LINEAR_Y:
    return float_to_int32_scaled(odom.linear.y);
  case ODOM_LINEAR_Z:
    return float_to_int32_scaled(odom.linear.z);
  case ODOM_ANGULAR_X:
    return float_to_int32_scaled(odom.angular.x);
  case ODOM_ANGULAR_Y:
    return float_to_int32_scaled(odom.angular.y);
  case ODOM_ANGULAR_Z:
    return float_to_int32_scaled(odom.angular.z);
  default:
    return ACK;
  }
  return ACK;
}

int32_t get_imu_response(int32_t imu_type) {
  switch (imu_type) {
  case IMU_QUATERNION_X:
    return float_to_int32_scaled(imu.quaternion.x);
  case IMU_QUATERNION_Y:
    return float_to_int32_scaled(imu.quaternion.y);
  case IMU_QUATERNION_Z:
    return float_to_int32_scaled(imu.quaternion.z);
  case IMU_QUATERNION_W:
    return float_to_int32_scaled(imu.quaternion.w);
  case IMU_ANGULAR_X:
    return float_to_int32_scaled(imu.angular.x);
  case IMU_ANGULAR_Y:
    return float_to_int32_scaled(imu.angular.y);
  case IMU_ANGULAR_Z:
    return float_to_int32_scaled(imu.angular.z);
  case IMU_ACCEL_X:
    return float_to_int32_scaled(imu.accel.x);
  case IMU_ACCEL_Y:
    return float_to_int32_scaled(imu.accel.y);
  case IMU_ACCEL_Z:
    return float_to_int32_scaled(imu.accel.z);
  default:
    return ACK;
  }
  return ACK;
}

int32_t float_to_int32_scaled(float num) {
  return (int32_t)(num * SIGNIFICANT_FIGURE);
}
float int32_to_float_scaled(int32_t num) {
  return (float)num / SIGNIFICANT_FIGURE;
}

uint8_t int32_to_bytes(int32_t value, uint8_t *bytes, int8_t is_big_endian) {
  // Converts an int32_t value to a byte array.
  if (is_big_endian) {
    bytes[0] = (value >> 24) & 0xFF;
    bytes[1] = (value >> 16) & 0xFF;
    bytes[2] = (value >> 8) & 0xFF;
    bytes[3] = value & 0xFF;
  } else {
    bytes[0] = value & 0xFF;
    bytes[1] = (value >> 8) & 0xFF;
    bytes[2] = (value >> 16) & 0xFF;
    bytes[3] = (value >> 24) & 0xFF;
  }
  return 0;
}

int32_t bytes_to_int32(uint8_t *bytes, int8_t is_big_endian) {
  //  Converts a byte array to an int32_t value.

  int32_t value = 0;
  if (is_big_endian) {
    // Big-endian: most significant byte first
    value = (bytes[0] << 24) | (bytes[1] << 16) | (bytes[2] << 8) | bytes[3];
  } else {
    // Little-endian: least significant byte first
    value = (bytes[3] << 24) | (bytes[2] << 16) | (bytes[1] << 8) | bytes[0];
  }
  return value;
}
