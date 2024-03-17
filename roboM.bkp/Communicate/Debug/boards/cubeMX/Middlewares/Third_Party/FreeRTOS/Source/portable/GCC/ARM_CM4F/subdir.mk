################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.o boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.su boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.cyclo: ../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.c boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-GCC-2f-ARM_CM4F

clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-GCC-2f-ARM_CM4F:
	-$(RM) ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.su

.PHONY: clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-GCC-2f-ARM_CM4F

