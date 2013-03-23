/******************************************************************************
File name: aes220_C++API.cpp
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

#include <aes220_C++API.h>
#include <aes220Dev.h>

#define AES220_VID 0x2443
#define AES220_PID 0x00dc

aes220_Dev::aes220_Dev() {
  aes220_ptr = new aes220Dev();
}
aes220_Dev::~aes220_Dev() {
  delete aes220_ptr;
}

int aes220_Dev::Open(int idx, int vbs) { 
  int rv = 99;
  aes220_ptr->set_Device_USB_Parameters(AES220_VID, AES220_PID, idx, vbs);
  rv = aes220_ptr->open_Device(AES220_VID, AES220_PID, idx); 
  return rv;
} 

int aes220_Dev::Open(int vid, int pid, int idx, int vbs) { 
  int rv = 99;
  aes220_ptr->set_Device_USB_Parameters(vid, pid, idx, vbs);
  rv = aes220_ptr->open_Device(vid, pid, idx); 
  return rv;
} 

int aes220_Dev::Close() { 
  int rv = 99;
  rv = aes220_ptr->close_Device();
  return rv;
} 

int aes220_Dev::PipeOut(uint8_t *buf_ptr, uint32_t bufSize, uint8_t channelAddress) {
  int rv = 99;
  rv = aes220_ptr->pipe_Out(buf_ptr, bufSize, channelAddress);
  return rv;
}

int aes220_Dev::PipeIn(uint8_t *buf_ptr, uint32_t bufSize, uint8_t channelAddress) {
  int rv = 99;
  rv = aes220_ptr->pipe_In(buf_ptr, bufSize, channelAddress);
  return rv;
}

int aes220_Dev::AssertSoftReset()
{
  int rv = 99;
  rv = aes220_ptr->send_Cmd(ASSERT_SOFT_RESET);
  return rv;
}

int aes220_Dev::ClearSoftReset()
{
  int rv = 99;
  rv =aes220_ptr->send_Cmd(CLEAR_SOFT_RESET);
  return rv;
}

int aes220_Dev::ReadI2C(uint8_t deviceAddress, uint8_t *data, uint16_t dataLength)
{
  int rv = 99;
  rv = aes220_ptr->readI2C(deviceAddress, data, dataLength);
  return rv;
}

int aes220_Dev::WriteI2C(uint8_t deviceAddress, uint8_t *data, uint16_t dataLength)
{
  int rv = 99;
  rv = aes220_ptr->writeI2C(deviceAddress, data, dataLength);
  return rv;
}

int aes220_Dev::CombinedI2C(uint8_t deviceAddress,
			    uint8_t *dataToWrite, uint16_t dataToWriteLength,
			    uint8_t *dataToRead, uint16_t dataToReadLength)
{
  int rv = 99;
  rv = aes220_ptr->combinedI2C(deviceAddress,
			       dataToWrite, dataToWriteLength,
			       dataToRead, dataToReadLength);
  return rv;
}

int aes220_Dev::Turn3V3On()
{
  int rv = 99;
  rv = aes220_ptr->turn3p3vOn();
  return rv;
}

int aes220_Dev::Turn3V3Off()
{
  int rv = 99;
  rv = aes220_ptr->turn3p3vOff();
  return rv;
}

int aes220_Dev::SetBoardInfo(const uint8_t *boardInfo)
{
  int rv = 99;
  rv = aes220_ptr->set_Board_Info(boardInfo);
  return rv;
}

int aes220_Dev::GetBoardInfo(const uint8_t * boardInfo)
{
  int rv = 99;
  rv = aes220_ptr->get_Board_Info(boardInfo);
  return rv;
}

int aes220_Dev::GetFirmwareInfo(uint8_t * firmwareInfo_ptr)
{
  int rv = 99;
  rv = aes220_ptr->get_Firmware_Info(firmwareInfo_ptr);
  return rv;
}

int aes220_Dev::ProgramMCRAM(const char * file_ptr)
{
  int rv = 99;
  rv = aes220_ptr->program_MC_RAM(file_ptr);
  return rv;
}

int aes220_Dev::ProgramMCEEPROM(const char * file_ptr)
{
  int rv = 99;
  rv = aes220_ptr->program_MC_EEPROM(file_ptr);
  return rv;
}

int aes220_Dev::ConfigureFPGA(const char * file_ptr)
{
  int rv = 99;
  rv = aes220_ptr->configure_FPGA(file_ptr);
  return rv;
}

int aes220_Dev::ProgramFPGA(const char * file_ptr)
{
  int rv = 99;
  rv = aes220_ptr->program_FPGA(file_ptr);
  return rv;
}
 
int aes220_Dev::EraseFPGA()
{
  int rv = 99;
  rv = aes220_ptr->erase_FPGA_Flash();
  return rv;
}

