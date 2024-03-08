################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/boards/board.c \
../bsp/boards/drv_can.c \
../bsp/boards/drv_flash.c \
../bsp/boards/drv_imu.c \
../bsp/boards/drv_io.c \
../bsp/boards/drv_uart.c 

OBJS += \
./bsp/boards/board.o \
./bsp/boards/drv_can.o \
./bsp/boards/drv_flash.o \
./bsp/boards/drv_imu.o \
./bsp/boards/drv_io.o \
./bsp/boards/drv_uart.o 

C_DEPS += \
./bsp/boards/board.d \
./bsp/boards/drv_can.d \
./bsp/boards/drv_flash.d \
./bsp/boards/drv_imu.d \
./bsp/boards/drv_io.d \
./bsp/boards/drv_uart.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/boards/%.o bsp/boards/%.su bsp/boards/%.cyclo: ../bsp/boards/%.c bsp/boards/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../application -I../application/protocol -I../bsp/boards/ -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-boards

clean-bsp-2f-boards:
	-$(RM) ./bsp/boards/board.cyclo ./bsp/boards/board.d ./bsp/boards/board.o ./bsp/boards/board.su ./bsp/boards/drv_can.cyclo ./bsp/boards/drv_can.d ./bsp/boards/drv_can.o ./bsp/boards/drv_can.su ./bsp/boards/drv_flash.cyclo ./bsp/boards/drv_flash.d ./bsp/boards/drv_flash.o ./bsp/boards/drv_flash.su ./bsp/boards/drv_imu.cyclo ./bsp/boards/drv_imu.d ./bsp/boards/drv_imu.o ./bsp/boards/drv_imu.su ./bsp/boards/drv_io.cyclo ./bsp/boards/drv_io.d ./bsp/boards/drv_io.o ./bsp/boards/drv_io.su ./bsp/boards/drv_uart.cyclo ./bsp/boards/drv_uart.d ./bsp/boards/drv_uart.o ./bsp/boards/drv_uart.su

.PHONY: clean-bsp-2f-boards

