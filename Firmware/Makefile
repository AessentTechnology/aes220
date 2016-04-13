FX2LIBDIR=./fx2lib
BASENAME = aes220_Firmware
SOURCES=aes220_Firmware.c ./lib/aes220.c ./lib/aes_i2c.c
A51_SOURCES=dscr.a51

include $(FX2LIBDIR)/lib/fx2.mk

VID=0x2443
PID=0x00dc

INCLUDES=./include

AS8051=sdas8051

CODE_SIZE=--code-size 0x3BF8
XRAM_LOC=--xram-loc 0x3BF7

