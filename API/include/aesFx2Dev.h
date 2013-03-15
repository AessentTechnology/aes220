/******************************************************************************
File name: aesfx2dev.h
===============================================================================
DESCRIPTION

USB utilities

===============================================================================
CHANGES
110306-01: making the procedures now a derived aesUsb class

Post release changes:

V1.4.0: First release
Post V1.4.2: Added stdint.h and removed unistd.h and sys/time.h

===============================================================================
NOTES


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

#ifndef AESFX2DEV_H
#define AESFX2DEV_H

#include <iostream>
#include <fstream>
#include <string>
#include <stdio.h>
#include <stdint.h>
#include <errno.h>
#include <string.h>
#include <assert.h>
#include <fcntl.h>

#include "aesUSB.h"

// Vendor commands bytes
#define VC_EPSTAT  0xB0
#define VC_EEPROM  0xB1
#define VC_I2C     0xB2
#define VC_FIFO_DEBUG 0xB7

#define EP2 0x02
#define EP4 0x04
#define EP6 0x86
#define EP8 0x88

#define MAX_EP0_DATA  64
#define MAX_EP2_DATA 512
#define MAX_EP4_DATA 512
#define MAX_EP6_DATA 512
#define MAX_EP8_DATA 512

// Micro-controller modes (FX2 specific)
#define WAIT_MODE       0xA1
#define PORT_MODE       0xA2
#define SLAVE_FIFO_MODE 0xA3
#define PIPE_IN_MODE    0xA4
#define PIPE_OUT_MODE   0xA5
#define PIPE_MODE       0xA6
#define READ_FIFO       0xA9

#define AESFX2_LOG   "aesFx2.log"

using namespace std;

class aesFx2Dev: public usbDev
{
 public:
  aesFx2Dev();
  aesFx2Dev(string lfn);
  aesFx2Dev(int init_vid, int init_pid, string lfn);
  aesFx2Dev(int inti_vid, int init_pid, int init_idx, string lfn);
  aesFx2Dev(int inti_vid, int init_pid, int init_idx, int init_vbs, string lfn);
  ~aesFx2Dev();

  enum errorCode {
    NO_HANDLE = 1,
    FILE_NOT_FOUND,
    EEPROM_ERROR,
  };
  enum i2cTransferFlags {
    SHORT_I2C_TRF = 0,
    START_I2C_TRF,
    MORE_I2C_TRF,
    LAST_I2C_TRF,
  };

  int testEEPROM(const unsigned char *testByteOut,
		 const unsigned char *testByteIn);

  int testEEPROM2(const unsigned char *testByteOut,
		  const unsigned char *testByteIn, size_t nbytes);

  // Configure the FX2 memory (RAM)
  int configureFX2(const char *path);
  // Program the FX2 memory (EEPROM)
  int programEEPROM(const char *file);
  // Put the Cypress FX2 into reset and release reset, respectively.
  // Return 0 on success.
  int reset();
  int run();
  // Read an intel hex file and download it.
  // Returns 0 on success; 1 on error. Errors written to stderr.
  int programIHexFile(const char *path);
  // Bulk transfer command, returns 0 on success.
  // dir is IN or OUT
  int bulkTransfer(unsigned char* buf, int size, unsigned char ep,
		   int timeout);
  // Writes a buffer to the device which address is specified on the I2C bus.
  int writeI2C(unsigned char devAddr,
	       unsigned char *data_ptr, int dataLen);
  // Reads data into a buffer from the device which address is specified on
  // the I2C bus.
  int readI2C(unsigned char devAddr,
	       unsigned char *data_ptr, int dataLen);
  // Writes a buffer to the device which address is specifiec on the I2C bus
  // and follows it by a read. No stop bit appended between the write and the
  // read. The ensuing frame is ----devAddr--writeData--devAddr--readData----
  int combinedI2C(unsigned char devAddr,
		  unsigned char *writeData_ptr, int writeDataLen,
		  unsigned char *readData_ptr, int readDataLen);
  int readEEPROM(size_t addr,const unsigned char *data,
		  size_t nbytes);
  int writeEEPROM1(size_t addr,const unsigned char *data,
		   size_t nbytes);
  int writeEEPROM2(uint16_t addr,const uint8_t *data,
		   int nbytes);

 private:

  // Force a certain "alt" interface; -1 for none.
  //int force_alt_interface;
  // Internally used: Program one line of an Intel HEX file.
  // The arguments path and line are just needed for error reporting.
  int programIHexLine(const char *buf,const char *path,int line);
  int programBinFile(const char *path,size_t start_addr);
  // Download/write a chunk of ram into the device.
  int writeRAM(size_t addr,const unsigned char *data,size_t nbytes);
  // Write file to EEPROM into the device.

};

#endif
