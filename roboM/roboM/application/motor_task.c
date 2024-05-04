#include "motor_task.h"

#include "main.h"
#include "drv_can.h"
#include "motor.h"
#include "timer_task.h"

#include "device.h" // for DEVICE_CAN1
#include "errno.h" // for RM_OK
#include "object.h" // for OBJECT_NAME_MAX_LEN 

// #include "soft_timer.h" //for soft_timer_init

/// motor collection struct for chassis
struct motor_collection motor_collection;

// soft timer callback
int32_t motor_can1_output_1ms(void *argc){
  motor_device_can_output(DEVICE_CAN1);
  return 0;
}

/// sends the can message
int32_t motor_canstd_send(struct can_msg msg)
{
    can_msg_bytes_send(&hcan1, msg.data, 8, msg.id);
    return RM_OK;
}

/// receives the can message
int32_t can1_motor_msg_rec(CAN_RxHeaderTypeDef *header, uint8_t *data)
{
  motor_device_data_update(DEVICE_CAN1, header->StdId, data);
  return RM_OK;
}

/// Updates the pid controller
static int32_t motor_pid_input_convert(struct controller *ctrl, void *input)
{
  pid_feedback_t pid_fdb = (pid_feedback_t)(ctrl->feedback);
  motor_data_t data = (motor_data_t)input;
  pid_fdb->feedback = data->speed_rpm;

  return RM_OK;
}

void motor_init(){
    /// CAN INIT
    soft_timer_init(); // soft_timer.h

    // board.c -> board_config()
    can_manage_init();
    motor_device_can_send_register(motor_canstd_send);
    can_fifo0_rx_callback_register(&can1_manage, can1_motor_msg_rec);

    // init.c
    motor_pid_register(&motor_collection, "motor_collection", DEVICE_CAN1);
    motors_disable(&motor_collection);
}

void motor_task (void const *argument){ // taken from chassis_task
  uint32_t period = osKernelSysTick();
  chassis_t pchassis = NULL;
	soft_timer_register(motor_can1_output_1ms, NULL, 1);

	 for(;;){
    chassis_execute(pchassis);
    osDelayUntil(&period, 2);
	 }
}