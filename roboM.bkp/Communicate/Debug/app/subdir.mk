################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../app/chassis_task.c \
../app/communicate.c \
../app/infantry_cmd.c \
../app/init.c \
../app/offline_check.c \
../app/param.c \
../app/timer_task.c 

OBJS += \
./app/chassis_task.o \
./app/communicate.o \
./app/infantry_cmd.o \
./app/init.o \
./app/offline_check.o \
./app/param.o \
./app/timer_task.o 

C_DEPS += \
./app/chassis_task.d \
./app/communicate.d \
./app/infantry_cmd.d \
./app/init.d \
./app/offline_check.d \
./app/param.d \
./app/timer_task.d 


# Each subdirectory must supply rules for building sources it contributes
app/%.o app/%.su app/%.cyclo: ../app/%.c app/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-app

clean-app:
	-$(RM) ./app/chassis_task.cyclo ./app/chassis_task.d ./app/chassis_task.o ./app/chassis_task.su ./app/communicate.cyclo ./app/communicate.d ./app/communicate.o ./app/communicate.su ./app/infantry_cmd.cyclo ./app/infantry_cmd.d ./app/infantry_cmd.o ./app/infantry_cmd.su ./app/init.cyclo ./app/init.d ./app/init.o ./app/init.su ./app/offline_check.cyclo ./app/offline_check.d ./app/offline_check.o ./app/offline_check.su ./app/param.cyclo ./app/param.d ./app/param.o ./app/param.su ./app/timer_task.cyclo ./app/timer_task.d ./app/timer_task.o ./app/timer_task.su

.PHONY: clean-app

