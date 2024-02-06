################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../algorithm/madgwick_ahrs.c \
../algorithm/mahony_ahrs.c \
../algorithm/mecanum.c \
../algorithm/pid.c \
../algorithm/ramp.c 

OBJS += \
./algorithm/madgwick_ahrs.o \
./algorithm/mahony_ahrs.o \
./algorithm/mecanum.o \
./algorithm/pid.o \
./algorithm/ramp.o 

C_DEPS += \
./algorithm/madgwick_ahrs.d \
./algorithm/mahony_ahrs.d \
./algorithm/mecanum.d \
./algorithm/pid.d \
./algorithm/ramp.d 


# Each subdirectory must supply rules for building sources it contributes
algorithm/%.o algorithm/%.su algorithm/%.cyclo: ../algorithm/%.c algorithm/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../support -I../object -I../modules -I../devices -I../controller -I../algorithm -I../imu/Inc -I../gpio/Inc -I../applications/Inc -I../bsp/Inc -I../protocol/Inc -I../ulog -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-algorithm

clean-algorithm:
	-$(RM) ./algorithm/madgwick_ahrs.cyclo ./algorithm/madgwick_ahrs.d ./algorithm/madgwick_ahrs.o ./algorithm/madgwick_ahrs.su ./algorithm/mahony_ahrs.cyclo ./algorithm/mahony_ahrs.d ./algorithm/mahony_ahrs.o ./algorithm/mahony_ahrs.su ./algorithm/mecanum.cyclo ./algorithm/mecanum.d ./algorithm/mecanum.o ./algorithm/mecanum.su ./algorithm/pid.cyclo ./algorithm/pid.d ./algorithm/pid.o ./algorithm/pid.su ./algorithm/ramp.cyclo ./algorithm/ramp.d ./algorithm/ramp.o ./algorithm/ramp.su

.PHONY: clean-algorithm

