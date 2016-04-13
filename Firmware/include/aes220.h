/******************************************************************************
File name: aes220.h
===============================================================================
DESCRIPTION

Utilities for the aes220 High-Speed USB FPGA mini-module

===============================================================================
CHANGES


===============================================================================
NOTES


===============================================================================
PINOUT
  ____________________________________________________________________________
 |                                                                            |
 |                              ________________________                      |
 |                             |                       |                      |
 |               D0 <> IOA0 <> | PA0               PB0 | <> IOB0 LED6         |
 |               D1 <> IOA1 <> | PA1               PB1 | <> IOB1              |
 |               D2 <> IOA2 <> | PA2               PB2 | <> IOB2              |
 |               D3 <> IOA3 <> | PA3               PB3 | <> IOB3              |
 |               D4 <> IOA4 <> | PA4               PB4 | <> IOB4              |
 |               D5 <> IOA5 <> | PA5               PB5 | <> IOB5              |
 |               D6 <> IOA6 <> | PA6               PB6 | <> IOB6              |
 |               D7 <> IOA7    | PA7               PB7 | <> IOB7              |
 |                             |                       |                      |
 |                     IOD0 <  | PD0                   |                      |
 |                     IOD1  > | PD1            CLKOUT |  > CLKOUT            |
 |                     IOD2 <> | PD2                   |                      |
 |                     IOD3 <> | PD3                   |                      |
 |                     IOD4 <> | PD4                   |                      |
 |                     IOD5 <> | PD5                   |                      |
 |                     IOD6 <> | PD6                   |                      |
 |                     IOD7 <  | PD7            FX2    |                      |
 |                             |_______________________|                      |
 |                                                                            |
 |  ___ 3v3                 _________________________________                 |
 |   |   __       __       |                                 |                |
 |   |--|__|LED2 |__|LED1  |                                 |                |
 |   |    |        |_______| P13                          T9 | < CLKOUT       |
 |   |    |________________| N11                             |                |
 |   |   __       __       |                                 |                |
 |   |--|__|LED4 |__|LED3  |                          PROG_B | < IOD0         |
 |   |    |        |_______| N12                        DONE | > IOD1 LED5    |
 |   |    |________________| P11                   CSI_B P10 | <>IOD2         |
 |   |                     |                        DOUT R11 | <>IOD3         |
 |   |     _               |                       AWAKE T11 | <>IOD4         |
 |   |   __|__SW1          |                      INIT_B T12 | <>IOD5         |
 |   |__|     |____________| D6                     CCLK R14 | <>IOD6         |
 |   |     _               |                         SUSPEND | < IOD7         |
 |   |   __|__SW2          |                                 |                |
 |   |__|     |____________| E6                              |                |
 |                         |                                 |                |
 |                  IOB0<> | T2 CSO_B                 D7  T5 | <>IOA0  D0     |
 |                  IOB1<> | R2 M2                    D6  T6 | <>IOA1  D1     |
 |                  IOB2<> | T3 VS2                   D5  P7 | <>IOA2  D2     |
 |                  IOB3<> | P4 M0                    D4  N8 | <>IOA3  D3     |
 |                  IOB4<> | R3 RDWR_B                D3 P12 | <>IOA4  D4     |
 |                  IOB5<> | N4 M1                    D2 T13 | <>IOA5  D5     |
 |                  IOB6<> | P5 VS0                   D1 R13 | <>IOA6  D6     |
 |                  IOB7<> | N6 VS1                   D0 T14 | <>IOA7  D7     |
 |                         |                   XC3S200AN     |                |
 |                         |_________________________________|                |
 |                                                                            |
 |                                                                aes220      |
 |____________________________________________________________________________|

===============================================================================
This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
===============================================================================

******************************************************************************/

#ifndef AES220_H
#define AES220_H

#include <fx2regs.h>
#include <fx2macros.h>
#include <delay.h>
#include <autovector.h>
#include <setupdat.h>
#include <eputils.h>

#define SYNCDELAY SYNCDELAY4
#define REARMVAL 0x80
#define REARM() EP2BCL=REARMVAL

// Bound signals with FPGA
#define PROG_B PD0
#define DONE   PD1
#define CSI_B  PD2
#define DOUT   PD3
#define AWAKE  PD4
#define INIT_B PD5
#define	CCLK   PD6
#define SUSPEND_F PD7

#define LED6   PB0
#define	M2     PB1
#define	VS2    PB2
#define	M0     PB3
#define	RDWRB  PB4
#define	M1     PB5
#define	VS0    PB6
#define	VS1    PB7

// Slave FIFO signals
#define SLCS   PA7
#define PKEND  PA6
#define ADDR1  PA5
#define ADDR0  PA4
//#define CHK3V3 PA3  
#define SLOE   PA2
#define SOFT_RESET PA0

// User Programmable Pins
#define UPP_PIN_DIR 0x00
#define UPP_PIN_VAL 0x01

#define UPP0   PD2
#define UPP1   PD3
#define UPP2   PD5
#define UPP3   PD6
#define UPP4   PA1
#define UPP5   PA3

// FPGA programming specific definitions
#define LOAD_B PD2
#define CS_B   PD3

// Micro-controller modes
#define WAIT_MODE       0xA1
#define PORT_MODE       0xA2
#define SLAVE_FIFO_MODE 0xA3
#define PIPE_IN_MODE    0xA4
#define PIPE_OUT_MODE   0xA5
#define PIPE_MODE       0xA6
#define CONF_F_MODE     0xA7
#define PROG_F_MODE     0xA8
#define READ_FIFO       0xA9


// Micro-controller commands
// FPGA configuration
#define START_CONFIG 0xAA
#define PROG_DONE    0xAB
#define PROG_ERROR   0xAC
#define F_READY      0xAD
#define F_BUSY       0xAE
#define RESET_F      0xAF
#define INIT_B_LOW   0xB0
#define INIT_B_HIGH  0xB1
#define DONE_LOW     0xB2
#define F_NOT_READY  0xB3
// Miscellaneous commands
#define SLEEP_F      0x01
#define WAKE_F       0x02
#define SLEEP_U      0x03
#define FLASH_F      0x04
#define SERIAL_N     0x05
#define BOARD_VER    0x06
#define BOARD_REV    0x07
#define CODE_VER     0x08
#define ASSERT_SOFT_RESET 0x09
#define CLEAR_SOFT_RESET  0x10

// Vendor commands bytes
// FX2
#define VC_EPSTAT  0xB0
#define VC_EEPROM  0xB1
#define VC_I2C     0xB2
#define VC_FIFO_DEBUG 0xB7
// aes220
#define VC_UC_MODE    0xC1
#define VC_UC_CMD     0xC2
#define VC_UPP_CMD    0xC3
#define VC_FLASH_CMD  0xC4
#define VC_SOFT_INFO  0xC5

// Spi Flash commmands and definitions
#define STATUS_CHECK 0x60
#define WRITE_CMD    0x61
#define READ_CMD     0x62
#define PAGE_SIZE     264

#define MAX_EP0_DATA  64
#define MAX_EP6_DATA  512
#define MAX_EEP_WRITE 64

// Board information
#define BOARD_INFO_ADDR 0x3DF8
#define BOARD_INFO_LEN  8
#define BOARD_STATUS_REG_ADDR 0x3DF8

#define LED_ON        0
#define LED_OFF       1


/* Function: assertSoftReset
Sends a reset signal to the FPGA application, does not actually reset the FPGA itself.
The application has to interpret the signal.

Description:

The FPGA application is given a signal called SOFT_RESET_in which it can chose to interpret or 
ignore. It would normally be used in a statement such as: if SOFT_RESET_in = ACTIVE_RESET_LEVEL_c 
then...
*/
void assertSoftReset();

/* Function: clearSoftReset
Clears a the reset signal to the FPGA application set by assertSoftReset function
The application has to interpret the signal.

Description:

The FPGA application is given a signal called SOFT_RESET_in which it can chose to interpret or 
ignore. It would normally be used in a statement such as: if SOFT_RESET_in = ACTIVE_RESET_LEVEL_c 
then...
*/
void clearSoftReset();

BOOL startFpga();
BYTE setupFpgaConf();
BYTE configureFpga(DWORD dataLen);
void setupFpgaProg();
BYTE progFpga();
//void setUserPinsDir(BYTE uppLDirByte, BYTE uppHDirByte);
//void setUserPins(BYTE userPinsByte);
void setMode(BYTE uCMode);
BOOL writeEeprom(BYTE prom_addr, WORD addr, WORD length, BYTE* buf);
BYTE readBoardStatusRegister();

/* Function: execFlashCmd
Transfers a command to the FPGA Flash memory

Parameters: 

- cmd: the Flash command
- len: the length, in bytes, of the data required or returned by the command

Description:

Enables the FPGA SPI interface (pulls CS_B low) before transferring the cmd byte followed by the 
contents of the EP0 buffer (up to length len). 

Overwrites the contents of the buffer with the
values returned by the Flash (which can be garbage if the command doesn't return anything).
*/
void execFlashCmd(WORD cmd, WORD len);

/* Function: transferSpiByte
Transfers a byte from the micro-controller to the FPGA SPI interface.

The interface inside the FPGA is a shift register requiring a byte be present on port B of the
micro-controller. The byte is then loaded toggling LOAD_B input from 0 to 1.

Parameter: the byte data to be transferred 
*/
BYTE transferSpiByte(BYTE spiByte);

#endif
