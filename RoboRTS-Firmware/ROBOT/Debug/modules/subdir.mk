################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../modules/chassis.c \
../modules/gimbal.c \
../modules/shoot.c \
../modules/single_gyro.c 

OBJS += \
./modules/chassis.o \
./modules/gimbal.o \
./modules/shoot.o \
./modules/single_gyro.o 

C_DEPS += \
./modules/chassis.d \
./modules/gimbal.d \
./modules/shoot.d \
./modules/single_gyro.d 


# Each subdirectory must supply rules for building sources it contributes
modules/%.o modules/%.su modules/%.cyclo: ../modules/%.c modules/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../support -I../object -I../modules -I../devices -I../controller -I../algorithm -I../imu/Inc -I../gpio/Inc -I../applications/Inc -I../bsp/Inc -I../protocol/Inc -I../ulog -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-modules

clean-modules:
	-$(RM) ./modules/chassis.cyclo ./modules/chassis.d ./modules/chassis.o ./modules/chassis.su ./modules/gimbal.cyclo ./modules/gimbal.d ./modules/gimbal.o ./modules/gimbal.su ./modules/shoot.cyclo ./modules/shoot.d ./modules/shoot.o ./modules/shoot.su ./modules/single_gyro.cyclo ./modules/single_gyro.d ./modules/single_gyro.o ./modules/single_gyro.su

.PHONY: clean-modules

