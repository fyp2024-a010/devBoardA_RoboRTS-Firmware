/*
 * motor.h
 *
 *  Created on: Feb 7, 2024
 *      Author: bentjh01
 */

#ifndef INC_MOTORS_H_
#define INC_MOTORS_H_

#include "cmsis_os.h"
#include "can.h"
#include "main.h"
#include "fifo.h"
#include "pid.h"

#define ENCODER_ANGLE_RATIO    (8192.0f/360.0f)

typedef struct
{
  uint16_t ecd;
  uint16_t last_ecd;

  int16_t  speed_rpm;
  int16_t  given_current;

  int32_t  round_cnt;
  int32_t  total_ecd;
  int32_t  total_angle;

  uint16_t offset_ecd;
  uint32_t msg_cnt;

	int32_t ecd_raw_rate;
} motor_measure_t;

void motors_init(void);
void motors_task(void *args);

#endif /* INC_MOTORS_H_ */
