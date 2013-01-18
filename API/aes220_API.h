/******************************************************************************
File name: aes220API.h
===============================================================================
DESCRIPTION

Commands relevant to the programming of the aes220 assembly (fpga and micro-
controller)

===============================================================================
CHANGES

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

******************************************************************************/
#ifndef AES220_API_H
#define AES220_API_H

#include <stdlib.h>
#include <stdint.h>

/* Enumeration: aes220API_errorCode

   API error codes.

   aes220_API functions normally return 0 on success or one of the following code on failure.

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

// aes220Dev is an object defined in aes220Dev.h
struct aes220Dev;
typedef struct aes220Dev aes220_handle;

/* #ifdef __cplusplus */
extern "C" {
  /* #endif */

  /* Function: aes220_handle* aes220_Open_Device(int vid, int pid, int idx, int vbs)
     Returns a handle to an aes220 USB device. However it issimpler to use aes_Open (...) below.

     Parameters:

     vid: the USB vendor ID of the device (0x2443)

     pid: the USB device ID (0x00DC)

     idx: the device identification number (0 if only one such device on bus)

     vbs: level of verbosity used to write the log file (0 = none, 3 = error messages, 
     6 = mundane messages, 9 = everything)
  */
  aes220_handle* aes220_Open_Device(int vid, int pid, int idx, int vbs);

  /* Function: aes220_handle* aes220_Open(int vid, int pid, int idx, int vbs)
     Returns a handle to an aes220 USB device.

     Parameters:

     idx: the device identification number (0 if only one such device on bus)

     vbs: level of verbosity used to write the log file (0 = none, 3 = error messages, 
     6 = mundane messages, 9 = everything)
  */
  aes220_handle* aes220_Open(int idx, int vbs);

  /* Function: void aes220_Close_Device(aes220_handle *aes220_ptr)
     Closes the device pointed by the handle. Necessary before the handle goes out of scope or
     communication with the device will be broken.

     Parameters:

     aes220_ptr: the handle to the device to be closed
  */
  void aes220_Close_Device(aes220_handle *aes220_ptr);
  
  /* Function: void aes220_Close(aes220_handle *aes220_ptr)
     Closes the device pointed by the handle. Necessary before the handle goes out of scope or
     communication with the device will be broken. Same as aes220_Close_Device(...), introduced for name consistancy with aes_Open(...)

     Parameters:

     aes220_ptr: the handle to the device to be closed
  */
  void aes220_Close(aes220_handle *aes220_ptr);
  
  /* Function:  int aes220_Pipe_Out(aes220_handle *aes220_ptr, uint8_t *buf_ptr, uint16_t bufSize, uint8_t channelAddress)
     Transmits a buffer of data (bytes) over the USB link from the host (PC) to the device 
     (aes220).

     Parameters:

     aes220_ptr: a handle to the USB device

     buf_ptr: a pointer to a buffer of bytes.

     bufSize: the size of the afore mentioned buffer (max size is 64KB)

     channelAddress: the channel to communicate with in the FPGA application

     Returns:

     Returns 0 on success.
  */
  int aes220_Pipe_Out(aes220_handle *aes220_ptr, uint8_t *buf_ptr, uint32_t bufSize, 
		      uint8_t channelAddress);


  /* Function:  int aes220_Pipe_In(aes220_handle *aes220_ptr, uint8_t *buf_ptr, uint16_t bufSize, uint8_t channelAddress)
     Receives a buffer of data (bytes) over the USB link from the device (aes220) to the host (PC).

     Parameters:

     aes220_ptr: a handle to the USB device

     buf_ptr: a pointer to a buffer of bytes.

     bufSize: the size of the afore mentioned buffer (max size is 64KB)

     channelAddress: the channel to communicate with in the FPGA application

     Returns:

     Returns 0 on success.
  */
  int aes220_Pipe_In(aes220_handle* aes220_ptr, uint8_t *bts_ptr, uint32_t bufSize, 
		     uint8_t channelAddress);


  /* Function:  int aes220_Assert_Soft_Reset(aes220_handle *aes220_ptr)
     Send a reset signal to the FPGA. It is not a hard reset so the result depends on the code implememted in the FPGA.

     Note: The USB interface provided does take account of the Soft Reset signal.

     Parameters:

     aes220_ptr: a handle to the USB device

     Returns:

     Returns 0 on success.
  */
  int aes220_Assert_Soft_Reset(aes220_handle* aes220_ptr);


  /* Function:  int aes220_Clear_Soft_Reset(aes220_handle *aes220_ptr)
     Clears the reset signal to the FPGA. It is not a hard reset so the result depends on the code implememted in the FPGA. 

     Note: The USB interface provided does take account of the Soft Reset signal.

     Parameters:

     aes220_ptr: a handle to the USB device

     Returns:

     Returns 0 on success.
  */
  int aes220_Clear_Soft_Reset(aes220_handle* aes220_ptr);

  /* Function:  int aes220_Turn3V3On(aes220_handle *aes220_ptr)
     Turns ON the 3.3V power supply to the banks and FPGA I/Os

     Note: 3.3V is turned ON by default but can also be turned OFF using aes220_Turn3V3Off (see below)

     Parameters:

     aes220_ptr: a handle to the USB device

     Returns:

     Returns 0 on success.
  */
  int aes220_Turn3V3On(aes220_handle* aes220_ptr);

  /* Function:  int aes220_Turn3V3Off(aes220_handle *aes220_ptr)
     Turns ON the 3.3V power supply to the banks and FPGA I/Os

     Note: 3.3V is turned ON by default but it can be necessary to turn it OFF if using an external 3.3V supply (if more current is required than can be provided on-board) or if stacking up two or more boards together.

     Parameters:

     aes220_ptr: a handle to the USB device

     Returns:

     Returns 0 on success.
  */
  int aes220_Turn3V3Off(aes220_handle* aes220_ptr);

  /* Function:  int aes220_ReadI2C(aes220_handle *aes220_ptr, uint8_t deviceAddress, uint8_t *data, uint16_t dataLength)
     Reads data from an I2C device

     Parameters:

     aes220_ptr: a handle to the USB device

     deviceAddress: the address of the device on the I2C bus

     data: a data array (pointer to)

     dataLength: the length of the data (max length 64KB)

     Returns:

     Returns 0 on success.
  */
  int aes220_ReadI2C(aes220_handle* aes220_ptr, uint8_t deviceAddress, uint8_t *data,
		     uint16_t dataLength);

  /* Function:  int aes220_WriteI2C(aes220_handle *aes220_ptr, uint8_t deviceAddress, uint8_t *data, uint16_t dataLength)
     Writes data from an I2C device

     Parameters:

     aes220_ptr: a handle to the USB device

     deviceAddress: the address of the device on the I2C bus

     data: a data array (pointer to)

     dataLength: the length of the data (max length 64KB)

     Returns:

     Returns 0 on success.
  */
  int aes220_WriteI2C(aes220_handle* aes220_ptr, uint8_t deviceAddress, uint8_t *data,
		      uint16_t dataLength);

  /* Function:  int aes220_CombinedI2C(aes220_handle *aes220_ptr, uint8_t deviceAddress, uint8_t *dataToWrite, uint16_t dataToWriteLength, uint8_t *dataToRead, uint16_t dataToReadLength)
     Executes a write followed by a read of data to and from an I2C device without inserting a stop bit in between. 

     Parameters:

     aes220_ptr: a handle to the USB device

     deviceAddress: the address of the device on the I2C bus

     dataToWrite: a data array (pointer to)

     dataToWriteLength: the length of the data to write (max length 64KB)

     dataToRead: a data array (pointer to)

     dataToReadLength: the length of the data to write (max length 64KB)

     Returns:

     Returns 0 on success.
  */
  int aes220_CombinedI2C(aes220_handle* aes220_ptr, uint8_t deviceAddress,
			 uint8_t *dataToWrite, uint16_t dataToWriteLength,
			 uint8_t *dataToRead, uint16_t dataToReadLength);

  /* Function:  int aes220_Set_Board_Info(aes220_handle *aes220_ptr, const uint8_t *boardInfo)
     Sets the information relevant to the module such as Serial Number, Module Type (aes220a or b) and its revision number. This should be left alone unless the micro-controller EEPROM is erased and needs reprogramming.

     Parameters:

     aes220_ptr: a handle to the USB device

     boardInfo: an array of 8 unsigned char. Bytes: 3.3V ON/OFF(1), a/b, A, 1, SN, dd, mm, yyyy

     Note: Do not use this function to turn the 3.3V ON or OFF, use the aes220_Turn3V3ON/OFF functions

     Returns:

     Returns 0 on success.
  */
  int aes220_Set_Board_Info(aes220_handle* aes220_ptr, const uint8_t *boardInfo);

  /* Function:  int aes220_Get_Board_Info(aes220_handle *aes220_ptr, const uint8_t *boardInfo)
     Reads the information relevant to the module such as Serial Number, Module Type (aes220a or b) and its revision number as well as whether the 3.3V rail is on or off.

     Parameters:

     aes220_ptr: a handle to the USB device

     boardInfo: an array of 8 unsigned char. Bytes: 3.3V ON/OFF, a/b, A, 1, SN, dd, mm, yyyy

     Returns:

     Returns 0 on success.
  */
  int aes220_Get_Board_Info(aes220_handle* aes220_ptr, const uint8_t *boardInfo);

  /* Function:  int aes220_Get_Firmware_Info(aes220_handle *aes220_ptr, const uint8_t *firmwareInfo)
     Reads the software version written into the code.

     Parameters:

     aes220_ptr: a handle to the USB device

     boardInfo: an array of 3 unsigned char. Bytes: Major, Minor, and revision numbers e.g.: {1.4.0} 

     Returns:

     Returns 0 on success.
  */
  int aes220_Get_Firmware_Info(aes220_handle* aes220_ptr, uint8_t* firmwareInfo_ptr);

  /*************************************************************************************************
Development functions. Do not include in release version of library
  *************************************************************************************************/

  int aes220_Read_MC_Mode(aes220_handle* aes220_ptr, uint8_t *MC_Mode_ptr);
  int aes220_Read_MC_EEPROM(aes220_handle* aes220_ptr, uint16_t startAddress, const uint8_t *data, 
			    uint16_t length);
  int aes220_Send_MC_Cmd(aes220_handle* aes220_ptr, uint8_t cmd);
  int aes220_Write_BRAM(aes220_handle* aes220_ptr, unsigned short addr,
			unsigned char *bt_ptr, unsigned short bufSize);
  int aes220_Read_BRAM(aes220_handle* aes220_ptr, unsigned short addr,
		       unsigned char *bt_ptr, unsigned short bufSize);
  int aes220_Test_SDRAM(aes220_handle* aes220_ptr);

  /*************************************************************************************************
End of development functions.
  *************************************************************************************************/


  /* #ifdef __cplusplus */
} 
/* #endif */

#endif
