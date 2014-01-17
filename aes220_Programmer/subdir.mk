################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
./aes220_Programmer.cpp

OBJS := $(C_SRCS:.c=.o)

C_DEPS := $(C_SRCS:.c=.d)
#CPP_DEPS += \

# Libraries required (remove the lib prefix and .so extension)
LIBS := aes220 usb-1.0
# and their paths
LIB_DIRS := ./ /lib /usr/lib /home/pi/workspace/libaes220/libaes220_eabi

# Add the -l switch to the libraries
LIB_STR := $(foreach LIBS,$(LIBS),-l$(LIBS))

# Add the -L switch to the libraries paths
LIB_DIRS_PATH := $(foreach LIB_DIRS,$(LIB_DIRS),-L$(LIB_DIRS))

# Every subdirectory with header files must be described here
INC_DIRS := ./ ../../../../API # or /PathToAPI/
SRC_DIRS := ./ ../

# Add the -I switch to the various paths containing header files
INC_STR := $(foreach INC_DIRS,$(INC_DIRS),-I$(INC_DIRS))

# Associate library directories with the .c extension (so make will search them)
vpath %.c $(SRC_DIRS)


# Each subdirectory must supply rules for building sources it contributes
%.o: ./%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -Wall -fexceptions $(INC_STR) -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


