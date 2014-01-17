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
V1.6.0: No changes other than the version number to decouple it from the libaes220 version number.

====================================================================================================
NOTES



====================================================================================================
Copyright (C) 2013 Sebastien Saury, Aessent Technology Ltd

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
#define SET_BSN          8
#define SET_BTYP         9
#define SET_BRM         10
#define SET_BRm         11
#define SET_BD          12
#define SET_BM          13
#define SET_BY          14

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
    " -bt=[a/b]             Set the board type, revision, serial number and date code\n"
    " -bs=[SN]              Set the board serial number\n"
    " -brM=[A]              Set the board major revision number\n"
    " -brm=[1]              Set the board minor revision number\n"
    " -bd=[dd]              Set the board date code day\n"
    " -bm=[mm]              Set the board date code month\n"
    " -by=[yy]              Set the board date code year\n"
    " -3V3=ON/OFF           Turns the 3.3V rail ON or OFF. Board powers up with value previously\n"
    "                       set. Set to ON when out of factory.\n"
    " -pr=[filename].ihx    Program the micro-controller RAM\n"
    " -pe=[filename].ihx    Program the micro-controller EEPROM\n"
    " -cf=[filename].bin    Configure the FPGA\n"
    " -pf=[filename].bin    Program the FPGA flash\n"
    " --eflash              Erase the FPGA flash\n"
    "\n"
    "Aessent Technology aes220 Programmer copyright (c) 2013-2014\n"
    "\n";
}

int main(int argc, char *argv[]) {

  string softwareVersion ("aes220 Programmer Command Line Version V1.6.1");
  cout << endl;
  cout << "************************************************************************************\n";
  cout << softwareVersion << endl;
  cout << "************************************************************************************\n";
  cout << endl;

  int rv = 99;
  int idx = 0;
  int vbs = 3;
  int action = NO_ACTION;
  uint8_t boardInfo[8], newBoardInfo[8];
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
    else if(!strncmp(argv[i], "-bT=", 4)) {newBoardInfo[1] = atoi(argv[i]+4); action = SET_BTYP;}
    else if(!strncmp(argv[i], "-bs=", 4)) {newBoardInfo[4] = atoi(argv[i]+4); action = SET_BSN;}
    else if(!strncmp(argv[i], "-brM=", 5)) {newBoardInfo[2] = atoi(argv[i]+5); action = SET_BRM;}
    else if(!strncmp(argv[i], "-brm=", 5)) {newBoardInfo[3] = atoi(argv[i]+5); action = SET_BRm;}
    else if(!strncmp(argv[i], "-bd=", 4)) {newBoardInfo[5] = atoi(argv[i]+4); action = SET_BD;}
    else if(!strncmp(argv[i], "-bm=", 4)) {newBoardInfo[6] = atoi(argv[i]+4); action = SET_BM;}
    else if(!strncmp(argv[i], "-by=", 4)) {newBoardInfo[7] = atoi(argv[i]+4); action = SET_BY;}
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

    case SET_BTYP: {
      // First check type validity
      if newBoarInfo[1] != ('a' or 'A' or 'b' or 'B'){
	cout << "Sorry board type not recognised." << endl;
	cout << "Board type should be 'a' if FPGA device is xc3s200an" << endl;
	cout << "or 'b' if FPGA device is xc3s400an" << endl;
	exit 1;
      }
      // Fetch the board information
      // Open the device and declare a handle pointing to it
      cout << "Requesting the board information" << endl;
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem while retrieving the board information. Error: " << rv 
	     << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      else {cout << "Done." << endl;}
      // Display the information received:
      cout << "Module......................: aes220" 
	   << boardInfo[1] << " to be changed to aes220" << newBoardInfo[1] << '.' << endl;
      if (boardInfo[1] == (('a' or 'A' or 'b' or 'B')) and (boardInfo[1] != newBoardInfo[1])) {
        cout << "Warning about to change board type from " << (int)boardInfo[1] << " to " 
	     << newBoardInfo[1] << endl;
      }
      boardInfo[1] = newBoardInfo[1];
      rv = aes220_Set_Board_Info(aes220_ptr, boardInfo);
      // Display the new board information:
      cout << endl;
      cout << "===========================================================================" << endl;
      cout << " New module information" << endl;
      cout << "===========================================================================" << endl;
      cout << " Module......................: aes220" 
	   << boardInfo[1] << " to be changed to aes220" << newBoardInfo[1] << '.' << endl;
      cout << " Module Serial Number........: " << setfill('0') << setw(3) << (int)boardInfo[4] 
	   << endl;
      cout << " Module Date Code............: " 
	   << setfill('0') << setw(2) << (int)boardInfo[5] << '/' 
	   << setfill('0') << setw(2) << (int)boardInfo[6] << '/' 
	   << "20" << (int)boardInfo[7] << endl;
      cout << " Firmware Revision...........: v" 
	   << (int)firmwareInfo[0] << '.' << (int)firmwareInfo[1] << '.' << (int)firmwareInfo[2] 
	   << endl; 
      if (boardInfo[0] == P3V3_ON) {cout << " 3.3V rail...................: ON" << endl;}
      else if (boardInfo[0] == P3V3_OFF) {cout << " 3.3V rail...................: OFF" << endl;}
      else {cout << " 3.3V rail...................: STATUS UNKNOWN!" << endl;}
      cout << "===========================================================================" << endl;
      cout << endl;
      break; }

    case SET_B: {
      // Fetch the board information
      // Open the device and declare a handle pointing to it
      cout << "Requesting the board information" << endl;
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem while retrieving the board information. Error: " << rv 
	     << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      else {cout << "Done." << endl;}
      // Display the information received:
      cout << "Module......................: aes220" 
	   << boardInfo[1] << " to be changed to aes220" << newBoardInfo[1] << '.' << endl;
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

