/****************************************************************************
 *  Copyright (C) 2019 RoboMaster.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see <http://www.gnu.org/licenses/>.
 ***************************************************************************/

#ifndef __CHASSIS_H__
#define __CHASSIS_H__

#define MEC_VAL_LIMIT(val, min, max) \
  do                                 \
  {                                  \
    if ((val) <= (min))              \
    {                                \
      (val) = (min);                 \
    }                                \
    else if ((val) >= (max))         \
    {                                \
      (val) = (max);                 \
    }                                \
  } while (0)

/************************ chassis parameter ****************************/
/* the radius of wheel(mm) */
#define RADIUS 76
/* the perimeter of wheel(mm) */
#define PERIMETER 478
/* wheel track distance(mm) */
#define WHEELTRACK 394
/* wheelbase distance(mm) */
#define WHEELBASE 415

/* gimbal is relative to chassis center x axis offset(mm) */
#define ROTATE_X_OFFSET 7
/* gimbal is relative to chassis center y axis offset(mm) */
#define ROTATE_Y_OFFSET 0

/* chassis motor use 3508 */
/* the deceleration ratio of chassis motor */
#define MOTOR_DECELE_RATIO (1.0f / 19.0f)
/* single 3508 motor maximum speed, unit is rpm */
#define MAX_WHEEL_RPM 8500 //8347rpm = 3500mm/s
/* chassis maximum translation speed, unit is mm/s */
#define MAX_CHASSIS_VX_SPEED 3300 //8000rpm
#define MAX_CHASSIS_VY_SPEED 3300
/* chassis maximum rotation speed, unit is degree/s */
#define MAX_CHASSIS_VW_SPEED 300 //5000rpm

#define MOTOR_ENCODER_ACCURACY 8192.0f

void differential_drive_calculate(struct mecanum *mec);
void differential_drive_position_measure(struct mecanum *mec, struct mecanum_motor_fdb wheel_fdb[]);

void skid_steer_calculate(struct mecanum *mec);
void skid_steer_position_measure(struct mecanum *mec, struct mecanum_motor_fdb wheel_fdb[]);

void mecanum_calculate(struct mecanum *mec);
void mecanum_position_measure(struct mecanum *mec, struct mecanum_motor_fdb wheel_fdb[]);

#endif // __MECANUM_H__
