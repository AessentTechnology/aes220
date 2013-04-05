/******************************************************************************
File name: aes220_CppAPI.h
===============================================================================
DESCRIPTION

Commands relevant to the programming of the aes220 assembly (fpga and micro-
controller)

===============================================================================
CHANGES

Post release:

Post V1.4.2: First release

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

#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#ifdef CLI_EXPORTS
#define APIEXPORT public ref class aes220_Dev
#define DLLEXPORT
#elif API_EXPORTS
#define APIEXPORT class aes220_Dev
#define DLLEXPORT __declspec(dllexport) 
#else 
#define APIEXPORT class aes220_Dev
#define DLLEXPORT
#endif 

class aes220Dev;

APIEXPORT
{

  /* Enumeration: aes220API_errorCode

     API error codes.

     aes220_C++API functions normally return 0 on success or one of the following code on failure.

     Enumerator:

     FILE_NOT_FOUND = 1 - File could not be found
     FILE_NOT_CREATED - File could not be opened
     DEVICE_NOT_OPENED - Cannot open device
     BULK_TX_ERROR - Bulk transfer transmit error
     BULK_RX_ERROR - Bulk transfer receive error
     UC_PROG_ERROR - Error while programming the micro-controller
     FPGA_CONF_ERROR - Error while configuring the FPGA
     FPGA_PROG_ERROR - Error while programming the FPGA Flash memory
     FPGA_UNKNOWN_STATE - FPGA is in an unknown state
     FLASH_ERROR - Error while writing or reading to the FPGA Flash memory
     FLASH_READY - FPGA Flash memory ready
     FLASH_NOT_READY - FPGA Flash memory busy
     EEPROM_ERROR - Error while communicating with the micro-controller EEPROM

  */

 public:
  DLLEXPORT aes220_Dev();
  DLLEXPORT ~aes220_Dev();

  /* Function: int Open(int idx, int vbs)

     Parameters:

     idx: the device identification number (0 if only one such device on bus)

     vbs: level of verbosity used to write the log file (0 = none, 3 = error messages, 
     6 = mundane messages, 9 = everything.

     Returns: 

     Returns 0 on success.
  */
  DLLEXPORT int Open(int idx, int vbs);


  /* Function: int Open(int vid, int pid, int idx, int vbs)
     Overloaded function allowing to open the device with a different vid/pid pair. 

     Parameters:

     vid: the USB vendor ID of the device (if different from default one)

     pid: the USB device ID (if different from default)

     idx: the device identification number (0 if only one such device on bus)

     vbs: level of verbosity used to write the log file (0 = none, 3 = error messages, 
     6 = mundane messages, 9 = everything)

     Returns: 

     Returns 0 on success.
  */
  DLLEXPORT int Open(int vid, int pid, int idx, int vbs);


  /* Function:  int Close()
     Closes the device.

     Parameters:

     None

     Returns: 

     Returns 0 on success.
  */
  DLLEXPORT int Close();
  

  /* Function:  int PipeOut(uint8_t *buf_ptr, uint32_t bufSize, uint8_t channelAddress)
     Transmits a buffer of data (bytes) over the USB link from the host (PC) to the device 
     (aes220).

     Parameters:

     buf_ptr: a pointer to a buffer of bytes.
   
     bufSize: the size of the afore mentioned buffer (max size is 4GiB)

     channelAddress: the channel to communicate with in the FPGA application

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int PipeOut(uint8_t *buf_ptr, uint32_t bufSize, uint8_t channelAddress);


  /* Function: int PipeIn(uint8_t *buf_ptr, uint32_t bufSize, uint8_t channelAddress)
     Receives a buffer of data (bytes) over the USB link from the device (aes220) to the host (PC).

     Parameters:

     buf_ptr: a pointer to a buffer of bytes.

     bufSize: the size of the afore mentioned buffer (max size is 4GiB)

     channelAddress: the channel to communicate with in the FPGA application

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int PipeIn(uint8_t *buf_ptr, uint32_t bufSize, uint8_t channelAddress);


  /* Function:  int AssertSoftReset()
     Send a reset signal to the FPGA. It is not a hard reset so the result depends on the code implememted in the FPGA.

     Note: The USB interface provided does take account of the Soft Reset signal.

     Parameters:

     None

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int AssertSoftReset();


  /* Function:  int ClearSoftReset()
     Clears the reset signal to the FPGA. It is not a hard reset so the result depends on the code implememted in the FPGA. 

     Note: The USB interface provided does take account of the Soft Reset signal.

     Parameters:

     None

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int ClearSoftReset();

  /* Function: int Turn3V3On()
     Turns ON the 3.3V power supply to the banks and FPGA I/Os

     Note: 3.3V is turned ON by default but can also be turned OFF using Turn3V3Off (see below)

     Parameters:

     None

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int Turn3V3On();

  /* Function: int Turn3V3Off()
     Turns ON the 3.3V power supply to the banks and FPGA I/Os

     Note: 3.3V is turned ON by default but it can be necessary to turn it OFF if using an external 3.3V supply (if more current is required than can be provided on-board) or if stacking up two or more boards together.

     Parameters:

     None

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int Turn3V3Off();

  /* Function:  int ReadI2C(uint8_t deviceAddress, uint8_t *data, uint16_t dataLength)
     Reads data from an I2C device

     Parameters:

     deviceAddress: the address of the device on the I2C bus

     data: a data array (pointer to)

     dataLength: the length of the data (max length 64KB)

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int ReadI2C(uint8_t deviceAddress, uint8_t *data,
	      uint16_t dataLength);

  /* Function:  int WriteI2C(uint8_t deviceAddress, uint8_t *data, uint16_t dataLength)
     Writes data from an I2C device

     Parameters:

     deviceAddress: the address of the device on the I2C bus

     data: a data array (pointer to)

     dataLength: the length of the data (max length 64KB)

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int WriteI2C(uint8_t deviceAddress, uint8_t *data,
	       uint16_t dataLength);

  /* Function:  int CombinedI2C(uint8_t deviceAddress, uint8_t *dataToWrite, uint16_t dataToWriteLength, uint8_t *dataToRead, uint16_t dataToReadLength)
     Executes a write followed by a read of data to and from an I2C device without inserting a stop bit in between. 

     Parameters:

     deviceAddress: the address of the device on the I2C bus

     dataToWrite: a data array (pointer to)

     dataToWriteLength: the length of the data to write (max length 64KB)

     dataToRead: a data array (pointer to)

     dataToReadLength: the length of the data to write (max length 64KB)

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int CombinedI2C(uint8_t deviceAddress,
		  uint8_t *dataToWrite, uint16_t dataToWriteLength,
		  uint8_t *dataToRead, uint16_t dataToReadLength);

  /* Function:  int SetBoardInfo(const uint8_t *boardInfo)
     Sets the information relevant to the module such as Serial Number, Module Type (aes220a or b) and its revision number. This should be left alone unless the micro-controller EEPROM is erased and needs reprogramming.

     Parameters:

     boardInfo: an array of 8 unsigned char. Bytes: 3.3V ON/OFF(1), a/b, A, 1, SN, dd, mm, yyyy

     Note: Do not use this function to turn the 3.3V ON or OFF, use the Turn3V3ON/OFF functions

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int SetBoardInfo(const uint8_t *boardInfo);

  /* Function:  int GetBoardInfo(const uint8_t *boardInfo)
     Reads the information relevant to the module such as Serial Number, Module Type (aes220a or b) and its revision number as well as whether the 3.3V rail is on or off.

     Parameters:

     boardInfo: an array of 8 unsigned char. Bytes: 3.3V ON/OFF, a/b, A, 1, SN, dd, mm, yyyy

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int GetBoardInfo(const uint8_t * boardInfo);

  /* Function:  int GetFirmwareInfo(const uint8_t *firmwareInfo)
     Reads the software version written into the code.

     Parameters:

     boardInfo: an array of 3 unsigned char. Bytes: Major, Minor, and revision numbers e.g.: {1.4.0} 

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int GetFirmwareInfo(uint8_t * firmwareInfo_ptr);

  /* Function:  int ProgramMCRAM(const uint8_t * file_ptr)
     Programs the micro-controller RAM with the given file.

     Parameters:

     file_ptr: pointer to the file to be downloaded in the micro-controller's RAM 

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int ProgramMCRAM(const char * file_ptr);

  /* Function:  int ProgramMCEEPROM(const uint8_t * file_ptr)
     Programs the micro-controller EEPROM with the given file.

     Parameters:

     file_ptr: pointer to the file to be downloaded in the micro-controller's EEPROM

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int ProgramMCEEPROM(const char * file_ptr);

  /* Function:  int ConfigureFPGA(const string fileName)
     Configure the FPGA with the given file.

     Parameters:

     file_ptr: pointer to the FPGA configuration file

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int ConfigureFPGA(const char * file_ptr);

  /* Function:  int ProgramFPGA(const char * file_ptr)
     Program the FPGA flas with the given file.

     Parameters:

     file_ptr: pointer to the FPGA configuration file

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int ProgramFPGA(const char * file_ptr);

  /* Function: int EraseFPGA()
     Erase the FPGA Flash (First page only to prevent the FPGA from booting up).

     Parameters:

     None

     Returns:

     Returns 0 on success.
  */
  DLLEXPORT int EraseFPGA();

 private:
  aes220Dev *aes220_ptr;

}; 

