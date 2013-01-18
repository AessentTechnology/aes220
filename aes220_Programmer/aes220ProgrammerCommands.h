/******************************************************************************
File name: aes220ProgrammerCommands.h
===============================================================================
DESCRIPTION

Overlays commands for the aes220Programmer application.

===============================================================================
CHANGES


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
#ifndef AES220PROGRAMMER_COMMANDS_H
#define AES220PROGRAMMER_COMMANDS_H

#include <iostream>
#include <fstream>
#include "wx/wx.h"

#include "../API/include/aes220Dev.h"

#define VBS_LEVEL 9
//#define BOARD_INFO_LEN 8

using namespace std;

enum sConsoleErrorCode {
  BUTTON_ERROR = 1,
  F_CONF_ERROR,
  U_CONF_ERROR,
  F_PROG_ERROR,
  U_PROG_ERROR,
};

int progUCRam(int vid, int pid, int idx, const char *file);
int progUCEep(int vid, int pid, int idx, const char *file);
int rstUCEep(int vid, int pid, int idx);
int confFpga(int vid, int pid, int idx, const char *file);
int progFpga(int vid, int pid, int idx, const char *file);
int eraseFpga(int vid, int pid, int idx);
int getBoardInfo(int vid, int pid, int idx, const uint8_t *boardInfo);
int getFirmwareInfo(int vid, int pid, int idx, const uint8_t *firmwareInfo);

#endif
