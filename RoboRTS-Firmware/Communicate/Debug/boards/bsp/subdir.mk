################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/bsp/board.c \
../boards/bsp/drv_can.c \
../boards/bsp/drv_flash.c \
../boards/bsp/drv_imu.c \
../boards/bsp/drv_io.c \
../boards/bsp/drv_uart.c 

OBJS += \
./boards/bsp/board.o \
./boards/bsp/drv_can.o \
./boards/bsp/drv_flash.o \
./boards/bsp/drv_imu.o \
./boards/bsp/drv_io.o \
./boards/bsp/drv_uart.o 

C_DEPS += \
./boards/bsp/board.d \
./boards/bsp/drv_can.d \
./boards/bsp/drv_flash.d \
./boards/bsp/drv_imu.d \
./boards/bsp/drv_io.d \
./boards/bsp/drv_uart.d 


# Each subdirectory must supply rules for building sources it contributes
boards/bsp/%.o boards/bsp/%.su boards/bsp/%.cyclo: ../boards/bsp/%.c boards/bsp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-bsp

clean-boards-2f-bsp:
	-$(RM) ./boards/bsp/board.cyclo ./boards/bsp/board.d ./boards/bsp/board.o ./boards/bsp/board.su ./boards/bsp/drv_can.cyclo ./boards/bsp/drv_can.d ./boards/bsp/drv_can.o ./boards/bsp/drv_can.su ./boards/bsp/drv_flash.cyclo ./boards/bsp/drv_flash.d ./boards/bsp/drv_flash.o ./boards/bsp/drv_flash.su ./boards/bsp/drv_imu.cyclo ./boards/bsp/drv_imu.d ./boards/bsp/drv_imu.o ./boards/bsp/drv_imu.su ./boards/bsp/drv_io.cyclo ./boards/bsp/drv_io.d ./boards/bsp/drv_io.o ./boards/bsp/drv_io.su ./boards/bsp/drv_uart.cyclo ./boards/bsp/drv_uart.d ./boards/bsp/drv_uart.o ./boards/bsp/drv_uart.su

.PHONY: clean-boards-2f-bsp

