################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/cubeMX/Core/Src/can.c \
../boards/cubeMX/Core/Src/dma.c \
../boards/cubeMX/Core/Src/freertos.c \
../boards/cubeMX/Core/Src/gpio.c \
../boards/cubeMX/Core/Src/main.c \
../boards/cubeMX/Core/Src/spi.c \
../boards/cubeMX/Core/Src/stm32f4xx_hal_msp.c \
../boards/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.c \
../boards/cubeMX/Core/Src/stm32f4xx_it.c \
../boards/cubeMX/Core/Src/syscalls.c \
../boards/cubeMX/Core/Src/sysmem.c \
../boards/cubeMX/Core/Src/system_stm32f4xx.c \
../boards/cubeMX/Core/Src/usart.c 

OBJS += \
./boards/cubeMX/Core/Src/can.o \
./boards/cubeMX/Core/Src/dma.o \
./boards/cubeMX/Core/Src/freertos.o \
./boards/cubeMX/Core/Src/gpio.o \
./boards/cubeMX/Core/Src/main.o \
./boards/cubeMX/Core/Src/spi.o \
./boards/cubeMX/Core/Src/stm32f4xx_hal_msp.o \
./boards/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.o \
./boards/cubeMX/Core/Src/stm32f4xx_it.o \
./boards/cubeMX/Core/Src/syscalls.o \
./boards/cubeMX/Core/Src/sysmem.o \
./boards/cubeMX/Core/Src/system_stm32f4xx.o \
./boards/cubeMX/Core/Src/usart.o 

C_DEPS += \
./boards/cubeMX/Core/Src/can.d \
./boards/cubeMX/Core/Src/dma.d \
./boards/cubeMX/Core/Src/freertos.d \
./boards/cubeMX/Core/Src/gpio.d \
./boards/cubeMX/Core/Src/main.d \
./boards/cubeMX/Core/Src/spi.d \
./boards/cubeMX/Core/Src/stm32f4xx_hal_msp.d \
./boards/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.d \
./boards/cubeMX/Core/Src/stm32f4xx_it.d \
./boards/cubeMX/Core/Src/syscalls.d \
./boards/cubeMX/Core/Src/sysmem.d \
./boards/cubeMX/Core/Src/system_stm32f4xx.d \
./boards/cubeMX/Core/Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/Core/Src/%.o boards/cubeMX/Core/Src/%.su boards/cubeMX/Core/Src/%.cyclo: ../boards/cubeMX/Core/Src/%.c boards/cubeMX/Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-cubeMX-2f-Core-2f-Src

clean-boards-2f-cubeMX-2f-Core-2f-Src:
	-$(RM) ./boards/cubeMX/Core/Src/can.cyclo ./boards/cubeMX/Core/Src/can.d ./boards/cubeMX/Core/Src/can.o ./boards/cubeMX/Core/Src/can.su ./boards/cubeMX/Core/Src/dma.cyclo ./boards/cubeMX/Core/Src/dma.d ./boards/cubeMX/Core/Src/dma.o ./boards/cubeMX/Core/Src/dma.su ./boards/cubeMX/Core/Src/freertos.cyclo ./boards/cubeMX/Core/Src/freertos.d ./boards/cubeMX/Core/Src/freertos.o ./boards/cubeMX/Core/Src/freertos.su ./boards/cubeMX/Core/Src/gpio.cyclo ./boards/cubeMX/Core/Src/gpio.d ./boards/cubeMX/Core/Src/gpio.o ./boards/cubeMX/Core/Src/gpio.su ./boards/cubeMX/Core/Src/main.cyclo ./boards/cubeMX/Core/Src/main.d ./boards/cubeMX/Core/Src/main.o ./boards/cubeMX/Core/Src/main.su ./boards/cubeMX/Core/Src/spi.cyclo ./boards/cubeMX/Core/Src/spi.d ./boards/cubeMX/Core/Src/spi.o ./boards/cubeMX/Core/Src/spi.su ./boards/cubeMX/Core/Src/stm32f4xx_hal_msp.cyclo ./boards/cubeMX/Core/Src/stm32f4xx_hal_msp.d ./boards/cubeMX/Core/Src/stm32f4xx_hal_msp.o ./boards/cubeMX/Core/Src/stm32f4xx_hal_msp.su ./boards/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.cyclo ./boards/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.d ./boards/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.o ./boards/cubeMX/Core/Src/stm32f4xx_hal_timebase_tim.su ./boards/cubeMX/Core/Src/stm32f4xx_it.cyclo ./boards/cubeMX/Core/Src/stm32f4xx_it.d ./boards/cubeMX/Core/Src/stm32f4xx_it.o ./boards/cubeMX/Core/Src/stm32f4xx_it.su ./boards/cubeMX/Core/Src/syscalls.cyclo ./boards/cubeMX/Core/Src/syscalls.d ./boards/cubeMX/Core/Src/syscalls.o ./boards/cubeMX/Core/Src/syscalls.su ./boards/cubeMX/Core/Src/sysmem.cyclo ./boards/cubeMX/Core/Src/sysmem.d ./boards/cubeMX/Core/Src/sysmem.o ./boards/cubeMX/Core/Src/sysmem.su ./boards/cubeMX/Core/Src/system_stm32f4xx.cyclo ./boards/cubeMX/Core/Src/system_stm32f4xx.d ./boards/cubeMX/Core/Src/system_stm32f4xx.o ./boards/cubeMX/Core/Src/system_stm32f4xx.su ./boards/cubeMX/Core/Src/usart.cyclo ./boards/cubeMX/Core/Src/usart.d ./boards/cubeMX/Core/Src/usart.o ./boards/cubeMX/Core/Src/usart.su

.PHONY: clean-boards-2f-cubeMX-2f-Core-2f-Src

