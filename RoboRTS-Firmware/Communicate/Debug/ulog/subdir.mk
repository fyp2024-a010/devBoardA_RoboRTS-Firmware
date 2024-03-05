################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ulog/ulog.c \
../ulog/ulog_console.c 

OBJS += \
./ulog/ulog.o \
./ulog/ulog_console.o 

C_DEPS += \
./ulog/ulog.d \
./ulog/ulog_console.d 


# Each subdirectory must supply rules for building sources it contributes
ulog/%.o ulog/%.su ulog/%.cyclo: ../ulog/%.c ulog/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-ulog

clean-ulog:
	-$(RM) ./ulog/ulog.cyclo ./ulog/ulog.d ./ulog/ulog.o ./ulog/ulog.su ./ulog/ulog_console.cyclo ./ulog/ulog_console.d ./ulog/ulog_console.o ./ulog/ulog_console.su

.PHONY: clean-ulog

