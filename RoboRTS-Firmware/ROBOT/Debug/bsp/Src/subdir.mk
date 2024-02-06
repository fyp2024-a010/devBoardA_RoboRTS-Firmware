################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/Src/board.c \
../bsp/Src/drv_can.c \
../bsp/Src/drv_dr16.c \
../bsp/Src/drv_flash.c \
../bsp/Src/drv_imu.c \
../bsp/Src/drv_io.c \
../bsp/Src/drv_uart.c 

OBJS += \
./bsp/Src/board.o \
./bsp/Src/drv_can.o \
./bsp/Src/drv_dr16.o \
./bsp/Src/drv_flash.o \
./bsp/Src/drv_imu.o \
./bsp/Src/drv_io.o \
./bsp/Src/drv_uart.o 

C_DEPS += \
./bsp/Src/board.d \
./bsp/Src/drv_can.d \
./bsp/Src/drv_dr16.d \
./bsp/Src/drv_flash.d \
./bsp/Src/drv_imu.d \
./bsp/Src/drv_io.d \
./bsp/Src/drv_uart.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/Src/%.o bsp/Src/%.su bsp/Src/%.cyclo: ../bsp/Src/%.c bsp/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../support -I../object -I../modules -I../devices -I../controller -I../algorithm -I../imu/Inc -I../gpio/Inc -I../applications/Inc -I../bsp/Inc -I../protocol/Inc -I../ulog -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-Src

clean-bsp-2f-Src:
	-$(RM) ./bsp/Src/board.cyclo ./bsp/Src/board.d ./bsp/Src/board.o ./bsp/Src/board.su ./bsp/Src/drv_can.cyclo ./bsp/Src/drv_can.d ./bsp/Src/drv_can.o ./bsp/Src/drv_can.su ./bsp/Src/drv_dr16.cyclo ./bsp/Src/drv_dr16.d ./bsp/Src/drv_dr16.o ./bsp/Src/drv_dr16.su ./bsp/Src/drv_flash.cyclo ./bsp/Src/drv_flash.d ./bsp/Src/drv_flash.o ./bsp/Src/drv_flash.su ./bsp/Src/drv_imu.cyclo ./bsp/Src/drv_imu.d ./bsp/Src/drv_imu.o ./bsp/Src/drv_imu.su ./bsp/Src/drv_io.cyclo ./bsp/Src/drv_io.d ./bsp/Src/drv_io.o ./bsp/Src/drv_io.su ./bsp/Src/drv_uart.cyclo ./bsp/Src/drv_uart.d ./bsp/Src/drv_uart.o ./bsp/Src/drv_uart.su

.PHONY: clean-bsp-2f-Src

