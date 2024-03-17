################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c 

OBJS += \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.o 

C_DEPS += \
./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.o boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.su boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.cyclo: ../boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.c boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-MemMang

clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-MemMang:
	-$(RM) ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.cyclo ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.d ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.o ./boards/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.su

.PHONY: clean-boards-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-MemMang

