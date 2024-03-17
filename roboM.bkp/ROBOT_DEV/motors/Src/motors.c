/*
 * motor.c
 *
 *  Created on: Feb 7, 2024
 *      Author: bentjh01
 */

#include "motors.h"

osThreadId_t motorsTaskHandle;
const osThreadAttr_t motorTask_attributes = {
  .name = "motorTask",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};

void motors_init(void){
	motorsTaskHandle = osThreadNew(motors_task, NULL, &motorTask_attributes);
}

static void split_data_to_bytes(int16_t current, uint8_t _txData[8], uint8_t motor_id) {
    // Check if current is within the valid range for uint8_t
    if (current > 255 || current < 0) {
        // Handle error or adjust current appropriately
        // For example, you could print an error message or wrap the value
        return;
    }

    switch (motor_id){
	case 1:
    // Split current into high and low bytes
//		_txData[0] = (uint8_t)(current >> 8);
//		_txData[1] = (uint8_t)(current & 0xFF);
		_txData[0] = current >> 8;
		_txData[1] = current;
	case 2:
		_txData[2] = (uint8_t)(current >> 8);
		_txData[3] = (uint8_t)(current & 0xFF);
	case 3:
		_txData[4] = (uint8_t)(current >> 8);
		_txData[5] = (uint8_t)(current & 0xFF);
	case 4:
		_txData[6] = (uint8_t)(current >> 8);
		_txData[7] = (uint8_t)(current & 0xFF);

//	return _txData;

    }
void get_moto_offset(motor_measure_t* ptr, uint8_t rxData[])
    {
        ptr->ecd        = (uint16_t)(rxData[0] << 8 | rxData[1]);
        ptr->offset_ecd = ptr->ecd;
    }

void encoder_data_handler(motor_measure_t* ptr, uint8_t rxData[])
{
  ptr->last_ecd = ptr->ecd;
  ptr->ecd      = (uint16_t)(rxData[0] << 8 | rxData[1]);

  if (ptr->ecd - ptr->last_ecd > 4096)
  {
    ptr->round_cnt--;
    ptr->ecd_raw_rate = ptr->ecd - ptr->last_ecd - 8192;
  }
  else if (ptr->ecd - ptr->last_ecd < -4096)
  {
    ptr->round_cnt++;
    ptr->ecd_raw_rate = ptr->ecd - ptr->last_ecd + 8192;
  }
  else
  {
    ptr->ecd_raw_rate = ptr->ecd - ptr->last_ecd;
  }

  ptr->total_ecd = ptr->round_cnt * 8192 + ptr->ecd - ptr->offset_ecd;
  /* total angle, unit is degree */
  ptr->total_angle = ptr->total_ecd / ENCODER_ANGLE_RATIO;
	ptr->speed_rpm     = ((int16_t)rxData[2] << 8 | rxData[3]);
  ptr->given_current = ((int16_t)rxData[4] << 8 | rxData[5]);
}

    // No need to modify remaining elements as they were initialized to 0

}

void motors_task(void *arguments){

	int sanity_count =0;

	CAN_FilterTypeDef sFilterConfig;


	CAN_TxHeaderTypeDef txHeader;
	CAN_RxHeaderTypeDef rxHeader;
	uint8_t txData[8];
	uint8_t rxData[8];
	uint32_t txMailbox;
	uint32_t rxFifo;
	motor_measure_t moto1;
	int16_t current = 0;

	//
	sFilterConfig.FilterBank = 0;
	sFilterConfig.FilterMode = CAN_FILTERMODE_IDMASK;
	sFilterConfig.FilterScale = CAN_FILTERSCALE_32BIT;
	sFilterConfig.FilterIdHigh = 0x0000;
	sFilterConfig.FilterIdLow = 0x0000;
	sFilterConfig.FilterMaskIdHigh = 0x0000;
	sFilterConfig.FilterMaskIdLow = 0x0000;
	sFilterConfig.FilterFIFOAssignment = CAN_RX_FIFO0;
	sFilterConfig.FilterActivation = ENABLE;
	sFilterConfig.SlaveStartFilterBank = 14;

	if (HAL_CAN_ConfigFilter(&hcan1, &sFilterConfig) != HAL_OK) {
		Error_Handler();
	}

	if (HAL_CAN_Start(&hcan1) != HAL_OK) {
		Error_Handler();
	}

	if (HAL_CAN_ActivateNotification(&hcan1, CAN_IT_RX_FIFO0_MSG_PENDING) != HAL_OK) {
		Error_Handler();
	}

	txHeader.StdId = 0x200;
	txHeader.RTR   = CAN_RTR_DATA;
	txHeader.IDE   = CAN_ID_STD;
	txHeader.DLC   = 8;
	txHeader.TransmitGlobalTime = DISABLE;
	txData[0] = 0;
	txData[1] = 0;
	txData[2] = 0;
	txData[3] = 0;
	txData[4] = 0;
	txData[5] = 0;
	txData[6] = 0;
	txData[7] = 0;

	//
	// Activating 24V supply to the MOTOR CONTROLLER
	HAL_GPIO_WritePin(POWER1_CTRL_GPIO_Port, POWER1_CTRL_Pin, GPIO_PIN_SET);

	// initialising PID
//	pid_struct_init(pid, maxout, inte_limit, kp, ki, kd);
	void HAL_CAN_RxFifo0MsgPendingCallback(CAN_HandleTypeDef *hcan) {
		HAL_CAN_GetRxMessage(&hcan1, CAN_RX_FIFO0, &rxHeader, rxData);
		if (rxHeader.StdId == 0x201) {
			moto1.msg_cnt++ <= 50 ? get_moto_offset(&moto1, rxData) : encoder_data_handler(&moto1, rxData);
		}
	}


  for(;;)
  {
		if (HAL_CAN_AddTxMessage(&hcan1, &txHeader, txData, &txMailbox) != HAL_OK) {
			Error_Handler();
		}
		if (HAL_CAN_ActivateNotification(&hcan1, CAN_IT_RX_FIFO0_MSG_PENDING) != HAL_OK) {
		  Error_Handler();
		}

		HAL_GPIO_TogglePin(LED_B_GPIO_Port, LED_B_Pin);

		split_data_to_bytes(0, txData, 1);

//		txData[0] = current >> 8;
//		txData[1] = current;

		sanity_count ++;
		osDelay(100);
  }
}