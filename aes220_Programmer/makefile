################################################################################


#-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
#-include sources.mk
-include subdir.mk
#-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
endif

#-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: aes220_Programmer

# Tool invocations
aes220_Programmer: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC Linker'
	g++ $(LIB_DIRS_PATH) -o "aes220_Programmer" $(OBJS) $(USER_OBJS) $(LIB_STR)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS) $(C_DEPS) $(CPP_DEPS) $(EXECUTABLES) $(C_UPPER_DEPS) aes220_Programmer
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

#-include ../makefile.targets
