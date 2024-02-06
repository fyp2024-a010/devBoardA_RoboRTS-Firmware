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
motor_measure_t motor1;
int16_t current = 0;

sFilterConfig->FilterBank = 0;
sFilterConfig->FilterMode = CAN_FILTERMODE_IDMASK;
sFilterConfig->FilterScale = CAN_FILTERSCALE_32BIT;
sFilterConfig.FilterIdHigh = 0x0000;
sFilterConfig.FilterIdLow = 0x0000;
sFilterConfig.FilterMaskIdHigh = 0x0000;
sFilterConfig.FilterMaskIdLow = 0x0000;
sFilterConfig.FilterFIFOAssignment = CAN_RX_FIFO0;
sFilterConfig.FilterActivation = ENABLE;
sFilterConfig.SlaveStartFilterBank = 14;

txData[0] = 0;
txData[1] = 0;
txData[2] = 0;
txData[3] = 0;
txData[4] = 0;
txData[5] = 0;
txData[6] = 0;
txData[7] = 0;

hcan1.Instance = CAN1;
hcan1.Init.Prescaler = 5;
hcan1.Init.Mode = CAN_MODE_NORMAL;
hcan1.Init.SyncJumpWidth = CAN_SJW_4TQ;
hcan1.Init.TimeSeg1 = CAN_BS1_3TQ;
hcan1.Init.TimeSeg2 = CAN_BS2_5TQ;
hcan1.Init.TimeTriggeredMode = DISABLE;
hcan1.Init.AutoBusOff = DISABLE;
hcan1.Init.AutoWakeUp = DISABLE;
hcan1.Init.AutoRetransmission = DISABLE;
hcan1.Init.ReceiveFifoLocked = DISABLE;
hcan1.Init.TransmitFifoPriority = DISABLE;
if (HAL_CAN_Init(&hcan1) != HAL_OK)
{
  Error_Handler();
}

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
