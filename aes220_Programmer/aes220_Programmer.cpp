/***************************************************************************************************
File name: aes220_ProgrammerCmdLine.cpp
====================================================================================================
DESCRIPTION

Command line version of the aes220 Programmer (subsequently used by the GUI version)

====================================================================================================
CHANGES

V1.0.0: Original version
V1.4.2: No change

====================================================================================================
NOTES



====================================================================================================
Aessent Technology copyright (c) 2013

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

***************************************************************************************************/

#include <iostream>
#include <iomanip>
#include <string.h>  // for strcmp
#include <stdlib.h>  // for atoi
#include "../API/aes220_API.h"

using namespace std;

#define PROG_MC_RAM      1
#define PROG_MC_EEPROM   2
#define CONF_FPGA        3
#define PROG_FPGA        4
#define ERASE_FPGA       5

static void printHelp()
{
  cout <<
    "\n"
    "Usage: aes220_Programmer [-id=0] [-pr=myFirmware.ihx] [-vbs=3]\n"
    "Options:\n"
    " --help                Print this and then exit\n"
    " --about               Print aes220 Programmer information and then exit\n"
    " -id=x                 aes220 id, default is 0 and can be omitted if there is\n"
    "                       only one module, increment by one with each newly plugged in module\n"
    "                       In doubt use --info to find out which module refers to which id\n"
    " -vbs=x                Log verbosity, 0 minimum, 9 maximum\n"
    " --info                Displays the module info pertaining to the id provided\n"
    " -pr=[filename].ihx    Program the micro-controller RAM\n"
    " -pe=[filename].ihx    Program the micro-controller EEPROM\n"
    " -cf=[filename].bin    Configure the FPGA\n"
    " -pf=[filename].bin    Program the FPGA flash\n"
    " --eflash              Erase the FPGA flash\n"
    "\n"
    "Aessent Technology aes220 Programmer copyright (c) 2013\n"
    "\n";
}

int main(int argc, char *argv[]) {

  string softwareVersion ("aes220 Programmer Command Line Version V1.4.2");
  cout << endl;
  cout << "************************************************************************************\n";
  cout << softwareVersion << endl;
  cout << "************************************************************************************\n";
  cout << endl;

  int rv = 99;
  int idx = 0;
  int vbs = 6;
  int action = 0;
  string fileName;

  if (argc > 4) {cout << "Too many arguments!\n";printHelp(); return(1);}
  for(int i=1; i<argc; i++) {
    if(!strcmp(argv[i],"--help")) {printHelp(); return(0);}
    else if(!strcmp(argv[i],"--about")) { cout << softwareVersion << endl; return(0); }
    else if(!strncmp(argv[i],"-id=",4)) {idx = atoi(argv[i]+4);}
    else if(!strncmp(argv[i],"-vbs=",5)) {vbs = atoi(argv[i]+5);}
    else if(!strncmp(argv[i],"-pr=",4)) {
      fileName.assign(argv[i]+4);
      action = PROG_MC_RAM;
    }
    else if(!strncmp(argv[i],"-pe=",4)) {
      fileName.assign(argv[i]+4);
      action = PROG_MC_EEPROM;
    }
    else if(!strncmp(argv[i],"-cf=",4)) {
      fileName.assign(argv[i]+4);
      action = CONF_FPGA;
    }
    else if(!strncmp(argv[i],"-pf=",4)) {
      fileName.assign(argv[i]+4);
      action = PROG_FPGA;
    }
    else if(!strcmp(argv[i],"--eflash")) { 
      action = ERASE_FPGA;
    }
    else {{cout << "Unrecognised option!\n";printHelp(); return(1);}
    }
  }

    switch (action) {
    case PROG_MC_RAM: {
      // launch micro-controller RAM programming
      // Open the device and declare a handle pointing to it
      aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      rv = aes220_Program_MC_RAM(aes220_ptr, fileName.c_str());
      // Close the device when no longer required
      aes220_Close(aes220_ptr);
      break; }
    case PROG_MC_EEPROM: {
      // launch micro-controller EEPROM programming
      aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      rv = aes220_Program_MC_EEPROM(aes220_ptr, fileName.c_str());
      // Close the device when no longer required
      aes220_Close(aes220_ptr);
      break; }
    case CONF_FPGA: {
      // launch FPGA configuration
      aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      rv = aes220_Configure_FPGA(aes220_ptr, fileName.c_str());
      // Close the device when no longer required
      aes220_Close(aes220_ptr);
      break; }
    case PROG_FPGA: {
      // launch FPGA flash programming
      aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      rv = aes220_Program_FPGA(aes220_ptr, fileName.c_str());
      // Close the device when no longer required
      aes220_Close(aes220_ptr);
      break; }
    case ERASE_FPGA: {
      // Erase FPGA flash
      aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      rv = aes220_Erase_FPGA(aes220_ptr);
      // Close the device when no longer required
      aes220_Close(aes220_ptr);
      break; }
    default:
      break;
    }

#ifdef _WIN32
  char endChar;
  cout << "Enter a character to finish. ";
  cin >> endChar;
#endif

  return rv;
}

