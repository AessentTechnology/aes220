################################################################################
# subdir makefile for libaes220
# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
./aes220_API.cpp \
./lib/aes220Dev.cpp \
./lib/aesFx2Dev.cpp \
./lib/aesLog.cpp \
./lib/aesUSB.cpp 

OBJS := $(C_SRCS:.cpp=.o)

C_DEPS := $(C_SRCS:.cpp=.d)

# Libraries required (remove the lib prefix and .so extension)
LIBS := usb-1.0
# and their paths
LIB_DIRS := ./ /lib /usr/lib 

# Add the -l switch to the libraries
LIB_STR := $(foreach LIBS,$(LIBS),-l$(LIBS))

# Add the -L switch to the libraries paths
LIB_DIRS_PATH := $(foreach LIB_DIRS,$(LIB_DIRS),-L$(LIB_DIRS))

# Every subdirectory with header files must be described here
INC_DIRS := ./ ./include ../../../../API # or /PathToAPI/
SRC_DIRS := ./ ./lib ../

# Add the -I switch to the various paths containing header files
INC_STR := $(foreach INC_DIRS,$(INC_DIRS),-I$(INC_DIRS))

# Associate library directories with the .c extension (so make will search them)
vpath %.c $(SRC_DIRS)


# Each subdirectory must supply rules for building sources it contributes
%.o: ./%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -Wall -fexceptions $(INC_STR) -O0 -g3 -Wall -c -fmessage-length=0 -fPIC -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


