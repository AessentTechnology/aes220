################################################################################
# libaes220 makefile
LIBPRE = libaes220.so
LIBVER = 1.4.6
LIBNAME = $(LIBPRE).$(LIBVER)
RM := rm -rf

# All of the sources participating in the build are defined here
-include subdir.mk

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

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: $(LIBNAME)

# Tool invocations
$(LIBNAME): $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC Linker'
	g++ $(LIB_DIRS_PATH) -shared -o "$(LIBNAME)" $(OBJS) $(USER_OBJS) $(LIB_STR)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS) $(C_DEPS) $(EXECUTABLES)
	-@echo ' '

.PHONY: all clean dependents
