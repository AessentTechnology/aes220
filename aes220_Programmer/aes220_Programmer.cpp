/***************************************************************************************************
File name: aes220_ProgrammerCmdLine.cpp
====================================================================================================
DESCRIPTION

Command line version of the aes220 Programmer (subsequently used by the GUI version)

====================================================================================================
CHANGES

V1.0.0: Original version
V1.4.2: No change
V1.4.3: Added missing --info implementation
V1.4.4: Added 3.3V rail ON/OFF switch. Modified for loop so more than one action can be carried out.

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
#include <aes220_API.h>

using namespace std;

#define NO_ACTION        0
#define BOARD_INFO       1
#define TOGGLE_3V3       2
#define PROG_MC_RAM      3
#define PROG_MC_EEPROM   4
#define CONF_FPGA        5
#define PROG_FPGA        6
#define ERASE_FPGA       7

#define P3V3_OFF 0
#define P3V3_ON  1

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
    " -3V3=ON/OFF           Turns the 3.3V rail ON or OFF. Board powers up with value previously\n"
    "                       set. Set to ON when out of factory.\n"
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

  string softwareVersion ("aes220 Programmer Command Line Version V1.4.4");
  cout << endl;
  cout << "************************************************************************************\n";
  cout << softwareVersion << endl;
  cout << "************************************************************************************\n";
  cout << endl;

  int rv = 99;
  int idx = 0;
  int vbs = 3;
  int action = NO_ACTION;
  uint8_t boardInfo[8];
  uint8_t firmwareInfo[3];
  string fileName;
  string p3v3;

  if (argc > 4) {cout << "Too many arguments!\n";printHelp(); return(1);}
  for(int i=1; i<argc; i++) {
    if(!strcmp(argv[i], "--help")) {printHelp(); return(0);}
    else if(!strcmp(argv[i], "--about")) {cout << softwareVersion << endl << endl; return(0);}
    else if(!strncmp(argv[i], "-id=", 4)) {idx = atoi(argv[i]+4); action = NO_ACTION;}
    else if(!strncmp(argv[i], "-vbs=", 5)) {vbs = atoi(argv[i]+5); action = NO_ACTION;}
    else if(!strcmp(argv[i], "--info")) {action = BOARD_INFO;}
    else if(!strncmp(argv[i], "-3V3=", 5)) {p3v3.assign(argv[i]+5); action = TOGGLE_3V3;}
    else if(!strncmp(argv[i], "-pr=", 4)) {fileName.assign(argv[i]+4); action = PROG_MC_RAM;}
    else if(!strncmp(argv[i], "-pe=", 4)) {fileName.assign(argv[i]+4); action = PROG_MC_EEPROM;}
    else if(!strncmp(argv[i], "-cf=", 4)) {fileName.assign(argv[i]+4); action = CONF_FPGA;}
    else if(!strncmp(argv[i], "-pf=", 4)) {fileName.assign(argv[i]+4); action = PROG_FPGA;}
    else if(!strcmp(argv[i], "--eflash")) {action = ERASE_FPGA;}
    else {cout << "Unrecognised option!\n"; printHelp(); return(1);}

    aes220_handle *aes220_ptr = aes220_Open(idx, vbs);

    switch (action) {

    case BOARD_INFO: {
      // Fetch the board information
      // Open the device and declare a handle pointing to it
      cout << "Requesting the board information" << endl;
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem. Error: " << rv << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      else {cout << "Done." << endl;}
      cout << "Requesting the firmware information" << endl;
      rv = aes220_Get_Firmware_Info(aes220_ptr, firmwareInfo);
      if (rv) {
	cout << "Encountered a problem. Error: " << rv << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      else {cout << "Done." << endl;}
      // Display the information received:
      cout << "Module......................: aes220" 
	   << boardInfo[1] << " Rev" << boardInfo[2] << '.' << (int)boardInfo[3] << endl;
      cout << "Module Serial Number........: " << setfill('0') << setw(3) << (int)boardInfo[4] 
	   << endl;
      cout << "Module Date Code............: " 
	   << setfill('0') << setw(2) << (int)boardInfo[5] << '/' 
	   << setfill('0') << setw(2) << (int)boardInfo[6] << '/' 
	   << "20" << (int)boardInfo[7] << endl;
      cout << "Firmware Revision...........: v" 
	   << (int)firmwareInfo[0] << '.' << (int)firmwareInfo[1] << '.' << (int)firmwareInfo[2] 
	   << endl; 
      if (boardInfo[0] == P3V3_ON) {cout << "3.3V rail...................: ON" << endl;}
      else if (boardInfo[0] == P3V3_OFF) {cout << "3.3V rail...................: OFF" << endl;}
      else {cout << "3.3V rail...................: STATUS UNKNOWN!" << endl;}
      break; }

    case TOGGLE_3V3: {
      // Turns the 3.3V power supply ON or OFF. Useful if stacking up boards or if providing an 
      // external 3.3V supply. When stacking up boards only one should provide the 3.3V to the 
      // others. If the power required exceeds the max power of the 3.3V on-board 3.3V regulator
      // (that is if the current drawn exceeds 1.5A) then the 3.3V needs to be turned OFF on all
      // boards and be provided by an external power supply.
      // aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      if (p3v3.compare("ON") == 0) {
	cout << "Turning the 3.3V rail ON." << endl;
	aes220_Turn3V3On(aes220_ptr);
	cout << "3.3V rail is now turned ON" << endl;
      }
      else if (p3v3.compare("OFF") == 0) {
	cout << "Turning the 3.3V rail OFF." << endl;
	aes220_Turn3V3Off(aes220_ptr);
	cout << "3.3V rail is now turned OFF" << endl;
      }
      else {
	cout << "Unrecognised option!\n";printHelp();
	aes220_Close(aes220_ptr);
	return(1);
      }
      break;
    }


    case PROG_MC_RAM: {
      // launch micro-controller RAM programming
      // Open the device and declare a handle pointing to it
      // aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      cout << "Programming the Micro-Controller RAM with: " << fileName << endl;
      rv = aes220_Program_MC_RAM(aes220_ptr, fileName.c_str());
      if (rv) {
	cout << "Encountered a problem. Error: " << rv << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      else {cout << "Done." << endl << endl;}
      break; 
    }

    case PROG_MC_EEPROM: {
      // launch micro-controller EEPROM programming
      // aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      cout << "Programming the Micro-Controller EEPROM with: " << fileName << endl;
      rv = aes220_Program_MC_EEPROM(aes220_ptr, fileName.c_str());
      if (rv) {
	cout << "Encountered a problem. Error: " << rv << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      else {cout << "Done." << endl << endl;}
      break; 
    }

    case CONF_FPGA: {
      // launch FPGA configuration
      // aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      cout << "Configuring the FPGA with: " << fileName << endl;
      rv = aes220_Configure_FPGA(aes220_ptr, fileName.c_str());
      if (rv) {
	cout << "Encountered a problem. Error: " << rv << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      else {cout << "Done." << endl << endl;}
      break; 
    }

    case PROG_FPGA: {
      // launch FPGA flash programming
      // aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      cout << "Programming the FPGA Flash with: " << fileName << endl;
      rv = aes220_Program_FPGA(aes220_ptr, fileName.c_str());
      if (rv) {
	cout << "Encountered a problem. Error: " << rv << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      else {cout << "Done." << endl;}
      break; 
    }

    case ERASE_FPGA: {
      // Erase FPGA flash
      // aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      cout << "Erasing the FPGA Flash " << endl;
      rv = aes220_Erase_FPGA(aes220_ptr);
      if (rv) {
	cout << "Encountered a problem. Error: " << rv << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      else {cout << "Done." << endl << endl;}
      break; 
    }

    case NO_ACTION: 
      break;

    default: 
      break; 
    }

    // Close the device when no longer required
    aes220_Close(aes220_ptr);
  }

#ifdef _WIN32
  char endChar;
  cout << "Enter a character to finish. ";
  cin >> endChar;
#endif

  return rv;
}

