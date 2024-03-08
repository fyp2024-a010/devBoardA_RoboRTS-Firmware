################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.c \
../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.c \
../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.c \
../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.c \
../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c \
../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.c \
../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.c 

OBJS += \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.o \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.o \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.o \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.o \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.o \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.o \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.o 

C_DEPS += \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.d \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.d \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.d \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.d \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.d \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.d \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/%.o bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/%.su bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/%.cyclo: ../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/%.c bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../application -I../application/protocol -I../bsp/boards/ -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source

clean-bsp-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source:
	-$(RM) ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.cyclo ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.d ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.o ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.su ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.cyclo ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.d ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.o ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.su ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.cyclo ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.d ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.o ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.su ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.cyclo ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.d ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.o ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.su ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.cyclo ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.d ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.o ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.su ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.cyclo ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.d ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.o ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.su ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.cyclo ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.d ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.o ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.su

.PHONY: clean-bsp-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source

