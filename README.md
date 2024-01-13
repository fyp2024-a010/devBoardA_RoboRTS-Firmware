# RoboMasterDevBoard
- Benjamin Teh Jhen Hing
- NTU AY23/24
- FYP A010 Super compact mobile robot development: Mechatronics design
- Professor Chen I-Ming  
- Repo mirrored from https://github.com/RoboMaster/DevelopmentBoard-Examples.git

## Contents
## About the Board
- STM32F427IIH6 ([datasheet](https://www.st.com/en/microcontrollers-microprocessors/stm32f427ii.html))
### IMU
- IST8310 3D Magnetometer ([datasheet](https://intofpv.com/attachment.php?aid=8104))
- MPU6500 6-Axis (Gyro + Accelerometer) ([datasheet](https://invensense.tdk.com/download-pdf/mpu-6500-datasheet/))
### PWM
- PWM
- CAN
### Remote Control
### RoboMaster OLED
### SD Card Reader
### USB Port
### RoboMaster UWB Positioning System
### Custom LED

### Project Scope
The project is to setup the dev board to send data to the main computer via USB so that the data can be processed by ROS. The data sent can either be raw data or filtered data depending on some trigger or parameter i.e. applying a jumper on a pin. The data to be sent to ROS is the IMU data, and odometry data. 

## References
- [GitHub, Motor Controller](https://github.com/RoboGrinder-ECE/Motor_Control.git)
- [GitHub, DevBoard Examples](https://github.com/RoboMaster/DevelopmentBoard-Examples.git)
- []()
## Dependencies
## Useful Links
- [RM-NA Forum, Deploy Code on Board A](https://forums.robomasterna.com/t/how-to-write-and-deploy-code-to-the-development-board-type-a/91/2)
- 

STM32CUBEIDE
- v 1.28


Setup
1. Create new STM32 Project
2. Select STM32F427IIH6
3. Configure pins and features:
- CAN