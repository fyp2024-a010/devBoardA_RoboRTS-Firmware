/*
 * pid.h
 *
 *  Created on: Feb 20, 2024
 *      Author: bentjh01
 */

#ifndef INC_PID_H_
#define INC_PID_H_

typedef struct pid *pid_t;

struct pid_param
{
  float p;
  float i;
  float d;
  float input_max_err;

  float max_out;
  float inte_limit;
};

struct pid
{
  struct pid_param param;

  float set;
  float get;

  float err;
  float last_err;

  float pout;
  float iout;
  float dout;
  float out;

  void (*f_param_init)(struct pid *pid,
                       float max_output,
                       float inte_limit,
                       float p,
                       float i,
                       float d);
  void (*f_pid_reset)(struct pid *pid, float p, float i, float d);
};

void pid_struct_init(
    struct pid *pid,
    float maxout,
    float intergral_limit,

    float kp,
    float ki,
    float kd);

float pid_calculate(struct pid *pid, float fdb, float ref);


#endif /* INC_PID_H_ */
