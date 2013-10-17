################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
./aes220_FifoExample.cpp 

OBJS += \
./aes220_FifoExample.o 

CPP_DEPS += \
#./aes220_FifoExample.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ./%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -Wall -fexceptions -I$(SUBDIRS) -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


