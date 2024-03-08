################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../application/blinky_task.c \
../application/chassis_task.c \
../application/communicate.c \
../application/infantry_cmd.c \
../application/init.c \
../application/offline_check.c \
../application/param.c \
../application/timer_task.c 

OBJS += \
./application/blinky_task.o \
./application/chassis_task.o \
./application/communicate.o \
./application/infantry_cmd.o \
./application/init.o \
./application/offline_check.o \
./application/param.o \
./application/timer_task.o 

C_DEPS += \
./application/blinky_task.d \
./application/chassis_task.d \
./application/communicate.d \
./application/infantry_cmd.d \
./application/init.d \
./application/offline_check.d \
./application/param.d \
./application/timer_task.d 


# Each subdirectory must supply rules for building sources it contributes
application/%.o application/%.su application/%.cyclo: ../application/%.c application/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../application -I../application/protocol -I../bsp/boards/ -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-application

clean-application:
	-$(RM) ./application/blinky_task.cyclo ./application/blinky_task.d ./application/blinky_task.o ./application/blinky_task.su ./application/chassis_task.cyclo ./application/chassis_task.d ./application/chassis_task.o ./application/chassis_task.su ./application/communicate.cyclo ./application/communicate.d ./application/communicate.o ./application/communicate.su ./application/infantry_cmd.cyclo ./application/infantry_cmd.d ./application/infantry_cmd.o ./application/infantry_cmd.su ./application/init.cyclo ./application/init.d ./application/init.o ./application/init.su ./application/offline_check.cyclo ./application/offline_check.d ./application/offline_check.o ./application/offline_check.su ./application/param.cyclo ./application/param.d ./application/param.o ./application/param.su ./application/timer_task.cyclo ./application/timer_task.d ./application/timer_task.o ./application/timer_task.su

.PHONY: clean-application

