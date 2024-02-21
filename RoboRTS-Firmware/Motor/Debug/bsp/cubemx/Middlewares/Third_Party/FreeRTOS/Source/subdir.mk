################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/croutine.c \
../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/event_groups.c \
../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/list.c \
../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/queue.c \
../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c \
../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/tasks.c \
../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/timers.c 

OBJS += \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/croutine.o \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/event_groups.o \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/list.o \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/queue.o \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.o \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/tasks.o \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/timers.o 

C_DEPS += \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/croutine.d \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/event_groups.d \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/list.d \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/queue.d \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.d \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/tasks.d \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/timers.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/%.o bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/%.su bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/%.cyclo: ../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/%.c bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../motors/Inc -I../applications -I../bsp/cubemx/Core/Inc -I../bsp/cubemx/USB_DEVICE/App -I../bsp/cubemx/USB_DEVICE/Target -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubemx/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubemx/Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubemx-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source

clean-bsp-2f-cubemx-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source:
	-$(RM) ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/croutine.cyclo ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/croutine.d ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/croutine.o ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/croutine.su ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/event_groups.cyclo ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/event_groups.d ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/event_groups.o ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/event_groups.su ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/list.cyclo ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/list.d ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/list.o ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/list.su ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/queue.cyclo ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/queue.d ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/queue.o ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/queue.su ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.cyclo ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.d ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.o ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.su ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/tasks.cyclo ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/tasks.d ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/tasks.o ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/tasks.su ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/timers.cyclo ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/timers.d ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/timers.o ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/timers.su

.PHONY: clean-bsp-2f-cubemx-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source

