################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/Middlewares/Third_Party/FreeRTOS/Source/croutine.c \
../bsp/Middlewares/Third_Party/FreeRTOS/Source/event_groups.c \
../bsp/Middlewares/Third_Party/FreeRTOS/Source/list.c \
../bsp/Middlewares/Third_Party/FreeRTOS/Source/queue.c \
../bsp/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c \
../bsp/Middlewares/Third_Party/FreeRTOS/Source/tasks.c \
../bsp/Middlewares/Third_Party/FreeRTOS/Source/timers.c 

OBJS += \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/croutine.o \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/event_groups.o \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/list.o \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/queue.o \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.o \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/tasks.o \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/timers.o 

C_DEPS += \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/croutine.d \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/event_groups.d \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/list.d \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/queue.d \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.d \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/tasks.d \
./bsp/Middlewares/Third_Party/FreeRTOS/Source/timers.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/Middlewares/Third_Party/FreeRTOS/Source/%.o bsp/Middlewares/Third_Party/FreeRTOS/Source/%.su bsp/Middlewares/Third_Party/FreeRTOS/Source/%.cyclo: ../bsp/Middlewares/Third_Party/FreeRTOS/Source/%.c bsp/Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../applications -I../motors/Inc -I../support/Inc -I../bsp/Core/Inc -I../bsp/USB_DEVICE/App -I../bsp/USB_DEVICE/Target -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/Drivers/CMSIS/Include -I../protocol -I../support -I../object -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source

clean-bsp-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source:
	-$(RM) ./bsp/Middlewares/Third_Party/FreeRTOS/Source/croutine.cyclo ./bsp/Middlewares/Third_Party/FreeRTOS/Source/croutine.d ./bsp/Middlewares/Third_Party/FreeRTOS/Source/croutine.o ./bsp/Middlewares/Third_Party/FreeRTOS/Source/croutine.su ./bsp/Middlewares/Third_Party/FreeRTOS/Source/event_groups.cyclo ./bsp/Middlewares/Third_Party/FreeRTOS/Source/event_groups.d ./bsp/Middlewares/Third_Party/FreeRTOS/Source/event_groups.o ./bsp/Middlewares/Third_Party/FreeRTOS/Source/event_groups.su ./bsp/Middlewares/Third_Party/FreeRTOS/Source/list.cyclo ./bsp/Middlewares/Third_Party/FreeRTOS/Source/list.d ./bsp/Middlewares/Third_Party/FreeRTOS/Source/list.o ./bsp/Middlewares/Third_Party/FreeRTOS/Source/list.su ./bsp/Middlewares/Third_Party/FreeRTOS/Source/queue.cyclo ./bsp/Middlewares/Third_Party/FreeRTOS/Source/queue.d ./bsp/Middlewares/Third_Party/FreeRTOS/Source/queue.o ./bsp/Middlewares/Third_Party/FreeRTOS/Source/queue.su ./bsp/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.cyclo ./bsp/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.d ./bsp/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.o ./bsp/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.su ./bsp/Middlewares/Third_Party/FreeRTOS/Source/tasks.cyclo ./bsp/Middlewares/Third_Party/FreeRTOS/Source/tasks.d ./bsp/Middlewares/Third_Party/FreeRTOS/Source/tasks.o ./bsp/Middlewares/Third_Party/FreeRTOS/Source/tasks.su ./bsp/Middlewares/Third_Party/FreeRTOS/Source/timers.cyclo ./bsp/Middlewares/Third_Party/FreeRTOS/Source/timers.d ./bsp/Middlewares/Third_Party/FreeRTOS/Source/timers.o ./bsp/Middlewares/Third_Party/FreeRTOS/Source/timers.su

.PHONY: clean-bsp-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source

