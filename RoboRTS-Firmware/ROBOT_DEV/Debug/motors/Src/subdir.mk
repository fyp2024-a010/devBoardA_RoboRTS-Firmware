################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../motors/Src/motors.c \
../motors/Src/pid.c 

OBJS += \
./motors/Src/motors.o \
./motors/Src/pid.o 

C_DEPS += \
./motors/Src/motors.d \
./motors/Src/pid.d 


# Each subdirectory must supply rules for building sources it contributes
motors/Src/%.o motors/Src/%.su motors/Src/%.cyclo: ../motors/Src/%.c motors/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../applications -I../motors/Inc -I../support/Inc -I../bsp/Core/Inc -I../bsp/USB_DEVICE/App -I../bsp/USB_DEVICE/Target -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-motors-2f-Src

clean-motors-2f-Src:
	-$(RM) ./motors/Src/motors.cyclo ./motors/Src/motors.d ./motors/Src/motors.o ./motors/Src/motors.su ./motors/Src/pid.cyclo ./motors/Src/pid.d ./motors/Src/pid.o ./motors/Src/pid.su

.PHONY: clean-motors-2f-Src

