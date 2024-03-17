################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.c 

OBJS += \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.o 

C_DEPS += \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/%.o boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/%.su boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/%.cyclo: ../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/%.c boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-CMSIS_RTOS_V2

clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-CMSIS_RTOS_V2:
	-$(RM) ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.su

.PHONY: clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-CMSIS_RTOS_V2

