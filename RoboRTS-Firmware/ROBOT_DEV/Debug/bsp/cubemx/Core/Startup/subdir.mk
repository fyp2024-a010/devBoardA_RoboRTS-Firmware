################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../bsp/cubemx/Core/Startup/startup_stm32f427iihx.s 

OBJS += \
./bsp/cubemx/Core/Startup/startup_stm32f427iihx.o 

S_DEPS += \
./bsp/cubemx/Core/Startup/startup_stm32f427iihx.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubemx/Core/Startup/%.o: ../bsp/cubemx/Core/Startup/%.s bsp/cubemx/Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-bsp-2f-cubemx-2f-Core-2f-Startup

clean-bsp-2f-cubemx-2f-Core-2f-Startup:
	-$(RM) ./bsp/cubemx/Core/Startup/startup_stm32f427iihx.d ./bsp/cubemx/Core/Startup/startup_stm32f427iihx.o

.PHONY: clean-bsp-2f-cubemx-2f-Core-2f-Startup
