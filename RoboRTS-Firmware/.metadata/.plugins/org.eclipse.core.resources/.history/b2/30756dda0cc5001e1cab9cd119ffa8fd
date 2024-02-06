
#include "mytype.h"
void IIC_Delay(void);
// Initialisation IIC
void IIC_Init(void);
// send IIC start signal
void IIC_Start(void);
// send IIC stop signal
void IIC_Stop(void);
// wait for response
// returned value：1，failed to receive response
//        0，receive response successfully
u8 IIC_Wait_Ack(void);
// send ACK signal
void IIC_Ack(void);
// do not send ACK signal
void IIC_NAck(void);
// IIC send a byte
//  return slave reponse
// 1，response received
// 0，no response
void IIC_Send_Byte(u8 txd);
// read 1 byte，ack=1，send ACK，ack=0，send nACK
u8 IIC_Read_Byte(unsigned char ack);

void IIC_Init(void);
// iic read and write registers
u8 IIC_Write_Reg(u8 devAddr, u8 reg, u8 data);
u8 IIC_Read_Reg(u8 devAddr, u8 reg);

// read continuosly from specified register len bytes of data。equivalent to reg， reg+1， 。。。，reg+len
u8 IIC_Write_Bytes(u8 devAddr, u8 reg, u8 *buff, u8 len);
u8 IIC_Read_Bytes(u8 devAddr, u8 reg, u8 *buff, u8 len);

// for inv_dmp.c call use
u8 IIC_Read(u8 addr, u8 reg, u8 len, u8 *buf);
u8 IIC_Write(u8 addr, u8 reg, u8 len, u8 *buf);
