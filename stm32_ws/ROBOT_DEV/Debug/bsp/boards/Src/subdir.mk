################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/boards/Src/drv_blinky.c 

OBJS += \
./bsp/boards/Src/drv_blinky.o 

C_DEPS += \
./bsp/boards/Src/drv_blinky.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/boards/Src/%.o bsp/boards/Src/%.su bsp/boards/Src/%.cyclo: ../bsp/boards/Src/%.c bsp/boards/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/boards/Inc -I../object/Inc -I../application/Inc -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-boards-2f-Src

clean-bsp-2f-boards-2f-Src:
	-$(RM) ./bsp/boards/Src/drv_blinky.cyclo ./bsp/boards/Src/drv_blinky.d ./bsp/boards/Src/drv_blinky.o ./bsp/boards/Src/drv_blinky.su

.PHONY: clean-bsp-2f-boards-2f-Src

