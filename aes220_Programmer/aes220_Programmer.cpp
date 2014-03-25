/***************************************************************************************************
File name: aes220_Programmer.cpp
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
V1.6.1: Added ability to write board information

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
#define NEW_VID          1
#define NEW_PID		 2
#define BOARD_INFO       3
#define TOGGLE_3V3       4
#define PROG_MC_RAM      5
#define PROG_MC_EEPROM   6
#define CONF_FPGA        7
#define PROG_FPGA        8
#define ERASE_FPGA       9
#define SET_BSN         10
#define SET_BTP        11
#define SET_BRM         12
#define SET_BRm         13
#define SET_BDD         14
#define SET_BMM         15
#define SET_BYY         16

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
    " -vid=x                aes220 vendor id, default is 0x2443 and can be omitted\n"
    "                       Blank device vid is Cypress' 0x04b4\n"
    " -pid=x                aes220 product id, default is 0x00dc and can be omitted\n"
    "                       Blank device pid is FX2's 0x8613\n"
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
    " -pe=[filename].iic    Program the micro-controller EEPROM\n"
    " -cf=[filename].bin    Configure the FPGA\n"
    " -pf=[filename].bin    Program the FPGA flash\n"
    " --eflash              Erase the FPGA flash\n"
    "\n"
    "Aessent Technology aes220 Programmer copyright (c) 2013-2014\n"
    "\n";
}

int displayBoardInfo(aes220_handle *aes220_ptr);
int getHexNibble(char hexDigit, uint8_t *nibble);

int main(int argc, char *argv[]) {

  string softwareVersion ("aes220 Programmer Command Line Version V1.6.1");
  cout << endl;
  cout << "************************************************************************************\n";
  cout << softwareVersion << endl;
  cout << "************************************************************************************\n";
  cout << endl;

  int rv = 99;
  int vid = 0x2443;
  int pid = 0x00dc;
  char vid_c[4], pid_c[4];
  uint8_t vid_h[4], pid_h[4];
  uint16_t vid_16, pid_16;
  int idx = 0;
  int vbs = 3;
  int action = NO_ACTION;
  uint8_t boardInfo[8], newBoardInfo[8];
  string fileName;
  string p3v3;

  aes220_handle *aes220_ptr = NULL;

  //if (argc > 4) {cout << "Too many arguments!\n";printHelp(); return(1);}
  rv = 0;
  for(int i=1; i<argc; i++) {
    if(!strcmp(argv[i], "--help")) {printHelp(); return(0);}
    else if(!strcmp(argv[i], "--about")) {cout << softwareVersion << endl << endl; return(0);}
    else if(!strncmp(argv[i], "-vid=", 5)) {vid_c[3] = *(argv[i]+5); vid_c[2] = *(argv[i]+6);
      vid_c[1] = *(argv[i]+7); vid_c[0] = *(argv[i]+8);
      action = NEW_VID;}
    else if(!strncmp(argv[i], "-pid=", 5)) {pid_c[3] = *(argv[i]+5); pid_c[2] = *(argv[i]+6); 
      pid_c[1] = *(argv[i]+7); pid_c[0] = *(argv[i]+8);
      action = NEW_PID;}
    else if(!strncmp(argv[i], "-id=", 4))  {idx = atoi(argv[i]+4); action = NO_ACTION;}
    else if(!strncmp(argv[i], "-vbs=", 5)) {vbs = atoi(argv[i]+5); action = NO_ACTION;}
    else if(!strcmp(argv[i], "--info"))    {action = BOARD_INFO;}
    else if(!strncmp(argv[i], "-bt=", 4))  {newBoardInfo[1] = *(argv[i]+4);    action = SET_BTP;}
    else if(!strncmp(argv[i], "-bs=", 4))  {newBoardInfo[4] = atoi(argv[i]+4); action = SET_BSN;}
    else if(!strncmp(argv[i], "-brM=", 5)) {newBoardInfo[2] = *(argv[i]+5);    action = SET_BRM;}
    else if(!strncmp(argv[i], "-brm=", 5)) {newBoardInfo[3] = atoi(argv[i]+5); action = SET_BRm;}
    else if(!strncmp(argv[i], "-bd=", 4))  {newBoardInfo[5] = atoi(argv[i]+4); action = SET_BDD;}
    else if(!strncmp(argv[i], "-bm=", 4))  {newBoardInfo[6] = atoi(argv[i]+4); action = SET_BMM;}
    else if(!strncmp(argv[i], "-by=", 4))  {newBoardInfo[7] = atoi(argv[i]+4); action = SET_BYY;}
    else if(!strncmp(argv[i], "-3V3=", 5)) {p3v3.assign(argv[i]+5); action = TOGGLE_3V3;}
    else if(!strncmp(argv[i], "-pr=", 4))  {fileName.assign(argv[i]+4); action = PROG_MC_RAM;}
    else if(!strncmp(argv[i], "-pe=", 4))  {fileName.assign(argv[i]+4); action = PROG_MC_EEPROM;}
    else if(!strncmp(argv[i], "-cf=", 4))  {fileName.assign(argv[i]+4); action = CONF_FPGA;}
    else if(!strncmp(argv[i], "-pf=", 4))  {fileName.assign(argv[i]+4); action = PROG_FPGA;}
    else if(!strcmp(argv[i], "--eflash"))  {action = ERASE_FPGA;}
    else {cout << "Unrecognised option!\n"; printHelp(); return(1);}

    switch (action) {

    case NEW_VID: {
      for (int i = 0; i < 4; i++) {
	if ( getHexNibble(vid_c[i], &vid_h[i]) ) { 
	  cerr << "Error, not an hexadecimal digit!"; 
	  return 1;
	}
      }
      vid_16 = (vid_h[3]<< 12) | (vid_h[2] << 8) | (vid_h[1] << 4) | vid_h[0];
      vid = (int)vid_16;
      aes220_ptr = NULL;
      break;
    }

    case NEW_PID: {
      for (int i = 0; i < 4; i++) {
	if ( getHexNibble(pid_c[i], &pid_h[i]) ) { 
	  cerr << "Error, not an hexadecimal digit!"; 
	  return 1;
	}
      }
      pid_16 = (pid_h[3]<< 12) | (pid_h[2] << 8) | (pid_h[1] << 4) | pid_h[0];
      pid = (int)pid_16;
      aes220_ptr = NULL;
      break;
    }

    case BOARD_INFO: {
      // Display the information for the board queried
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
      // Display the information received:
      displayBoardInfo(aes220_ptr);
      break; }

    case SET_BTP: {
      // Sets the boards type (a or b for aes220a or aes220b)
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
      // First check type validity
      cout << "New board type desired = " << newBoardInfo[1] << endl;
      if ((newBoardInfo[1] != 'a') && 
	  (newBoardInfo[1] != 'A') &&
	  (newBoardInfo[1] != 'b') &&
	  (newBoardInfo[1] != 'B')) {
	cout << "Sorry board type not recognised." << endl;
	cout << "Board type should be: " << endl;
	cout << ".. 'a' if FPGA device is xc3s200an" << endl;
	cout << ".. 'b' if FPGA device is xc3s400an" << endl;
	return (1);
      }
      // Fetch the board information
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem while retrieving the board information. Error: " << rv 
	     << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
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
      cout << "New board information:" << endl << endl;
      displayBoardInfo(aes220_ptr);
      break; }

    case SET_BSN: {
      // Sets the board serial number (number on the PCB)
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem while retrieving the board information. Error: " << rv 
	     << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      // Display the information received:
      cout << "Module......................: aes220" 
	   << boardInfo[1] << " with serial number " << (int)boardInfo[4] 
	   << " to be changed to " << (int)newBoardInfo[4] << '.' << endl;
      boardInfo[4] = newBoardInfo[4];
      rv = aes220_Set_Board_Info(aes220_ptr, boardInfo);
      cout << "New board information:" << endl << endl;
      displayBoardInfo(aes220_ptr);
      break; }

    case SET_BRM: {
      // Sets the board Major revision letter (A)
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem while retrieving the board information. Error: " << rv 
	     << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      // Display the information received:
      cout << "Module Major revision letter : "  << boardInfo[2] 
	   << " to be changed to " << newBoardInfo[2] << '.' << endl;
      boardInfo[2] = newBoardInfo[2];
      rv = aes220_Set_Board_Info(aes220_ptr, boardInfo);
      cout << "New board information:" << endl << endl;
      displayBoardInfo(aes220_ptr);
      break; }

    case SET_BRm: {
      // Sets board minor revision number (1)
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem while retrieving the board information. Error: " << rv 
	     << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      // Display the information received:
      cout << "Module Minor revision number : "  << (int)boardInfo[3] 
	   << " to be changed to " << (int)newBoardInfo[3] << '.' << endl;
      boardInfo[3] = newBoardInfo[3];
      rv = aes220_Set_Board_Info(aes220_ptr, boardInfo);
      // Display the new board information:
      cout << "New board information:" << endl << endl;
      displayBoardInfo(aes220_ptr);
      break;
    }

    case SET_BDD: {
      // Sets the board date code (day)
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem while retrieving the board information. Error: " << rv 
	     << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      // Display the information received:
      cout << "Module date code day (dd): "  << (int)boardInfo[5]
	   << " to be changed to " << newBoardInfo[5] << '.' << endl;
      boardInfo[5] = newBoardInfo[5];
      rv = aes220_Set_Board_Info(aes220_ptr, boardInfo);
      // Display the new board information:
      cout << "New board information:" << endl << endl;
      displayBoardInfo(aes220_ptr);
      break;
    }

    case SET_BMM: {
      // Sets the board date code (month)
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem while retrieving the board information. Error: " << rv 
	     << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      // Display the information received:
      cout << "Module date code month (mm) : "  << (int)boardInfo[6]
	   << " to be changed to " << newBoardInfo[6] << '.' << endl;
      boardInfo[6] = newBoardInfo[6];
      rv = aes220_Set_Board_Info(aes220_ptr, boardInfo);
      // Display the new board information:
      cout << "New board information:" << endl << endl;
      displayBoardInfo(aes220_ptr);
      break; 
    }

    case SET_BYY: {
      // Sets the board date code (year)
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
      rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
      if (rv) {
	cout << "Encountered a problem while retrieving the board information. Error: " << rv 
	     << endl;
	aes220_Close(aes220_ptr);
	return rv;
      }
      // Display the information received:
      cout << "Module date code year (yy) : "  << (int)boardInfo[7]
	   << " to be changed to " << newBoardInfo[7] << '.' << endl;
      boardInfo[7] = newBoardInfo[7];
      rv = aes220_Set_Board_Info(aes220_ptr, boardInfo);
      // Display the new board information:
      cout << "New board information:" << endl << endl;
      displayBoardInfo(aes220_ptr);
      break;
    }

    case TOGGLE_3V3: {
      // Turns the 3.3V power supply ON or OFF. Useful if stacking up boards or if providing an 
      // external 3.3V supply. When stacking up boards only one should provide the 3.3V to the 
      // others. If the power required exceeds the max power of the 3.3V on-board 3.3V regulator
      // (that is if the current drawn exceeds 1.5A) then the 3.3V needs to be turned OFF on all
      // boards and be provided by an external power supply.
      // aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
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
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
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
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
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
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
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
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
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
      if (aes220_ptr == NULL) {	aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs); }
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
      //return (0);
      break;

    default: 
      break; 
    }

  }

  // Close the device when no longer required
  aes220_Close(aes220_ptr);

#ifdef _WIN32
  char endChar;
  cout << "Enter a character to finish. ";
  cin >> endChar;
#endif

  return rv;
}


int displayBoardInfo(aes220_handle *aes220_ptr)
{
  uint8_t boardInfo[8], firmwareInfo[3];
  int rv = 99;

  rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
  if (rv) {
    cout << "Encountered a problem. Error: " << rv << endl;
    aes220_Close(aes220_ptr);
    return rv;
  }

  rv = aes220_Get_Firmware_Info(aes220_ptr, firmwareInfo);
  if (rv) {
    cout << "Encountered a problem. Error: " << rv << endl;
    aes220_Close(aes220_ptr);
    return rv;
  }

  cout << "====================================================================================\n";
  cout << " Module information" << endl;
  cout << "====================================================================================\n";
  cout << " Module......................: aes220" 
       << boardInfo[1] << " Rev" << boardInfo[2] << '.' << (int)boardInfo[3] << endl;
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
  cout << "====================================================================================\n";
  cout << endl;
  return rv;
}

int getHexNibble(char hexDigit, uint8_t *nibble) {
  int rv = 99;
  if ( hexDigit >= '0' && hexDigit <= '9' ) { *nibble = (uint8_t)(hexDigit - '0'); rv=0; }
  else if ( hexDigit >= 'a' && hexDigit <= 'f' ) { *nibble = (uint8_t)(hexDigit - 'a' + 10); rv=0; }
  else if ( hexDigit >= 'A' && hexDigit <= 'F' ) { *nibble = (uint8_t)(hexDigit - 'A' + 10); rv=0; }
  else { cerr << "Error, not an Hexadecimal digit!" ; rv=1; }
  return rv;
}

