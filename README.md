# RoboMasterDevBoard
- Student: Benjamin Teh Jhen Hing
- NTU AY23/24
- FYP A010 Super compact mobile robot development: Mechatronics design
- Supervisor: Hendral Suratno
- Professor Chen I-Ming  
- Repo mirrored from [RoboMaster/RoboRTS-Firmware](https://github.com/RoboMaster/DevelopmentBoard-Examples.git)

## Contents
## About the Board
- STM32F427IIH6 ([datasheet](https://www.st.com/en/microcontrollers-microprocessors/stm32f427ii.html))
### IMU
-  [IST8310 3D Magnetometer](./DataSheet/IST8310_3D_Magnetometer.pdf)
- [MPU6500 6-Axis (Gyro + Accelerometer)](./DataSheet/MPU-6500.pdf)
### Motor Control
- PWM (Open loop)
- CAN (Closed loop) [C620 BLDCMotorSpeed Controller](./DataSheet/RBMC620BLDCMotorSpeedController.pdf)
### Remote Control
### SD Card Reader
### USB Port
### Custom LED

### Objectives
1. Good documentation of how to use the code. 
2. Closed loop control on the BLDC motors
3. Configurable parameters without reprogramming the board i.e. PID values, raw data or filtered data, seletion of filtered data, activation or deactivation of features. 
4. Error feedback via the LED
5. IMU raw data
6. Filterd IMU
7. Odometry calculations for mecanum and skid steer. 

## Scope
The project is to setup the dev board to send data to the main computer via USB so that the data can be processed by ROS. The data sent can either be raw data or filtered data depending on some trigger or parameter i.e. applying a jumper on a pin. The data to be sent to ROS is the IMU data, and odometry data, rotary data. The parameters of the system should be readable from a SD Card. The rotary data from the motors will be used in a closed loop control for the motors. 

## References
- [GitHub, Motor Controller](https://github.com/RoboGrinder-ECE/Motor_Control.git)
- [GitHub, DevBoard Examples](https://github.com/RoboMaster/DevelopmentBoard-Examples.git)
- [GitHub, RoboRTS-Firmware](https://github.com/RoboMaster/RoboRTS-Firmware.git)
## Useful Links
- [RM-NA Forum, Deploy Code on Board A](https://forums.robomasterna.com/t/how-to-write-and-deploy-code-to-the-development-board-type-a/91/2)