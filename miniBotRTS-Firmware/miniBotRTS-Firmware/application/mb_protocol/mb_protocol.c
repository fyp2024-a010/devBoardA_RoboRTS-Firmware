#include "mb_protocol.h"

// REQ TYPE
int32_t request_type;
uint32_t receving_data = 0;
int32_t data_received = 0;

uint8_t determine_receiving_data(int32_t cmd);

int32_t get_cmd_vel_response(struct twist_msg *twist_msg, int32_t cmd_type,
                             int32_t cmd_data);
int32_t get_odom_response(struct odom_msg *odom_msg, int32_t odom_type);
int32_t get_imu_response(struct imu_msg *imu_msg, int32_t imu_type);

int32_t process_request(uint8_t *buf) {
  int32_t rcv_value = bytes_to_int32(buf, LITTLE_ENDIAN);
  if (receving_data == 1) {
    receving_data = 0;
    data_received = rcv_value;
  } else {
    request_type = rcv_value;
    receving_data = determine_receiving_data(request_type);
  }
  return rcv_value;
}

uint8_t determine_receiving_data(int32_t cmd) {
  if (cmd == CMD_VEL_LINEAR_X || cmd == CMD_VEL_LINEAR_Y ||
      cmd == CMD_VEL_LINEAR_Z || cmd == CMD_VEL_ANGULAR_X ||
      cmd == CMD_VEL_ANGULAR_Y || cmd == CMD_VEL_ANGULAR_Z) {
    return 1;
  } else {
    return 0;
  }
}

int32_t get_response(struct twist_msg *twist_msg, struct odom_msg *odom_msg,
                     struct imu_msg *imu_msg) {
  if (request_type == CMD_VEL_LINEAR_X || request_type == CMD_VEL_LINEAR_Y ||
      request_type == CMD_VEL_LINEAR_Z || request_type == CMD_VEL_ANGULAR_X ||
      request_type == CMD_VEL_ANGULAR_Y || request_type == CMD_VEL_ANGULAR_Z) {
    return get_cmd_vel_response(twist_msg, request_type, data_received);
  } else if (request_type == ODOM_POINT_X || request_type == ODOM_POINT_Y ||
             request_type == ODOM_POINT_Z || request_type == ODOM_LINEAR_X ||
             request_type == ODOM_LINEAR_Y || request_type == ODOM_LINEAR_Z ||
             request_type == ODOM_ANGULAR_X || request_type == ODOM_ANGULAR_Y ||
             request_type == ODOM_ANGULAR_Z ||
             request_type == ODOM_QUATERNION_X ||
             request_type == ODOM_QUATERNION_Y ||
             request_type == ODOM_QUATERNION_Z ||
             request_type == ODOM_QUATERNION_W) {
    return get_odom_response(odom_msg, request_type);
  } else if (request_type == IMU_ACCEL_X || request_type == IMU_ACCEL_Y ||
             request_type == IMU_ACCEL_Z || request_type == IMU_ANGULAR_X ||
             request_type == IMU_ANGULAR_Y || request_type == IMU_ANGULAR_Z ||
             request_type == IMU_QUATERNION_X ||
             request_type == IMU_QUATERNION_Y ||
             request_type == IMU_QUATERNION_Z ||
             request_type == IMU_QUATERNION_W) {
    return get_imu_response(imu_msg, request_type);
  } else {
    return ACK;
  }
}

int32_t get_cmd_vel_response(struct twist_msg *twist_msg, int32_t cmd_type,
                             int32_t cmd_data) {
  float cmd_vel_data = int32_to_float_scaled(cmd_data);
  switch (cmd_type) {
  case CMD_VEL_LINEAR_X:
    twist_msg->linear.x = cmd_vel_data;
    break;
  case CMD_VEL_LINEAR_Y:
    twist_msg->linear.y = cmd_vel_data;
    break;
  case CMD_VEL_LINEAR_Z:
    twist_msg->linear.z = cmd_vel_data;
    break;
  case CMD_VEL_ANGULAR_X:
    twist_msg->angular.x = cmd_vel_data;
    break;
  case CMD_VEL_ANGULAR_Y:
    twist_msg->angular.y = cmd_vel_data;
    break;
  case CMD_VEL_ANGULAR_Z:
    twist_msg->angular.z = cmd_vel_data;
    break;
  default:
    twist_msg->linear.x = 0;
    twist_msg->linear.y = 0;
    twist_msg->linear.z = 0;
    twist_msg->angular.x = 0;
    twist_msg->angular.y = 0;
    twist_msg->angular.z = 0;
  }
  return ACK;
}

int32_t get_odom_response(struct odom_msg *odom_msg, int32_t odom_type) {
  switch (odom_type) {
  case ODOM_POINT_X:
    return float_to_int32_scaled(odom_msg->point.x);
  case ODOM_POINT_Y:
    return float_to_int32_scaled(odom_msg->point.y);
  case ODOM_POINT_Z:
    return float_to_int32_scaled(odom_msg->point.z);
  case ODOM_QUATERNION_X:
    return float_to_int32_scaled(odom_msg->quaternion.x);
  case ODOM_QUATERNION_Y:
    return float_to_int32_scaled(odom_msg->quaternion.y);
  case ODOM_QUATERNION_Z:
    return float_to_int32_scaled(odom_msg->quaternion.z);
  case ODOM_QUATERNION_W:
    return float_to_int32_scaled(odom_msg->quaternion.w);
  case ODOM_LINEAR_X:
    return float_to_int32_scaled(odom_msg->linear.x);
  case ODOM_LINEAR_Y:
    return float_to_int32_scaled(odom_msg->linear.y);
  case ODOM_LINEAR_Z:
    return float_to_int32_scaled(odom_msg->linear.z);
  case ODOM_ANGULAR_X:
    return float_to_int32_scaled(odom_msg->angular.x);
  case ODOM_ANGULAR_Y:
    return float_to_int32_scaled(odom_msg->angular.y);
  case ODOM_ANGULAR_Z:
    return float_to_int32_scaled(odom_msg->angular.z);
  default:
    return ACK;
  }
  return ACK;
}

int32_t get_imu_response(struct imu_msg *imu_msg, int32_t imu_type) {
  switch (imu_type) {
  case IMU_QUATERNION_X:
    return float_to_int32_scaled(imu_msg->quaternion.x);
  case IMU_QUATERNION_Y:
    return float_to_int32_scaled(imu_msg->quaternion.y);
  case IMU_QUATERNION_Z:
    return float_to_int32_scaled(imu_msg->quaternion.z);
  case IMU_QUATERNION_W:
    return float_to_int32_scaled(imu_msg->quaternion.w);
  case IMU_ANGULAR_X:
    return float_to_int32_scaled(imu_msg->angular.x);
  case IMU_ANGULAR_Y:
    return float_to_int32_scaled(imu_msg->angular.y);
  case IMU_ANGULAR_Z:
    return float_to_int32_scaled(imu_msg->angular.z);
  case IMU_ACCEL_X:
    return float_to_int32_scaled(imu_msg->accel.x);
  case IMU_ACCEL_Y:
    return float_to_int32_scaled(imu_msg->accel.y);
  case IMU_ACCEL_Z:
    return float_to_int32_scaled(imu_msg->accel.z);
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
