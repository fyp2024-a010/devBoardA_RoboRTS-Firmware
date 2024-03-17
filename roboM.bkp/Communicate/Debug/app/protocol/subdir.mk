################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../app/protocol/protocol.c \
../app/protocol/protocol_common.c \
../app/protocol/protocol_interface.c \
../app/protocol/protocol_transmit.c 

OBJS += \
./app/protocol/protocol.o \
./app/protocol/protocol_common.o \
./app/protocol/protocol_interface.o \
./app/protocol/protocol_transmit.o 

C_DEPS += \
./app/protocol/protocol.d \
./app/protocol/protocol_common.d \
./app/protocol/protocol_interface.d \
./app/protocol/protocol_transmit.d 


# Each subdirectory must supply rules for building sources it contributes
app/protocol/%.o app/protocol/%.su app/protocol/%.cyclo: ../app/protocol/%.c app/protocol/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-app-2f-protocol

clean-app-2f-protocol:
	-$(RM) ./app/protocol/protocol.cyclo ./app/protocol/protocol.d ./app/protocol/protocol.o ./app/protocol/protocol.su ./app/protocol/protocol_common.cyclo ./app/protocol/protocol_common.d ./app/protocol/protocol_common.o ./app/protocol/protocol_common.su ./app/protocol/protocol_interface.cyclo ./app/protocol/protocol_interface.d ./app/protocol/protocol_interface.o ./app/protocol/protocol_interface.su ./app/protocol/protocol_transmit.cyclo ./app/protocol/protocol_transmit.d ./app/protocol/protocol_transmit.o ./app/protocol/protocol_transmit.su

.PHONY: clean-app-2f-protocol

