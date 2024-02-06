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

#define ENCODER_ANGLE_RATIO    (8192.0f/360.0f)

CAN_HandleTypeDef hcan1;

CAN_FilterTypeDef sFilterConfig;
CAN_TxHeaderTypeDef txHeader;
CAN_RxHeaderTypeDef rxHeader;
uint8_t txData[8];
uint8_t rxData[8];
uint32_t txMailbox;
motor_measure_t moto1;
int16_t current = 0;

txData[0] = 0;
txData[1] = 0;
txData[2] = 0;
txData[3] = 0;
txData[4] = 0;
txData[5] = 0;
txData[6] = 0;
txData[7] = 0;

void motors_task(void *arguments){
  for(;;)
  {
	if (HAL_CAN_AddTxMessage(&hcan1, &txHeader, txData, &txMailbox) != HAL_OK) {
		Error_Handler();
	}
	txData[0] = current >> 8;
	txData[1] = current;
	HAL_Delay(10);
  }
}
