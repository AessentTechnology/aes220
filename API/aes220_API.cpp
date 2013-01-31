/******************************************************************************
File name: aes220API.cpp
===============================================================================
DESCRIPTION

Commands relevant to the programming of the aes220 assembly (fpga and micro-
controller)

===============================================================================
CHANGES

V1.4.0: First release

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

#include "aes220_API.h"
#include "./include/aes220Dev.h"

#define AES220_VID 0x2443
#define AES220_PID 0x00DC

#ifdef _WIN32
 #define DLLEXPORT extern "C" __declspec(dllexport)
#else
 #define DLLEXPORT extern "C"
#endif

DLLEXPORT aes220_handle*  aes220_Open_Device(int vid, int pid, int idx, int vbs)
{
  aes220_handle*  aes220_ptr = new aes220Dev;
  if (aes220_ptr != NULL) {
    aes220_ptr->set_Device_USB_Parameters(vid, pid, idx, vbs);
    aes220_ptr->open_Device(vid, pid, idx);
  }
  return aes220_ptr;
}

DLLEXPORT void aes220_Close_Device(aes220_handle* aes220_ptr)
{
  delete aes220_ptr;
  aes220_ptr = NULL;
}

DLLEXPORT aes220_handle*  aes220_Open(int idx, int vbs)
{
  aes220_handle*  aes220_ptr = new aes220Dev;
  if (aes220_ptr != NULL) {
    aes220_ptr->set_Device_USB_Parameters(AES220_VID, AES220_PID, idx, vbs);
    aes220_ptr->open_Device(AES220_VID, AES220_PID, idx);
  }
  return aes220_ptr;
}

DLLEXPORT void aes220_Close(aes220_handle* aes220_ptr)
{
  delete aes220_ptr;
  aes220_ptr = NULL;
}

DLLEXPORT int aes220_Pipe_Out(aes220_handle* aes220_ptr, uint8_t *buf_ptr, uint32_t bufSize,
			      uint8_t channelAddress)
{
  int rv = 99;
  rv = aes220_ptr->pipe_Out(buf_ptr, bufSize, channelAddress);
  return rv;
}

DLLEXPORT int aes220_Pipe_In(aes220_handle* aes220_ptr, uint8_t *buf_ptr, uint32_t bufSize,
			     uint8_t channelAddress)
{
  int rv = 99;
  rv = aes220_ptr->pipe_In(buf_ptr, bufSize, channelAddress);
  return rv;
}

DLLEXPORT int aes220_Assert_Soft_Reset(aes220_handle* aes220_ptr)
{
  int rv = 99;
  rv = aes220_ptr->send_Cmd(ASSERT_SOFT_RESET);
  return rv;
}

DLLEXPORT int aes220_Clear_Soft_Reset(aes220_handle* aes220_ptr)
{
  int rv = 99;
  rv = aes220_ptr->send_Cmd(CLEAR_SOFT_RESET);
  return rv;
}

DLLEXPORT int aes220_ReadI2C(aes220_handle* aes220_ptr, uint8_t deviceAddress, uint8_t *data, 
			     uint16_t dataLength)
{
  int rv = 99;
  rv = aes220_ptr->readI2C(deviceAddress, data, dataLength);
  return rv;
}

DLLEXPORT int aes220_WriteI2C(aes220_handle* aes220_ptr, uint8_t deviceAddress, uint8_t *data, 
			      uint16_t dataLength)
{
  int rv = 99;
  rv = aes220_ptr->writeI2C(deviceAddress, data, dataLength);
  return rv;
}

DLLEXPORT int aes220_CombinedI2C(aes220_handle* aes220_ptr, uint8_t deviceAddress,
				 uint8_t *dataToWrite, uint16_t dataToWriteLength,
				 uint8_t *dataToRead, uint16_t dataToReadLength)
{
  int rv = 99;
  rv = aes220_ptr->combinedI2C(deviceAddress,
			       dataToWrite, dataToWriteLength,
			       dataToRead, dataToReadLength);
  return rv;
}

DLLEXPORT int aes220_Turn3V3On(aes220_handle* aes220_ptr)
{
  int rv = 99;
  rv = aes220_ptr->turn3p3vOn();
  return rv;
}

DLLEXPORT int aes220_Turn3V3Off(aes220_handle* aes220_ptr)
{
  int rv = 99;
  rv = aes220_ptr->turn3p3vOff();
  return rv;
}

DLLEXPORT int aes220_Set_Board_Info(aes220_handle* aes220_ptr, const uint8_t *boardInfo)
{
  int rv = 99;
  rv = aes220_ptr->set_Board_Info(boardInfo);
  return rv;
}

DLLEXPORT int aes220_Get_Board_Info(aes220_handle* aes220_ptr, const uint8_t * boardInfo)
{
  int rv = 99;
  rv = aes220_ptr->get_Board_Info(boardInfo);
  return rv;
}

DLLEXPORT int aes220_Get_Firmware_Info(aes220_handle* aes220_ptr, uint8_t * firmwareInfo_ptr)
{
  int rv = 99;
  rv = aes220_ptr->get_Firmware_Info(firmwareInfo_ptr);
  return rv;
}

DLLEXPORT int aes220_Program_MC_RAM(aes220_handle* aes220_ptr, const char * file_ptr)
{
  int rv = 99;
  rv = aes220_ptr->program_MC_RAM(file_ptr);
  return rv;
}

DLLEXPORT int aes220_Program_MC_EEPROM(aes220_handle* aes220_ptr, const char * file_ptr)
{
  int rv = 99;
  rv = aes220_ptr->program_MC_EEPROM(file_ptr);
  return rv;
}

DLLEXPORT int aes220_Configure_FPGA(aes220_handle* aes220_ptr, const char * file_ptr)
{
  int rv = 99;
  rv = aes220_ptr->configure_FPGA(file_ptr);
  return rv;
}

DLLEXPORT int aes220_Program_FPGA(aes220_handle* aes220_ptr, const char * file_ptr)
{
  int rv = 99;
  rv = aes220_ptr->program_FPGA(file_ptr);
  return rv;
}

DLLEXPORT int aes220_Erase_FPGA(aes220_handle* aes220_ptr)
{
  int rv = 99;
  rv = aes220_ptr->erase_FPGA_Flash();
  return rv;
}

/*************************************************************************************************
Development functions. Do not include in release version of library
*************************************************************************************************/

DLLEXPORT int aes220_Read_MC_Mode(aes220_handle* aes220_ptr, uint8_t *MC_Mode_ptr)
{
  int rv = 99;
  rv = aes220_ptr->read_MC_Mode(MC_Mode_ptr);
  return rv;
}

DLLEXPORT int aes220_Read_MC_EEPROM(aes220_handle* aes220_ptr, uint16_t startAddress, 
					  const uint8_t *data, uint16_t length)
{
  int rv = 99;
  rv = aes220_ptr->read_MC_EEPROM(startAddress, data, length);
  return rv;
}

DLLEXPORT int aes220_Send_MC_Cmd(aes220_handle* aes220_ptr, uint8_t cmd)
{
  int rv = 99;
  rv = aes220_ptr->send_Cmd(cmd);
  return rv;
}

DLLEXPORT int aes220_Write_BRAM(aes220_handle* aes220_ptr, unsigned short addr, 
				unsigned char *bt_ptr, unsigned short bufSize)
{
  int rv = 99;
  rv = aes220_ptr->writeBlockRAM(addr, bt_ptr, bufSize);
  return rv;
}

DLLEXPORT int aes220_Read_BRAM(aes220_handle* aes220_ptr, unsigned short addr, 
			       unsigned char *bt_ptr, unsigned short bufSize)
{
  int rv = 99;
  rv = aes220_ptr->readBlockRAM(addr, bt_ptr, bufSize);
  return rv;
}

DLLEXPORT int aes220_Test_SDRAM(aes220_handle* aes220_ptr)
{
  int rv = 99;
  rv = aes220_ptr->testSDRAM();
  return rv;
}

/*************************************************************************************************
End of development functions.
*************************************************************************************************/
