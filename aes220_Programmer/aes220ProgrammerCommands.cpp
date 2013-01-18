/******************************************************************************
File name: aes220ProgrammerCommands.cpp
===============================================================================
DESCRIPTION

Overlays commands for the aes220Programmer application.

===============================================================================
CHANGES

See aesProgrammer.cpp

===============================================================================
NOTES


===============================================================================
PINOUT


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

#include "aes220ProgrammerCommands.h"

// progUCRam
/*****************************************************************************/
// Programs the micro-controller's RAM
int progUCRam(int vid, int pid, int idx, const char *file)
{
  int rv = 99;
  int vbs = VBS_LEVEL; // verbosity level
  aes220Dev aes220(vid, pid, idx, vbs);
  rv = aes220.program_MC_RAM(file);
  return rv;
}

// progUCEep
/*****************************************************************************/
// Programs the micro-controller's EEPROM
int progUCEep(int vid, int pid, int idx, const char *file)
{
  int rv;
  int vbs = VBS_LEVEL; // verbosity level
  aes220Dev aes220(vid, pid, idx, vbs);
  rv = aes220.program_MC_EEPROM(file);
  return rv;
}

// rstUCEep
/*****************************************************************************/
// Resets the uC EEPROM
int rstUCEep(int vid, int pid, int idx)
{
  int rv = 99;
  int vbs = VBS_LEVEL; // verbosity level
  const char* rstFile = "../utils/reset/reset.ihx";
  aes220Dev aes220(vid, pid, idx, vbs);
  rv = aes220.program_MC_RAM(rstFile);
  return rv;
}

// confFpga
/*****************************************************************************/
// Configures the FPGA
int confFpga(int vid, int pid, int idx, const char *file)
{
  int rv;
  int vbs = VBS_LEVEL; // verbosity level
  aes220Dev aes220(vid, pid, idx, vbs);
  rv = aes220.configure_FPGA(file);
  return rv;
}

// progFpga
/*****************************************************************************/
// Programs the FPGA flash
int progFpga(int vid, int pid, int idx, const char *file)
{
  int rv =99;
  int vbs = VBS_LEVEL; // verbosity level
  aes220Dev aes220(vid, pid, idx, vbs);
  // uint8_t boardInfo[8];
  // uint8_t model = 'z';
  // aes220.get_Board_Info(boardInfo);
  // model = boardInfo[1];
  // rv = aes220.program_FPGA(file, model);
  rv = aes220.program_FPGA(file);
  if (rv != 0) return F_PROG_ERROR;
  return rv;
}

// eraseFpga
/*****************************************************************************/
// Erases the FPGA flash (first page only)
int eraseFpga(int vid, int pid, int idx)
{
  int rv = 99;
  int vbs = VBS_LEVEL; // verbosity level
  aes220Dev aes220(vid, pid, idx, vbs);
  rv = aes220.erase_FPGA();
  if (rv != 0) return F_PROG_ERROR;
  return rv;
}

// getBoardInfo
/*****************************************************************************/
// Gets the board serial number
int getBoardInfo(int vid, int pid, int idx, const uint8_t *boardInfo)
{
  int rv = 99;
  int vbs = VBS_LEVEL; // verbosity level
  aes220Dev aes220(vid, pid, idx, vbs);
  rv = aes220.get_Board_Info(boardInfo);
  return rv;
}

// getFirmwareInfo
/*****************************************************************************/
// Gets the board serial number
int getFirmwareInfo(int vid, int pid, int idx, const uint8_t *firmwareInfo)
{
  int rv = 99;
  int vbs = VBS_LEVEL; // verbosity level
  aes220Dev aes220(vid, pid, idx, vbs);
  rv = aes220.get_Firmware_Info(firmwareInfo);
  return rv;
}


