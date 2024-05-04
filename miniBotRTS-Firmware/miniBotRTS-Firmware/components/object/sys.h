#ifndef __SYS_H__
#define __SYS_H__

#ifdef SYS_H_GLOBAL
#define SYS_H_EXTERN
#else
#define SYS_H_EXTERN extern
#endif

#include <math.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "MF_CRC.h"
#include "rm_errno.h"
#include "fifo.h"
#include "linux_list.h"
#include "mem_mang.h"

#include "FreeRTOS.h"
#include "cmsis_os.h"
#include "stm32f4xx_hal.h"

/* boolean type definitions */
#ifndef TRUE
#define TRUE 1 /**< boolean true  */
#endif

#ifndef FALSE
#define FALSE 0 /**< boolean fails */
#endif

/* math relevant */
/* radian coefficient */
#ifndef RADIAN_COEF
#define RADIAN_COEF 57.3f
#endif

/* circumference ratio */
#ifndef PI
#define PI 3.14159265354f
#endif

#define VAL_LIMIT(val, min, max)                                               \
  do {                                                                         \
    if ((val) <= (min)) {                                                      \
      (val) = (min);                                                           \
    } else if ((val) >= (max)) {                                               \
      (val) = (max);                                                           \
    }                                                                          \
  } while (0)

#define ANGLE_LIMIT_360(val, angle)                                            \
  do {                                                                         \
    (val) = (angle) - (int)(angle);                                            \
    (val) += (int)(angle) % 360;                                               \
  } while (0)

#define ANGLE_LIMIT_360_TO_180(val)                                            \
  do {                                                                         \
    if ((val) > 180)                                                           \
      (val) -= 360;                                                            \
  } while (0)

#define VAL_MIN(a, b) ((a) < (b) ? (a) : (b))
#define VAL_MAX(a, b) ((a) > (b) ? (a) : (b))

#define var_cpu_sr() register unsigned long cpu_sr

#define enter_critical()                                                       \
  do {                                                                         \
    cpu_sr = __get_PRIMASK();                                                  \
    __disable_irq();                                                           \
  } while (0)

#define exit_critical()                                                        \
  do {                                                                         \
    __set_PRIMASK(cpu_sr);                                                     \
  } while (0)

#define assert_param_obj(EX)                                                   \
  if (!(EX)) {                                                                 \
  }

uint32_t get_time_ms(void);
uint32_t get_time_us(void);
float get_time_ms_us(void);

#endif // __SYS_H__
