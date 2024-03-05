################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include utilities/ulog/subdir.mk
-include utilities/subdir.mk
-include test/subdir.mk
-include components/support/subdir.mk
-include components/object/subdir.mk
-include components/modules/subdir.mk
-include components/devices/subdir.mk
-include components/controller/subdir.mk
-include components/algorithm/subdir.mk
-include bsp/cubemx/USB_DEVICE/Target/subdir.mk
-include bsp/cubemx/USB_DEVICE/App/subdir.mk
-include bsp/cubemx/Core/Startup/subdir.mk
-include bsp/cubemx/Core/Src/subdir.mk
-include bsp/boards/subdir.mk
-include application/protocol/subdir.mk
-include application/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := RoboRTS-Firmware
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
RoboRTS-Firmware.elf \

MAP_FILES += \
RoboRTS-Firmware.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
RoboRTS-Firmware.list \


# All Target
all: main-build

# Main-build Target
main-build: RoboRTS-Firmware.elf secondary-outputs

# Tool invocations
RoboRTS-Firmware.elf RoboRTS-Firmware.map: $(OBJS) $(USER_OBJS) /Users/bentjh01/Documents/01_NTU/FYP/project/RoboMasterDevBoard/RoboRTS-Firmware/RoboRTS-Firmware/STM32F427IIHX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "RoboRTS-Firmware.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"/Users/bentjh01/Documents/01_NTU/FYP/project/RoboMasterDevBoard/RoboRTS-Firmware/RoboRTS-Firmware/STM32F427IIHX_FLASH.ld" --specs=nosys.specs -Wl,-Map="RoboRTS-Firmware.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

RoboRTS-Firmware.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "RoboRTS-Firmware.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) RoboRTS-Firmware.elf RoboRTS-Firmware.list RoboRTS-Firmware.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
