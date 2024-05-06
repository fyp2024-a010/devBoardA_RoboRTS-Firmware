################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../miniBotRTS-Firmware/boards/drv_can.c \
../miniBotRTS-Firmware/boards/drv_imu.c 

OBJS += \
./miniBotRTS-Firmware/boards/drv_can.o \
./miniBotRTS-Firmware/boards/drv_imu.o 

C_DEPS += \
./miniBotRTS-Firmware/boards/drv_can.d \
./miniBotRTS-Firmware/boards/drv_imu.d 


# Each subdirectory must supply rules for building sources it contributes
miniBotRTS-Firmware/boards/%.o miniBotRTS-Firmware/boards/%.su miniBotRTS-Firmware/boards/%.cyclo: ../miniBotRTS-Firmware/boards/%.c miniBotRTS-Firmware/boards/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../miniBotRTS-Firmware/application/mb_protocol -I../miniBotRTS-Firmware/application -I../miniBotRTS-Firmware/boards -I../miniBotRTS-Firmware/components/algorithms -I../miniBotRTS-Firmware/components/controller -I../miniBotRTS-Firmware/components/devices -I../miniBotRTS-Firmware/components/modules -I../miniBotRTS-Firmware/components/object -I../miniBotRTS-Firmware/components/support -I../miniBotRTS-Firmware/components/algorithm -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-miniBotRTS-2d-Firmware-2f-boards

clean-miniBotRTS-2d-Firmware-2f-boards:
	-$(RM) ./miniBotRTS-Firmware/boards/drv_can.cyclo ./miniBotRTS-Firmware/boards/drv_can.d ./miniBotRTS-Firmware/boards/drv_can.o ./miniBotRTS-Firmware/boards/drv_can.su ./miniBotRTS-Firmware/boards/drv_imu.cyclo ./miniBotRTS-Firmware/boards/drv_imu.d ./miniBotRTS-Firmware/boards/drv_imu.o ./miniBotRTS-Firmware/boards/drv_imu.su

.PHONY: clean-miniBotRTS-2d-Firmware-2f-boards

