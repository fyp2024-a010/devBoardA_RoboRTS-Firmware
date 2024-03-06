################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubeMX/Core/Src/can.c \
../bsp/cubeMX/Core/Src/dma.c \
../bsp/cubeMX/Core/Src/freertos.c \
../bsp/cubeMX/Core/Src/gpio.c \
../bsp/cubeMX/Core/Src/main.c \
../bsp/cubeMX/Core/Src/spi.c \
../bsp/cubeMX/Core/Src/stm32f4xx_hal_msp.c \
../bsp/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.c \
../bsp/cubeMX/Core/Src/stm32f4xx_it.c \
../bsp/cubeMX/Core/Src/syscalls.c \
../bsp/cubeMX/Core/Src/sysmem.c \
../bsp/cubeMX/Core/Src/system_stm32f4xx.c \
../bsp/cubeMX/Core/Src/tim.c \
../bsp/cubeMX/Core/Src/usart.c 

OBJS += \
./bsp/cubeMX/Core/Src/can.o \
./bsp/cubeMX/Core/Src/dma.o \
./bsp/cubeMX/Core/Src/freertos.o \
./bsp/cubeMX/Core/Src/gpio.o \
./bsp/cubeMX/Core/Src/main.o \
./bsp/cubeMX/Core/Src/spi.o \
./bsp/cubeMX/Core/Src/stm32f4xx_hal_msp.o \
./bsp/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.o \
./bsp/cubeMX/Core/Src/stm32f4xx_it.o \
./bsp/cubeMX/Core/Src/syscalls.o \
./bsp/cubeMX/Core/Src/sysmem.o \
./bsp/cubeMX/Core/Src/system_stm32f4xx.o \
./bsp/cubeMX/Core/Src/tim.o \
./bsp/cubeMX/Core/Src/usart.o 

C_DEPS += \
./bsp/cubeMX/Core/Src/can.d \
./bsp/cubeMX/Core/Src/dma.d \
./bsp/cubeMX/Core/Src/freertos.d \
./bsp/cubeMX/Core/Src/gpio.d \
./bsp/cubeMX/Core/Src/main.d \
./bsp/cubeMX/Core/Src/spi.d \
./bsp/cubeMX/Core/Src/stm32f4xx_hal_msp.d \
./bsp/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.d \
./bsp/cubeMX/Core/Src/stm32f4xx_it.d \
./bsp/cubeMX/Core/Src/syscalls.d \
./bsp/cubeMX/Core/Src/sysmem.d \
./bsp/cubeMX/Core/Src/system_stm32f4xx.d \
./bsp/cubeMX/Core/Src/tim.d \
./bsp/cubeMX/Core/Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubeMX/Core/Src/%.o bsp/cubeMX/Core/Src/%.su bsp/cubeMX/Core/Src/%.cyclo: ../bsp/cubeMX/Core/Src/%.c bsp/cubeMX/Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/boards/Inc -I../object/Inc -I../application/Inc -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubeMX-2f-Core-2f-Src

clean-bsp-2f-cubeMX-2f-Core-2f-Src:
	-$(RM) ./bsp/cubeMX/Core/Src/can.cyclo ./bsp/cubeMX/Core/Src/can.d ./bsp/cubeMX/Core/Src/can.o ./bsp/cubeMX/Core/Src/can.su ./bsp/cubeMX/Core/Src/dma.cyclo ./bsp/cubeMX/Core/Src/dma.d ./bsp/cubeMX/Core/Src/dma.o ./bsp/cubeMX/Core/Src/dma.su ./bsp/cubeMX/Core/Src/freertos.cyclo ./bsp/cubeMX/Core/Src/freertos.d ./bsp/cubeMX/Core/Src/freertos.o ./bsp/cubeMX/Core/Src/freertos.su ./bsp/cubeMX/Core/Src/gpio.cyclo ./bsp/cubeMX/Core/Src/gpio.d ./bsp/cubeMX/Core/Src/gpio.o ./bsp/cubeMX/Core/Src/gpio.su ./bsp/cubeMX/Core/Src/main.cyclo ./bsp/cubeMX/Core/Src/main.d ./bsp/cubeMX/Core/Src/main.o ./bsp/cubeMX/Core/Src/main.su ./bsp/cubeMX/Core/Src/spi.cyclo ./bsp/cubeMX/Core/Src/spi.d ./bsp/cubeMX/Core/Src/spi.o ./bsp/cubeMX/Core/Src/spi.su ./bsp/cubeMX/Core/Src/stm32f4xx_hal_msp.cyclo ./bsp/cubeMX/Core/Src/stm32f4xx_hal_msp.d ./bsp/cubeMX/Core/Src/stm32f4xx_hal_msp.o ./bsp/cubeMX/Core/Src/stm32f4xx_hal_msp.su ./bsp/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.cyclo ./bsp/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.d ./bsp/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.o ./bsp/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.su ./bsp/cubeMX/Core/Src/stm32f4xx_it.cyclo ./bsp/cubeMX/Core/Src/stm32f4xx_it.d ./bsp/cubeMX/Core/Src/stm32f4xx_it.o ./bsp/cubeMX/Core/Src/stm32f4xx_it.su ./bsp/cubeMX/Core/Src/syscalls.cyclo ./bsp/cubeMX/Core/Src/syscalls.d ./bsp/cubeMX/Core/Src/syscalls.o ./bsp/cubeMX/Core/Src/syscalls.su ./bsp/cubeMX/Core/Src/sysmem.cyclo ./bsp/cubeMX/Core/Src/sysmem.d ./bsp/cubeMX/Core/Src/sysmem.o ./bsp/cubeMX/Core/Src/sysmem.su ./bsp/cubeMX/Core/Src/system_stm32f4xx.cyclo ./bsp/cubeMX/Core/Src/system_stm32f4xx.d ./bsp/cubeMX/Core/Src/system_stm32f4xx.o ./bsp/cubeMX/Core/Src/system_stm32f4xx.su ./bsp/cubeMX/Core/Src/tim.cyclo ./bsp/cubeMX/Core/Src/tim.d ./bsp/cubeMX/Core/Src/tim.o ./bsp/cubeMX/Core/Src/tim.su ./bsp/cubeMX/Core/Src/usart.cyclo ./bsp/cubeMX/Core/Src/usart.d ./bsp/cubeMX/Core/Src/usart.o ./bsp/cubeMX/Core/Src/usart.su

.PHONY: clean-bsp-2f-cubeMX-2f-Core-2f-Src

