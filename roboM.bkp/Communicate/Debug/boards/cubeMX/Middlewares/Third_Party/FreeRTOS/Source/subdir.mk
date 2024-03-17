################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.c \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.c \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.c \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.c \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.c \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.c 

OBJS += \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.o \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.o \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.o \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.o \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.o \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.o \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.o 

C_DEPS += \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.d \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.d \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.d \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.d \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.d \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.d \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/%.o boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/%.su boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/%.cyclo: ../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/%.c boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source

clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source:
	-$(RM) ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.su ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.su ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.su ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.su ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.su ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.su ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.su

.PHONY: clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source

