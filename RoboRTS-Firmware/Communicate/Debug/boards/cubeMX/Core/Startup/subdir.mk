################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../boards/cubeMX/Core/Startup/startup_stm32f427iihx.s 

OBJS += \
./boards/cubeMX/Core/Startup/startup_stm32f427iihx.o 

S_DEPS += \
./boards/cubeMX/Core/Startup/startup_stm32f427iihx.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/Core/Startup/%.o: ../boards/cubeMX/Core/Startup/%.s boards/cubeMX/Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-boards-2f-cubeMX-2f-Core-2f-Startup

clean-boards-2f-cubeMX-2f-Core-2f-Startup:
	-$(RM) ./boards/cubeMX/Core/Startup/startup_stm32f427iihx.d ./boards/cubeMX/Core/Startup/startup_stm32f427iihx.o

.PHONY: clean-boards-2f-cubeMX-2f-Core-2f-Startup

