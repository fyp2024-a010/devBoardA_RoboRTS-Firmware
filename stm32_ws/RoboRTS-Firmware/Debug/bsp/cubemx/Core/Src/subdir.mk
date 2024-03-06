################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubemx/Core/Src/can.c \
../bsp/cubemx/Core/Src/dma.c \
../bsp/cubemx/Core/Src/freertos.c \
../bsp/cubemx/Core/Src/gpio.c \
../bsp/cubemx/Core/Src/main.c \
../bsp/cubemx/Core/Src/spi.c \
../bsp/cubemx/Core/Src/stm32f4xx_hal_msp.c \
../bsp/cubemx/Core/Src/stm32f4xx_hal_timebase_TIM.c \
../bsp/cubemx/Core/Src/stm32f4xx_it.c \
../bsp/cubemx/Core/Src/system_stm32f4xx.c \
../bsp/cubemx/Core/Src/tim.c \
../bsp/cubemx/Core/Src/usart.c 

OBJS += \
./bsp/cubemx/Core/Src/can.o \
./bsp/cubemx/Core/Src/dma.o \
./bsp/cubemx/Core/Src/freertos.o \
./bsp/cubemx/Core/Src/gpio.o \
./bsp/cubemx/Core/Src/main.o \
./bsp/cubemx/Core/Src/spi.o \
./bsp/cubemx/Core/Src/stm32f4xx_hal_msp.o \
./bsp/cubemx/Core/Src/stm32f4xx_hal_timebase_TIM.o \
./bsp/cubemx/Core/Src/stm32f4xx_it.o \
./bsp/cubemx/Core/Src/system_stm32f4xx.o \
./bsp/cubemx/Core/Src/tim.o \
./bsp/cubemx/Core/Src/usart.o 

C_DEPS += \
./bsp/cubemx/Core/Src/can.d \
./bsp/cubemx/Core/Src/dma.d \
./bsp/cubemx/Core/Src/freertos.d \
./bsp/cubemx/Core/Src/gpio.d \
./bsp/cubemx/Core/Src/main.d \
./bsp/cubemx/Core/Src/spi.d \
./bsp/cubemx/Core/Src/stm32f4xx_hal_msp.d \
./bsp/cubemx/Core/Src/stm32f4xx_hal_timebase_TIM.d \
./bsp/cubemx/Core/Src/stm32f4xx_it.d \
./bsp/cubemx/Core/Src/system_stm32f4xx.d \
./bsp/cubemx/Core/Src/tim.d \
./bsp/cubemx/Core/Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubemx/Core/Src/%.o bsp/cubemx/Core/Src/%.su bsp/cubemx/Core/Src/%.cyclo: ../bsp/cubemx/Core/Src/%.c bsp/cubemx/Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubemx/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubemx/Drivers/CMSIS/Include -I../bsp/cubemx/Core/Inc -I../application -I../application/protocol -I../bsp/boards -I../components/algorithm -I../components/devices -I../components/controller -I../components/modules -I../components/object -I../components/support -I../test -I../utilities -I../utilities/ulog -I../config -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubemx/USB_DEVICE/App -I../bsp/cubemx/USB_DEVICE/Target -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubemx-2f-Core-2f-Src

clean-bsp-2f-cubemx-2f-Core-2f-Src:
	-$(RM) ./bsp/cubemx/Core/Src/can.cyclo ./bsp/cubemx/Core/Src/can.d ./bsp/cubemx/Core/Src/can.o ./bsp/cubemx/Core/Src/can.su ./bsp/cubemx/Core/Src/dma.cyclo ./bsp/cubemx/Core/Src/dma.d ./bsp/cubemx/Core/Src/dma.o ./bsp/cubemx/Core/Src/dma.su ./bsp/cubemx/Core/Src/freertos.cyclo ./bsp/cubemx/Core/Src/freertos.d ./bsp/cubemx/Core/Src/freertos.o ./bsp/cubemx/Core/Src/freertos.su ./bsp/cubemx/Core/Src/gpio.cyclo ./bsp/cubemx/Core/Src/gpio.d ./bsp/cubemx/Core/Src/gpio.o ./bsp/cubemx/Core/Src/gpio.su ./bsp/cubemx/Core/Src/main.cyclo ./bsp/cubemx/Core/Src/main.d ./bsp/cubemx/Core/Src/main.o ./bsp/cubemx/Core/Src/main.su ./bsp/cubemx/Core/Src/spi.cyclo ./bsp/cubemx/Core/Src/spi.d ./bsp/cubemx/Core/Src/spi.o ./bsp/cubemx/Core/Src/spi.su ./bsp/cubemx/Core/Src/stm32f4xx_hal_msp.cyclo ./bsp/cubemx/Core/Src/stm32f4xx_hal_msp.d ./bsp/cubemx/Core/Src/stm32f4xx_hal_msp.o ./bsp/cubemx/Core/Src/stm32f4xx_hal_msp.su ./bsp/cubemx/Core/Src/stm32f4xx_hal_timebase_TIM.cyclo ./bsp/cubemx/Core/Src/stm32f4xx_hal_timebase_TIM.d ./bsp/cubemx/Core/Src/stm32f4xx_hal_timebase_TIM.o ./bsp/cubemx/Core/Src/stm32f4xx_hal_timebase_TIM.su ./bsp/cubemx/Core/Src/stm32f4xx_it.cyclo ./bsp/cubemx/Core/Src/stm32f4xx_it.d ./bsp/cubemx/Core/Src/stm32f4xx_it.o ./bsp/cubemx/Core/Src/stm32f4xx_it.su ./bsp/cubemx/Core/Src/system_stm32f4xx.cyclo ./bsp/cubemx/Core/Src/system_stm32f4xx.d ./bsp/cubemx/Core/Src/system_stm32f4xx.o ./bsp/cubemx/Core/Src/system_stm32f4xx.su ./bsp/cubemx/Core/Src/tim.cyclo ./bsp/cubemx/Core/Src/tim.d ./bsp/cubemx/Core/Src/tim.o ./bsp/cubemx/Core/Src/tim.su ./bsp/cubemx/Core/Src/usart.cyclo ./bsp/cubemx/Core/Src/usart.d ./bsp/cubemx/Core/Src/usart.o ./bsp/cubemx/Core/Src/usart.su

.PHONY: clean-bsp-2f-cubemx-2f-Core-2f-Src

