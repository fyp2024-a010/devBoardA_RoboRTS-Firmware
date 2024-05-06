################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../miniBotRTS-Firmware/application/blinky_task.c \
../miniBotRTS-Firmware/application/chassis_task.c \
../miniBotRTS-Firmware/application/imu_task.c \
../miniBotRTS-Firmware/application/init.c \
../miniBotRTS-Firmware/application/mb_protocol_task.c \
../miniBotRTS-Firmware/application/timer_task.c 

OBJS += \
./miniBotRTS-Firmware/application/blinky_task.o \
./miniBotRTS-Firmware/application/chassis_task.o \
./miniBotRTS-Firmware/application/imu_task.o \
./miniBotRTS-Firmware/application/init.o \
./miniBotRTS-Firmware/application/mb_protocol_task.o \
./miniBotRTS-Firmware/application/timer_task.o 

C_DEPS += \
./miniBotRTS-Firmware/application/blinky_task.d \
./miniBotRTS-Firmware/application/chassis_task.d \
./miniBotRTS-Firmware/application/imu_task.d \
./miniBotRTS-Firmware/application/init.d \
./miniBotRTS-Firmware/application/mb_protocol_task.d \
./miniBotRTS-Firmware/application/timer_task.d 


# Each subdirectory must supply rules for building sources it contributes
miniBotRTS-Firmware/application/%.o miniBotRTS-Firmware/application/%.su miniBotRTS-Firmware/application/%.cyclo: ../miniBotRTS-Firmware/application/%.c miniBotRTS-Firmware/application/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../miniBotRTS-Firmware/application/mb_protocol -I../miniBotRTS-Firmware/application -I../miniBotRTS-Firmware/boards -I../miniBotRTS-Firmware/components/algorithms -I../miniBotRTS-Firmware/components/controller -I../miniBotRTS-Firmware/components/devices -I../miniBotRTS-Firmware/components/modules -I../miniBotRTS-Firmware/components/object -I../miniBotRTS-Firmware/components/support -I../miniBotRTS-Firmware/components/algorithm -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-miniBotRTS-2d-Firmware-2f-application

clean-miniBotRTS-2d-Firmware-2f-application:
	-$(RM) ./miniBotRTS-Firmware/application/blinky_task.cyclo ./miniBotRTS-Firmware/application/blinky_task.d ./miniBotRTS-Firmware/application/blinky_task.o ./miniBotRTS-Firmware/application/blinky_task.su ./miniBotRTS-Firmware/application/chassis_task.cyclo ./miniBotRTS-Firmware/application/chassis_task.d ./miniBotRTS-Firmware/application/chassis_task.o ./miniBotRTS-Firmware/application/chassis_task.su ./miniBotRTS-Firmware/application/imu_task.cyclo ./miniBotRTS-Firmware/application/imu_task.d ./miniBotRTS-Firmware/application/imu_task.o ./miniBotRTS-Firmware/application/imu_task.su ./miniBotRTS-Firmware/application/init.cyclo ./miniBotRTS-Firmware/application/init.d ./miniBotRTS-Firmware/application/init.o ./miniBotRTS-Firmware/application/init.su ./miniBotRTS-Firmware/application/mb_protocol_task.cyclo ./miniBotRTS-Firmware/application/mb_protocol_task.d ./miniBotRTS-Firmware/application/mb_protocol_task.o ./miniBotRTS-Firmware/application/mb_protocol_task.su ./miniBotRTS-Firmware/application/timer_task.cyclo ./miniBotRTS-Firmware/application/timer_task.d ./miniBotRTS-Firmware/application/timer_task.o ./miniBotRTS-Firmware/application/timer_task.su

.PHONY: clean-miniBotRTS-2d-Firmware-2f-application

