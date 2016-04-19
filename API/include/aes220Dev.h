/******************************************************************************
File name: aes220Dev.h
===============================================================================
DESCRIPTION

Commands relevant to the programming of the aes220 assembly (fpga and micro-
controller)

===============================================================================
CHANGES

101018-02: Bit swapping now happening on the PC rather than onboard the uC.
101018-03: Loading the bootloader firmware into the uC automatically.
           Removed fx2.h
101026-01: Adding fpga programming function
110207-01: Using Own library to communicate with fx2 chip
110209-01: Trying library on its own without sIDE
           Changing m_log messages to cout
           Removing link to wxWidgets for portability / scripting
110209-02: Updating the configureFpga function
110209-03: Adding all zeros buffer at end of transmission to tick the clock
           some more at the fpga end. (configureFpga), did not make a diff.
110210-01: Removing bit swapping for use with aes220 rev P2 onward.
110220-01: Adding flash status check function
110222-01: Modifying flash status function so that it does not open or close
           USB interface
110223-01: Adding EEPROM writing function

Post release:

V1.4.0: First release

===============================================================================
NOTES

Programming of the fpga uses Slave Parallel (SelectMap) Mode: M[2:0]= [1:1:0]

Xilinx SelectMap bus is byte swapped (D0 is the MSB, D7 the LSB) which is taken
care of by the programming function.

===============================================================================
PINOUT
           ___________________________________________________
          |                                                   |
          |  aes220                                           |
          |              ________________________             |
          |             |                       |             |
          | D7       <  | PA0               PB7 |  > VS1      |
          | D6       <  | PA1               PB6 |  > VS0      |
          | D5       <  | PA2               PB5 |  > M1       |
          | D4       <  | PA3               PB4 |  > RDWRB    |
          | D3       <  | PA4               PB3 |  > M0       |
          | D2       <  | PA5               PB2 |  > VS2      |
          | D1       <  | PA6               PB1 |  > M2       |
          | DO          | PA7               PB0 |  > CSOB     |
          |             |                       |             |
          | PROGB    <  | PD0      	            |             |
          | DONE      > | PD1                   |             |
          | CSIB     <  | PD2                   |             |
          | DOUT      > | PD3                   |             |
          | AWAKE    <  | PD4                   |             |
          | INITB     > | PD5                   |             |
       	  | CCLK     <  | PD6                   |             |
      	  | SUSPEND  <  | PD7            FX2    |             |
      	  |           	|_______________________|             |
          |                                                   |
          |___________________________________________________|

===============================================================================

Continuous SelectMap data loading:
           __     ___________________________________
PROGB PD0:   \___/
           ____     _________________________________
INITB PD5:     \___/
           ________                               ___
RDWRB PB4:         \_____________________________/
           __________                           _____
CSIB  PD2:           \_________________________/
             _   _   _   _   _   _   _   _   _   _
CCLK  PD6 \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/
                       __  __  __  __  __
D[0:7]:   XXXXXXXXXXXX<__><__><__><__><__>XXXXXXXXXXX
                                             ________
DONE  PD1:__________________________________/

              ^ pull PROGB low to reset the fpga (M[2:0] sampled at this point)
                   ^ monitor INITB going low and back up high
                       ^ provide data (one byte per clock)

===============================================================================

Copyrights (C) 2011-2013 Aessent Technology Ltd

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

******************************************************************************/
#ifndef AES220DEV_H
#define AES220DEV_H

#include <iostream>
#include <fstream>
#include <stdint.h>

#include <aesFx2Dev.h>
#include <aes220a_progFpga_ent.h>
#include <aes220b_progFpga_ent.h>

// Vendor commands bytes
#define VC_UC_MODE    0xC1
#define VC_UC_CMD     0xC2
#define VC_UPP_CMD    0xC3
#define VC_FLASHCMD   0xC4
#define VC_SOFT_INFO  0xC5
// For manufacturing test, to be removed from here and do not include in release version
#define VC_WR_BRAM    0xD0
#define VC_RD_BRAM    0xD1
#define VC_TST_SDRAM  0xD2

// USB transfer constants
#define PAGE_SIZE               264
#define TIME_OUT               5000
#define TIME_OUT_RETRY            5
#define MAX_FRAME_PAYLOAD     65535
#define MAX_PORT_MODE_PAYLOAD   512

// Micro-controller mode (aes220 specific)
// Configuration/Programming commands
#define CONF_F_MODE  0xA7
#define PROG_F_MODE  0xA8

#define START_CONFIG_BYTE  0xAA
#define PROG_DONE          0xAB
#define PROG_ERROR         0xAC
#define F_READY            0xAD
#define F_BUSY             0xAE
#define RESET_F            0xAF
#define INIT_B_LOW         0XB0
#define INIT_B_HIGH        0XB1
#define DONE_LOW           0xB2
#define F_NOT_READY        0xB3

// Memory transaction commmands
#define STATUS_CHECK       0x60
#define WRITE_CMD          0X61
#define READ_CMD           0x62

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

// Spi Flash commands (dictated by SPI_ACCESS)
// Reading commmands
#define FAST_READ    0x0B
#define RND_READ     0x03
#define PGTBUF1      0x53
#define PGTBUF2      0x55
#define BUF1RD       0xD4
#define BUF2RD       0xD6
// Writing commands
#define PAGE_ERASE   0x81
#define PPTB1        0x82
#define PPTB2        0x85
#define BUF1WR       0x84
#define BUF2WR       0x87
#define BUF1TOPGWE   0x83
#define BUF1TOPGWOE  0x88
#define BUF2TOPGWE   0x86
#define BUF2TOPGWOE  0x89

// Other SPI Flash commands
#define BUF1         0x01
#define BUF2         0x02

// PSU commands
#define BKLDOEN      0x10

// User Programmable pins
#define UPP_PIN_DIR        0x00
#define UPP_PIN_VAL        0x01

// Board information
#define BOARD_INFO_ADDR 0x3DF8
#define BOARD_INFO_LEN  8
#define P3V3_OFF 0
#define P3V3_ON  1

#define AES220_LOG "aes220.log"

using namespace std;

class aes220Dev: private aesFx2Dev
{
 public:
  aes220Dev();
  aes220Dev(int init_vid, int init_pid);
  aes220Dev(int init_vid, int init_pid, int init_idx);
  aes220Dev(int init_vid, int init_pid, int init_idx, int init_vbs);
  ~aes220Dev();

  /* Enumeration: aes220Dev_errorCode

  aes220 error codes.

  aes220Dev functions normally return 0 on success or one of the following code on failure.

  Enumerator:

  FILE_NOT_FOUND     =  1 - File could not be found
  FILE_NOT_CREATED   =  2 - File could not be opened
  DEVICE_NOT_OPENED  =  3 - Cannot open device
  BULK_TX_ERROR      =  4 - Bulk transfer transmit error	
  BULK_RX_ERROR      =  5 - Bulk transfer receive error				      
  UC_PROG_ERROR      =  6 - Error while programming the micro-controller	      
  FPGA_CONF_ERROR    =  7 - Error while configuring the FPGA			      
  FPGA_PROG_ERROR    =  8 - Error while programming the FPGA Flash memory	      
  FPGA_UNKNOWN_STATE =  9 - FPGA is in an unknown state				      
  FLASH_ERROR        = 10 - Error while writing or reading to the FPGA Flash memory   
  FLASH_READY        = 11 - FPGA Flash memory ready				      
  FLASH_NOT_READY    = 12 - FPGA Flash memory busy				      
  EEPROM_ERROR       = 13 - Error while communicating with the micro-controller EEPROM
  	                    
  */
  enum aes220Dev_errorCode {
    FILE_NOT_FOUND = 1,
    FILE_NOT_CREATED,
    DEVICE_NOT_OPENED,
    BULK_TX_ERROR,
    BULK_RX_ERROR,
    UC_PROG_ERROR,
    FPGA_CONF_ERROR,
    FPGA_PROG_ERROR,
    FPGA_UNKNOWN_STATE,
    FLASH_ERROR,
    FLASH_READY,
    FLASH_NOT_READY,
    EEPROM_ERROR,
    RUN_ERROR,
    VND_COMM_ERROR,
  };

  void set_Device_USB_Parameters(int vid, int pid, int idx, int vbs);
  void get_Device_USB_Parameters(int values[4]);
  int open_Device(int vid, int pid, int idx);
  int close_Device();

  int program_MC_RAM(const char *uFile);
  /* Function:   int program_MC_RAM(const char *uFile)
     Programs the micro-controller's RAM

     Parameters:

     uFile: the file containing the ihx (Intel Hexa-decimal) image of the program to be downloaded
     in RAM

     Returns:

     Returns 0 on success.

     Note:

     it is not the same file format as the one being downloaded into the EEPROM (.iic file)
  */

  int program_MC_EEPROM(const char *uFile);
  /* Function:   int program_MC_EEPROM(const char *uFile)
     Programs the micro-controller EEPROM

     Parameters:

     uFile: the file containing the icc image of the program to be stored in EEPROM and automatically
     downloaded in RAM at boot up.

     Returns:

     Returns 0 on success.

     Note:

     it is not the same file format as the one being downloaded into the RAM itself (.ihx file)
  */

  int configure_FPGA(string fFile);
  /* Function:  int configure_FPGA(const char *fFile)
     Configures the FPGA with the given file.

     Parameters:

     fFile: the binary file (.bin) containing the FPGA configuration image.

     Returns:

     Returns 0 on success.

     Note:

     An FPGA configuration file is the actual FPGA "program".
     The FPGA will lose its configuration if power cycled. For programming the FPGA in a more
     permanent manners see program_FPGA function
  */

  int program_FPGA(const string fFile);
  /* Function:  int program_FPGA(const char *fFile)
     Programs the FPGA Flash memory with the given file and re-boot from it.

     Parameters:

     fFile: the binary file (.bin) containing the FPGA configuration image.
     model: the module model (i.e character a or b for aes220a and aes220b respectively).

     Returns:

     Returns 0 on success.

     Note:

     An FPGA configuration file is the actual FPGA "program" it is the same file as for the
     configure_FPGA function.
     program_FPGA however writes the program into the FPGA onboard Flash memory. The FPGA will
     subsequently boot from the flash (under the control of the micro-controller).
  */

  int erase_FPGA_Flash_Page(uint8_t * pgAddress, uint16_t nbOfPages);
  /* Function: int erase_FPGA_Flash_Page()
     Erases the addressed page in the FPGA Flash memory as well as the following ones indicated by the number of pages.

     Parameters:

     pgAddress: an array of two bytes containing the page address of the first page to be erased
     nbOfPages: a word containing the number of pages to be deleted after the addressed page.

     Returns:

     Returns 0 on success.
  */

  int erase_FPGA_Flash();
  /* Function: int erase_FPGA_Flash()
     Erases the configuration file present in the FPGA Flash memory.

     Parameters:

     None

     Returns:

     Returns 0 on success.

     Note:

     Actually only erases the first page of the memory which is enough to prevent the configuration
     file being run.
  */

  int test_FX2_EEPROM(const unsigned char *testByteOut,
		      const unsigned char *testByteIn, size_t nBytes);
  int read_FX2_EEPROM(uint16_t addr,
		      const unsigned char *data, uint16_t nBytes);

  int send_Byte(unsigned char *bts_ptr);
  int receive_Byte(unsigned char *btr_ptr);
  int pipe_Out(uint8_t *buf_ptr, uint32_t bufSize, uint8_t channelAddress);
  /* Function:  int pipe_Out(uint8_t *buf_ptr, uint16_t bufSize, uint8_t channelAddress)
     Transmits a buffer of data (bytes) over the USB link from the host (PC) to the device
     (aes220).

     Parameters:

     buf_ptr: a pointer to a buffer of bytes.
     bufSize: the size of the afore mentioned buffer (max size is 64KB)
     channelAddress: the channel to communicate with in the FPGA application

     Returns:

     Returns 0 on success.
  */

  int pipe_In(uint8_t *bts_ptr, uint32_t bufSize, uint8_t channelAddress);
  /* Function:  int pipe_In(uint8_t *buf_ptr, uint16_t bufSize)
     Receivess a buffer of data (bytes) over the USB link from the device (aes220) to the host (PC).

     Parameters:

     buf_ptr: a pointer to a buffer of bytes.
     bufSize: the size of the afore mentioned buffer (max size is 64KB)
     channelAddress: the channel to communicate with in the FPGA application

     Returns:

     Returns 0 on success.
  */

  int read_MC_EEPROM(uint16_t startAddress, const uint8_t *data, uint16_t length);
  int readI2C(uint8_t deviceAddress, uint8_t *data, uint16_t dataLength);
  int writeI2C(uint8_t deviceAddress, uint8_t *data, uint16_t dataLength);
  int combinedI2C(uint8_t deviceAddress,
		  uint8_t *dataToWrite, uint16_t dataToWriteLength,
		  uint8_t *dataToRead, uint16_t dataToReadLength);
  int turn3p3vOn();
  int turn3p3vOff();

  int set_Board_Info(const uint8_t *boardInfo);
  int get_Board_Info(const uint8_t *boardInfo);
  int get_Firmware_Info(const uint8_t* firmwareInfo_ptr);
 
  int set_UPP(uint8_t pinsDir);
  int write_UPP(uint8_t pinsVal);
  int send_Cmd(uint8_t cmd);

  // Public for test purposes, move to private afterwards
  int force_Read_FIFO();
  int set_MC_Mode(uint8_t *uCMode);
  int read_MC_Mode(uint8_t *uCMode);
  int read_FIFO_Regs(uint8_t *regs_ptr);
  int send_FPGA_Flash_Command(uint8_t cmdByte, uint8_t byte2, uint8_t byte3, 
			      uint8_t byte4, uint8_t * data, uint16_t dataSize);

  int write_FPGA_Flash_Page(unsigned char *pgContents, unsigned char *pgAddress);
  int write_FPGA_Flash_PageII(uint8_t buffer, uint8_t *pgAddress, uint8_t *pgContents);
  int read_FPGA_Page(unsigned char *pgContents, unsigned char *pgAddress);
  int set_FPGA_Flash_Programming_Mode();
  // For manufacturing test, to be removed from here and do not include in release version
  int writeBlockRAM(unsigned short addr, unsigned char *bts_ptr, 
		    unsigned short bufSize);
  int readBlockRAM(unsigned short addr, unsigned char *btr_ptr,
		   unsigned short bufSize);
  int testSDRAM();


 private:

  int wait_For_Flash();
  int flash_Ready();
  int read_FPGA_Flash_Status(unsigned char *flashStatus);
  uint8_t check_FPGA_Status();
  int configure_FPGA_from_array(const uint8_t *progArray, uint32_t arraySize);
};
#endif
