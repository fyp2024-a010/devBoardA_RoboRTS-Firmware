################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../motors/Src/drv_can.c \
../motors/Src/motor.c 

OBJS += \
./motors/Src/drv_can.o \
./motors/Src/motor.o 

C_DEPS += \
./motors/Src/drv_can.d \
./motors/Src/motor.d 


# Each subdirectory must supply rules for building sources it contributes
motors/Src/%.o motors/Src/%.su motors/Src/%.cyclo: ../motors/Src/%.c motors/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../support -I../object -I../modules -I../devices -I../controller -I../algorithm -I../imu/Inc -I../gpio/Inc -I../applications/Inc -I../bsp/Inc -I../protocol/Inc -I../ulog -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-motors-2f-Src

clean-motors-2f-Src:
	-$(RM) ./motors/Src/drv_can.cyclo ./motors/Src/drv_can.d ./motors/Src/drv_can.o ./motors/Src/drv_can.su ./motors/Src/motor.cyclo ./motors/Src/motor.d ./motors/Src/motor.o ./motors/Src/motor.su

.PHONY: clean-motors-2f-Src

