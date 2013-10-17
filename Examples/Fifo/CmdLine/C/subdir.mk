################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
./aes220_FifoExample.c

OBJS += \
./aes220_FifoExample.o 

CPP_DEPS += \
#./aes220_FifoExample.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ./%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	gcc -Wall -fexceptions -std=gnu99 -I$(SUBDIRS) -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


