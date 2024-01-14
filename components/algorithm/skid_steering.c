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

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "skid_steering.h"

#ifndef RADIAN_COEF
    #define RADIAN_COEF 57.3f
#endif

#define SKID_VAL_LIMIT(val, min, max) \
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

/**
    * @brief skid steering velocity decomposition.F:forword; B:backword; L:left; R:right
    * @param input : ccx=+vx(mm/s)  ccw=+vw(deg/s)
    *        output: left wheel speed(rpm) and right wheel speed(rpm)
    */
void skid_steering_calculate(struct skid_steering *skid)
{
    static float wheel_rpm_ratio;

    wheel_rpm_ratio = 60.0f / (skid->param.wheel_perimeter * MOTOR_DECELE_RATIO);

    SKID_VAL_LIMIT(skid->speed.vx, -MAX_CHASSIS_VX_SPEED, MAX_CHASSIS_VX_SPEED); //mm/s
    SKID_VAL_LIMIT(skid->speed.vw, -MAX_CHASSIS_VW_SPEED, MAX_CHASSIS_VW_SPEED); //deg/s

    float left_wheel_rpm, right_wheel_rpm;

    left_wheel_rpm = (skid->speed.vx - skid->speed.vw * skid->param.rotate_ratio) * wheel_rpm_ratio;
    right_wheel_rpm = (skid->speed.vx + skid->speed.vw * skid->param.rotate_ratio) * wheel_rpm_ratio;

    skid->wheel_rpm.left = left_wheel_rpm;
    skid->wheel_rpm.right = right_wheel_rpm;
}

void skid_steering_position_measure(struct skid_steering *skid, struct skid_steering_motor_fdb wheel_fdb[])
{
    static float rpm_ratio;
    static float ecd_ratio;
    static double last_d_x, last_d_w, d_x, d_w, diff_d_x, diff_d_w;
    static double position_x, angle_w;
    static double v_x, v_w;

    rpm_ratio = skid->param.wheel_perimeter * MOTOR_DECELE_RATIO / (2 * 60.0f);
    ecd_ratio = skid->param.wheel_perimeter * MOTOR_DECELE_RATIO / (2 * MOTOR_ENCODER_ACCURACY);

    last_d_x = d_x;
    last_d_w = d_w;
    d_x = ecd_ratio * (wheel_fdb[0].total_ecd + wheel_fdb[1].total_ecd);
    d_w = ecd_ratio * (wheel_fdb[0].total_ecd / skid->param.rotate_ratio - wheel_fdb[1].total_ecd / skid->param.rotate_ratio);

    diff_d_x = d_x - last_d_x;
    diff_d_w = d_w - last_d_w;

    position_x += diff_d_x;
    angle_w += diff_d_w;

    skid->position.position_x_mm = position_x;        //mm
    skid->position.angle_deg = angle_w * RADIAN_COEF; //degree

    v_x = rpm_ratio * (wheel_fdb[0].speed_rpm + wheel_fdb[1].speed_rpm);
    v_w = rpm_ratio * (wheel_fdb[0].speed_rpm / skid->param.rotate_ratio - wheel_fdb[1].speed_rpm / skid->param.rotate_ratio);

    skid->position.v_x_mm = v_x;                 //mm/s
    skid->position.rate_deg = v_w * RADIAN_COEF; //degree/s
}
