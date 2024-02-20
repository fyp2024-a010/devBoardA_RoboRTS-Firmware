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

void motors_task(void *arguments){

	int sanity_count =0;

	CAN_FilterTypeDef sFilterConfig;


	CAN_TxHeaderTypeDef txHeader;
	CAN_RxHeaderTypeDef rxHeader;
	uint8_t txData[8];
	uint8_t rxData[8];
	uint32_t txMailbox;
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
	HAL_GPIO_WritePin(POWER_OUT1_GPIO_Port, POWER_OUT1_Pin, GPIO_PIN_SET);

	// initialising PID
	pid_struct_init(pid, maxout, inte_limit, kp, ki, kd);

  for(;;)
  {
		if (HAL_CAN_AddTxMessage(&hcan1, &txHeader, txData, &txMailbox) != HAL_OK) {
			Error_Handler();
		}

		txData[0] = current >> 8;
		txData[1] = current;
		sanity_count ++;
		osDelay(10);
  }
}
