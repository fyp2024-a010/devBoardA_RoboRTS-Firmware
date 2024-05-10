#include "imu_task.h"

extern struct imu_msg robot_imu;

#ifndef RADIAN_COEF
#define RADIAN_COEF 57.3f
#endif

int32_t imu_update() {
  struct ahrs_sensor mpu_sensor;
  struct attitude mahony_atti;
  mpu_get_data(&mpu_sensor);
  mahony_ahrs_update(&mpu_sensor, &mahony_atti);

  // Convert euler angle to quaternion
  float roll = mahony_atti.roll / RADIAN_COEF;
  float pitch = mahony_atti.pitch / RADIAN_COEF;
  float yaw = mahony_atti.yaw / RADIAN_COEF;
  float cy = cos(yaw * 0.5);
  float sy = sin(yaw * 0.5);
  float cp = cos(pitch * 0.5);
  float sp = sin(pitch * 0.5);
  float cr = cos(roll * 0.5);
  float sr = sin(roll * 0.5);
  float qx = sr * cp * cy - cr * sp * sy;
  float qy = cr * sp * cy + sr * cp * sy;
  float qz = cr * cp * sy - sr * sp * cy;
  float qw = cr * cp * cy + sr * sp * sy;

  robot_imu.quaternion.x = qx;
  robot_imu.quaternion.y = qy;
  robot_imu.quaternion.z = qz;
  robot_imu.quaternion.w = qw;

  robot_imu.angular.x = mpu_sensor.wx;
  robot_imu.angular.y = mpu_sensor.wy;
  robot_imu.angular.z = mpu_sensor.wz;

  robot_imu.accel.x = mpu_sensor.ax;
  robot_imu.accel.y = mpu_sensor.ay;
  robot_imu.accel.z = mpu_sensor.az;

  return 0;
}

void imu_task(void const *argument) {
  mpu_device_init();
  while (1) {
    imu_update();
    osDelay(1);
  }
}
