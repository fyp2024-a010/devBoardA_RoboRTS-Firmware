################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/Core/Src/can.c \
../bsp/Core/Src/freertos.c \
../bsp/Core/Src/gpio.c \
../bsp/Core/Src/main.c \
../bsp/Core/Src/spi.c \
../bsp/Core/Src/stm32f4xx_hal_msp.c \
../bsp/Core/Src/stm32f4xx_hal_timebase_tim.c \
../bsp/Core/Src/stm32f4xx_it.c \
../bsp/Core/Src/syscalls.c \
../bsp/Core/Src/sysmem.c \
../bsp/Core/Src/system_stm32f4xx.c \
../bsp/Core/Src/usart.c 

OBJS += \
./bsp/Core/Src/can.o \
./bsp/Core/Src/freertos.o \
./bsp/Core/Src/gpio.o \
./bsp/Core/Src/main.o \
./bsp/Core/Src/spi.o \
./bsp/Core/Src/stm32f4xx_hal_msp.o \
./bsp/Core/Src/stm32f4xx_hal_timebase_tim.o \
./bsp/Core/Src/stm32f4xx_it.o \
./bsp/Core/Src/syscalls.o \
./bsp/Core/Src/sysmem.o \
./bsp/Core/Src/system_stm32f4xx.o \
./bsp/Core/Src/usart.o 

C_DEPS += \
./bsp/Core/Src/can.d \
./bsp/Core/Src/freertos.d \
./bsp/Core/Src/gpio.d \
./bsp/Core/Src/main.d \
./bsp/Core/Src/spi.d \
./bsp/Core/Src/stm32f4xx_hal_msp.d \
./bsp/Core/Src/stm32f4xx_hal_timebase_tim.d \
./bsp/Core/Src/stm32f4xx_it.d \
./bsp/Core/Src/syscalls.d \
./bsp/Core/Src/sysmem.d \
./bsp/Core/Src/system_stm32f4xx.d \
./bsp/Core/Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/Core/Src/%.o bsp/Core/Src/%.su bsp/Core/Src/%.cyclo: ../bsp/Core/Src/%.c bsp/Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../applications -I../motors/Inc -I../support/Inc -I../bsp/Core/Inc -I../bsp/USB_DEVICE/App -I../bsp/USB_DEVICE/Target -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-Core-2f-Src

clean-bsp-2f-Core-2f-Src:
	-$(RM) ./bsp/Core/Src/can.cyclo ./bsp/Core/Src/can.d ./bsp/Core/Src/can.o ./bsp/Core/Src/can.su ./bsp/Core/Src/freertos.cyclo ./bsp/Core/Src/freertos.d ./bsp/Core/Src/freertos.o ./bsp/Core/Src/freertos.su ./bsp/Core/Src/gpio.cyclo ./bsp/Core/Src/gpio.d ./bsp/Core/Src/gpio.o ./bsp/Core/Src/gpio.su ./bsp/Core/Src/main.cyclo ./bsp/Core/Src/main.d ./bsp/Core/Src/main.o ./bsp/Core/Src/main.su ./bsp/Core/Src/spi.cyclo ./bsp/Core/Src/spi.d ./bsp/Core/Src/spi.o ./bsp/Core/Src/spi.su ./bsp/Core/Src/stm32f4xx_hal_msp.cyclo ./bsp/Core/Src/stm32f4xx_hal_msp.d ./bsp/Core/Src/stm32f4xx_hal_msp.o ./bsp/Core/Src/stm32f4xx_hal_msp.su ./bsp/Core/Src/stm32f4xx_hal_timebase_tim.cyclo ./bsp/Core/Src/stm32f4xx_hal_timebase_tim.d ./bsp/Core/Src/stm32f4xx_hal_timebase_tim.o ./bsp/Core/Src/stm32f4xx_hal_timebase_tim.su ./bsp/Core/Src/stm32f4xx_it.cyclo ./bsp/Core/Src/stm32f4xx_it.d ./bsp/Core/Src/stm32f4xx_it.o ./bsp/Core/Src/stm32f4xx_it.su ./bsp/Core/Src/syscalls.cyclo ./bsp/Core/Src/syscalls.d ./bsp/Core/Src/syscalls.o ./bsp/Core/Src/syscalls.su ./bsp/Core/Src/sysmem.cyclo ./bsp/Core/Src/sysmem.d ./bsp/Core/Src/sysmem.o ./bsp/Core/Src/sysmem.su ./bsp/Core/Src/system_stm32f4xx.cyclo ./bsp/Core/Src/system_stm32f4xx.d ./bsp/Core/Src/system_stm32f4xx.o ./bsp/Core/Src/system_stm32f4xx.su ./bsp/Core/Src/usart.cyclo ./bsp/Core/Src/usart.d ./bsp/Core/Src/usart.o ./bsp/Core/Src/usart.su

.PHONY: clean-bsp-2f-Core-2f-Src

