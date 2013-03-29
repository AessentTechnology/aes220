/******************************************************************************
File name: aes220Dev.cpp
===============================================================================
DESCRIPTION

Commands relevant to the programming of the aes220 assembly (fpga and micro-
controller)

===============================================================================
CHANGES

Pre release
101018-02: Bit swapping now happening on the PC rather than onboard the uC.
101018-03: Loading the bootloader firmware into the uC automatically.
           Removed fx2.h
101026-01: Adding fpga programming function
101028-01: Changing some text
110201-01: Changing communication software with fx2 from fx2load to cycfx2prog
110207-01: Using own library for communicating with fx2
110209-01: Trying library on its own without sIDE
           Changing m_log messages to cout
           Removing link to wxWidgets for portability / scripting
110209-02: Updating the configure_FPGA function
110209-03: Adding all zeros buffer at end of transmission to tick the clock
           some more at the fpga end. (configure_FPGA)
110210-01: Removing bit swapping for use with aes220 rev P2 onward.
110211-01: Updating programFpga function
           Adding function for simple Console
110220-01: Adding function to check flash status, read and write flash
110222-01: Modifying flash status function so that it does not open or close
           USB interface
110223-01: Adding EEPROM writing function
110306-01: Using class inheritance

Post release
1.4.0: First release
Post 1.4.0: Change log function, now a separate class, added automatic recognition
            of board model (aes220a or b) when selecting SPI programming binary for
            configuring the FPGA prior to communicating with its flash
Post 1.4.2: Changed variable length array declaration of 
            unsigned char dataOut[transferSize]; to
            unsigned char *dataOut = new unsigned char[transferSize];

===============================================================================
NOTES

Programming of the fpga uses Slave Parallel (SelectMap) Mode: M[2:0]= [1:1:0]
Xilinx SelectMap bus is byte swapped (D0 is the MSB, D7 the LSB)

===============================================================================
PINOUT
           ___________________________________________________
          |                                                   |
          |                  aes101                           |
          |                                                   |
          |_______       _______________________       _______|
          |       |     |                       |     |       |
   CCLK < | FD8   |  <  | PD0               PB7 |  >  | FD7   | > D7
  INITB > | FD9   |  <  | PD1               PB6 |  >  | FD6   | > D6
   CSIB < | FD10  |  <  | PD2               PB5 |  >  | FD5   | > D5
     M2 < | FD11  |  <  | PD3               PB4 |  >  | FD4   | > D4
     M0 < | FD12  |  <  | PD4               PB3 |  >  | FD3   | > D3
  PROGB < | FD13  |  <  | PD5               PB2 |  >  | FD2   | > D2
          | FD14  |  <  | PD6               PB1 |  >  | FD1   | > D1
          | FD15  |     |                   PB0 |  >  | FD0   | > D0
          | CLKOUT|  <  | CLKOUT          IFCLK |  >  | IFCLK |
          | SLOE  |     |                       |     | SCL   |
          | SLRD  |     |                       |     | SDA   |
          | SLWR  |     |                       |     | FLAGA |
          | FLAGD |     |                       |     | FLAGB |
          | PKTEND|     |                       |     | FLAGC |
          | FFAD1 |     |       FX2             |     | FFAD0 |
          |_______|     |_______________________|     |_______|
          |                                                   |
          |___________________________________________________|

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


#include "../include/aes220Dev.h"

aes220Dev::aes220Dev():aesFx2Dev(AES220_LOG) {}

aes220Dev::aes220Dev(int init_vid, int init_pid):aesFx2Dev(init_vid, init_pid, AES220_LOG) {}

aes220Dev::aes220Dev(int init_vid, int init_pid, int init_idx):
  aesFx2Dev(init_vid, init_pid, init_idx, AES220_LOG) {}

aes220Dev::aes220Dev(int init_vid, int init_pid, int init_idx, int init_vbs):
  aesFx2Dev(init_vid, init_pid, init_idx, init_vbs, AES220_LOG) {}

aes220Dev::~aes220Dev() {closeDev();}

// set_Device_USB_Parameters
/*****************************************************************************/
// Sets the device vid, pid, idx and vbs parameters
void aes220Dev::set_Device_USB_Parameters(int vid, int pid, int idx, int vbs)
{
	set_vid(vid);
	set_pid(pid);
	set_idx(idx);
	set_vbs(vbs);
}

// get_Device_USB_Parameters
/*****************************************************************************/
// Gets the device vid, pid, idx and vbs parameters
void aes220Dev::get_Device_USB_Parameters(int values[4])
{
	values[0] = get_vid();
	values[1] = get_pid();
	values[2] = get_idx();
	values[3] = get_vbs();
}

// open_Device
/*****************************************************************************/
// Opens the device with vid, pid, idx and vbs parameters
int aes220Dev::open_Device(int vid, int pid, int idx)
{
	int rv = 99;
	rv = openDev(vid, pid, idx);
	return rv;
}

// close_Device
/*****************************************************************************/
// Closes the device currently open
int aes220Dev::close_Device()
{
	int rv = 99;
	rv = closeDev();
	return rv;
}

// programMC_RAM
/*****************************************************************************/
// Programs the uC RAM
int aes220Dev::program_MC_RAM(const char *uFile)
{
  int rv = 99;
  log.add("Programming the micro-controller RAM", NOTE_VBS);
  rv = configureFX2(uFile);
  if (rv ==0) {
    log.add("Micro-controller RAM successfully programmed!", NOTE_VBS);
  }
  return rv;
}

// programMC_EEPROM
/*****************************************************************************/
// Programs the uC EEPROM
int aes220Dev::program_MC_EEPROM(const char *uFile)
{
  int rv = 99;
  log.add("Programming the micro-controller EEPROM", NOTE_VBS);
  rv = programEEPROM(uFile);
  if (rv ==0) {
    log.add("Micro-controller EEPROM succesfully programmed!", NOTE_VBS);
    rv = reset();
    rv = run();
    if (rv) { return RUN_ERROR; };
  }
  else {
    log.add("Failed to program micro-controller EEPROM, returned value = ", rv, ERROR_VBS);
  }
  return rv;
}

// readMC_EEPROM
/*****************************************************************************/
// Reads the uC EEPROM
int aes220Dev::read_MC_EEPROM(uint16_t startAddress, const uint8_t *data, uint16_t length)
{
  int rv = 99;
  log.add("Reading the micro-controller EEPROM", NOTE_VBS);
  rv = readEEPROM(startAddress, data, length);
  if (rv ==0) {
    log.add("Micro-controller EEPROM succesfully read!", NOTE_VBS);
    rv = reset();
    rv = run();
    if (rv) { return RUN_ERROR; };
  }
  else {
    log.add("Failed to read micro-controller EEPROM, returned value = ", rv, ERROR_VBS);
  }
  return rv;
}

// testEeprom
/*****************************************************************************/
// tests the EEPROM
int aes220Dev::test_FX2_EEPROM(const unsigned char *testByteOut,
			     const unsigned char *testByteIn, size_t nBytes)
{
  int rv = 99;
  rv = testEEPROM2(testByteOut, testByteIn, nBytes);
  if (rv ==0) {
    cout << "eeprom succesfully programmed!" << endl;
    msleep(2000);
    return rv;
  }
  else {
    log.add("Failed writing to EEPROM, rv = ", rv, ERROR_VBS);
  }
  return rv;
}

// readEeprom
/*****************************************************************************/
// Reads the EEPROM
int aes220Dev::read_FX2_EEPROM(uint16_t addr,
			     const unsigned char *data, uint16_t nBytes)
{
  int rv = 99;
  rv = readEEPROM(addr, data, nBytes);
  if (rv != 0) {
    log.add("Failed reading EEPROM contents, rv = ", rv, ERROR_VBS);
  }
  return rv;
}

// set_Board_Info
/*****************************************************************************/
// writes board information to the EEPROM
int aes220Dev::set_Board_Info(const uint8_t *boardInfo)
{
  int rv = 99;
  rv = writeEEPROM1(BOARD_INFO_ADDR, boardInfo, BOARD_INFO_LEN);
  if (rv != 0) {
    log.add("Failed to set board info rv = ", rv, ERROR_VBS);
  }
  return rv;
}

// get_Board_Info
/*****************************************************************************/
// reads the board serial number from the EEPROM
int aes220Dev::get_Board_Info(const uint8_t *boardInfo)
{
  int rv = 99;
  rv = readEEPROM(BOARD_INFO_ADDR, boardInfo, BOARD_INFO_LEN);
  if (rv != 0) {
    log.add("Failed to get board info rv = ", rv, ERROR_VBS);
  }
  return rv;
}

// configure_FPGA
/******************************************************************************
Downloads the configuration file into the fpga volatile memory. Does not
program the fpga SPI flash.

Using Slave Parallel (SelectMap) Mode: M[2:0]= [1:1:0]

Xilinx SelectMap bus is byte swapped (D0 is the MSB, D7 the LSB)
Swapping now happening here rather than onboard the uC

===============================================================================
PINOUT
           ___________________________________________________
          |                                                   |
          |  aes220                                           |
          |              ________________________             |
          |             |                       |             |
          | D7       <  | PA0               PB7 |  > VS1      |
          | D6       <  | PA1               PB6 |  > VS0      |
          | D5       <  | PA2               PB5 |  > M1       |
          | D4       <  | PA3               PB4 |  > RDWRB    |
          | D3       <  | PA4               PB3 |  > M0       |
          | D2       <  | PA5               PB2 |  > VS2      |
          | D1       <  | PA6               PB1 |  > M2       |
          | DO          | PA7               PB0 |  > CSOB     |
          |             |                       |             |
          | PROGB    <  | PD0      	        |             |
          | DONE      > | PD1                   |             |
          | CSIB     <  | PD2                   |             |
          | DOUT      > | PD3                   |             |
          | AWAKE    <  | PD4                   |             |
          | INITB     > | PD5                   |             |
	  | CCLK     <  | PD6                   |             |
	  | SUSPEND  <  | PD7            FX2    |             |
	  |         	|_______________________|             |
          |                                                   |
          |___________________________________________________|

===============================================================================

Continuous SelectMap data loading:
           __     ___________________________________
PROGB PD0:   \___/
           ____     _________________________________
INITB PD5:     \___/
           ________                               ___
RDWRB PB4:         \_____________________________/
           __________                           _____
CSIB  PD2:           \_________________________/
             _   _   _   _   _   _   _   _   _   _
CCLK  PD6 \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/
                       __  __  __  __  __
D[0:7]:   XXXXXXXXXXXX<__><__><__><__><__>XXXXXXXXXXX
                                             ________
DONE  PD1:__________________________________/

              ^ pull PROGB low to reset the fpga (M[2:0] sampled at this point)
                   ^ monitor INITB going low and back up high
                       ^ provide data (one byte per clock)

===============================================================================

******************************************************************************/
//int aes220Dev::configure_FPGA(const char *fFile) {
int aes220Dev::configure_FPGA(const string fFile) {

  int rv = 99;

  log.add("Starting FPGA configuration process with file: ", fFile, NOTE_VBS);

  // Open file for reading, this is the binary version of the bitstream file
  //  ifstream  binFile(fFile, ios::binary);
  ifstream  binFile(fFile.c_str(), ios::binary);
  if (binFile == 0) {
    log.add("Error! Input file not found", ERROR_VBS);
    return FILE_NOT_FOUND;
  }
  else {log.add("Found input file.", NOISE_VBS);}
  // File used when verifying the data sent back from the fpga
  log.add("Creating check file", NOISE_VBS);
  ofstream checkFile ("CheckFile.bin", ios::binary);
  if (checkFile == 0) {
    log.add("Error! Output file not created", ERROR_VBS);
    return FILE_NOT_CREATED;
  }
  else {log.add("Check file created.", NOISE_VBS);}

  // Go to end of bitstream file to get the file size
  binFile.seekg(0, ios::end);
  uint32_t fileSize = binFile.tellg();
  // Don't forget to come back to the beginning of the file!
  binFile.seekg(0, ios::beg);

  // Send start of configuration byte and file size using Vendor Command
  uint8_t startConfigByte = CONF_F_MODE;
  uint8_t allZeroBufSize = 64;
  uint32_t transferSize = fileSize + allZeroBufSize;
  uint16_t index = (uint16_t)transferSize;
  uint16_t value = (uint16_t)(transferSize >> 16);
  uint16_t bs = 1;

  log.add("Sending start byte...", NOTE_VBS);
  rv = do_usb_command(EP0_WRITE, VC_UC_MODE, value, index, &startConfigByte, bs, TIME_OUT);
  if (rv != bs) {
    log.add("Vendor command failure at start config. Error: ", rv, ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {log.add("...sent", NOTE_VBS);}


  // Start sending the configuration file through the USB interface
  unsigned char *dataOut = new unsigned char[transferSize];

  log.add("Sending configuration file to FPGA... ", NOTE_VBS);

  // Read data from the binary file taking into account the lenght of the
  // file
  binFile.read(reinterpret_cast<char*>(dataOut), fileSize);
  if (!binFile.good()) {
    log.add("File reading problem before end of file reached.", ERROR_VBS);
  }

  // add zeros to the end of the file to help the FPGA start
  for (int i = 0; i < allZeroBufSize; i++) {
    dataOut[fileSize + i] = 0x00;
  }


  // send the whole thing out via the USB interface
  log.add("Sending data out...", NOISE_VBS);
  rv = bulkTransfer(dataOut, transferSize, EP2, TIME_OUT);
  if (rv) {
    log.add("Bulk transfer error when sending data out: ", rv, ERROR_VBS);
    return BULK_TX_ERROR;
  }
  log.add("...sent", NOISE_VBS);
  log.add("Data transfer done.", NOTE_VBS);

  rv = check_FPGA_Status();
  if (rv == 0) {
    log.add("FPGA status OK, setting micro-controller to port mode", NOTE_VBS);
    uint8_t MC_Mode = PORT_MODE;
    set_MC_Mode(&MC_Mode);
  }

  // Close the various files
  binFile.close();
  checkFile.close();
  return rv;
}


// program_Fpga
/*****************************************************************************/
// Programs the fpga spi flash
//int aes220Dev::program_FPGA(const char *fFile)
int aes220Dev::program_FPGA(const string fFile)
{

  int rv = 99;
  int nbPageRetry = 0;
  unsigned char ctrlByte;
  unsigned char *ctrlByte_ptr = &ctrlByte;
  unsigned char flashAddress[3] = {0x00, 0x00, 0x00}; // MSB, middle byte, LSB


  // First configure the FPGA with the flash SPI interface
  const string aes220a_fpgaSpiFile = "aes220a_progFpga_ent.bin";
  const string aes220b_fpgaSpiFile = "aes220b_progFpga_ent.bin";
  string fpgaSpiFile;
  uint8_t orgMC_Mode;
  uint8_t *orgMC_Mode_ptr = &orgMC_Mode;
  uint8_t MC_Mode;
  uint8_t *MC_Mode_ptr = &MC_Mode;
  // Record the mode the micro-controller is in
  read_MC_Mode(orgMC_Mode_ptr);
  // Change the mode to port mode
  MC_Mode = PORT_MODE;
  set_MC_Mode(MC_Mode_ptr);
  // Configure the FPGA to write to the Flash with the file that relates to the module model
  uint8_t boardInfo[8];
  uint8_t model = 'z';
  get_Board_Info(boardInfo);
  model = boardInfo[1];
  switch(model) {
  case 'a' | 'A':
    log.add("Configuring FPGA with aes220a progFpga file", NOTE_VBS);
    fpgaSpiFile.assign(aes220a_fpgaSpiFile);
    break;
  case 'b' | 'B':
    log.add("Configuring FPGA with aes220b progFpga file", NOTE_VBS);
    fpgaSpiFile.assign(aes220b_fpgaSpiFile);
    break;
  default:
    break;
  }
  rv = configure_FPGA(fpgaSpiFile);
  if (rv != 0) return FPGA_CONF_ERROR;


  // Writes to the application log
  log.add("Starting FPGA programming process", NOTE_VBS);
  log.add("with file: ", fFile, NOTE_VBS);

  // Open file for reading (this is the binary version of the bitstream file)
  // and go to end of bitstream file to get the file size
  ifstream  binFile(fFile.c_str(), ios::binary | ios::ate);
  if (binFile == 0) {
    log.add("Error! Input file not found", ERROR_VBS);
    return FILE_NOT_FOUND;
  }
  int fileSize = binFile.tellg();
  log.add("File size: ", fileSize, NOTE_VBS);
  binFile.seekg(0, ios::beg); // Don't forget to come back to the beginning
  // Divide the file size by the payload size to get the number of full payload
  // within the file
  int nbFullPayloads = fileSize / PAGE_SIZE;
  log.add("Number of full payloads: ",nbFullPayloads, NOTE_VBS);
  // Deduce the size of the last payload
  int lastPayloadSize = fileSize - (nbFullPayloads * PAGE_SIZE);
  log.add("Size of last payload: ", lastPayloadSize, NOTE_VBS);

  //log.add("Opening device for fpga programming process.", NOTE_VBS);
  //log.add("Device successfully opened.", NOTE_VBS);

  // Start sending the configuration file through the USB interface
  unsigned char dataRead[PAGE_SIZE];
  unsigned char dataCheck[PAGE_SIZE];
  for (int a=0; a < PAGE_SIZE; a++) {
    dataCheck[a] = 0x55;
  }

  int payloadCount = 0;
  int payloadSize = 0;
  bool transferOver = false;

  // Send start of programming byte using Vendor Command
  rv = set_FPGA_Flash_Programming_Mode();
  log.add("Starting FPGA programming...", NOTE_VBS);
  while (binFile.good() && (transferOver == false)) {
    // Read data from the binary file taking into account the lenght of the
    // last payload (one page at a time)
    if (payloadCount == 0) {
      flashAddress[0] = 0x00;
      flashAddress[1] = 0x00;
      flashAddress[2] = 0x00;
      binFile.read(reinterpret_cast<char*>(dataRead), PAGE_SIZE);
      payloadSize = PAGE_SIZE;
    }
    else {
      if (payloadCount < nbFullPayloads) {
	payloadSize = PAGE_SIZE;
      }
      else {
	payloadSize = lastPayloadSize;
	for (int i = lastPayloadSize; i < PAGE_SIZE; i++) {
	  dataRead[i] = 0x00;
	}
	transferOver = true;
      }
      flashAddress[0] = (unsigned char)(payloadCount/128);
      flashAddress[1] = (unsigned char)(payloadCount*2);
      flashAddress[2] = 0x00;
      binFile.read(reinterpret_cast<char*>(dataRead), payloadSize);
    }
    payloadCount++;

    // Write page to the fpga and retry if errors are detected
    int pageRetry = 0;
    bool pageOK = false;
    while(!pageOK) {
      log.add("Page writting retry = ", pageRetry, NOISE_VBS);
      // Escape the loop if too many attempts are made
      if (pageRetry == 10) {
	log.add("Too many attempts at writing/reading page. Abandonning", ERROR_VBS);
	transferOver = true;
	return PROG_ERROR;
      }
      log.add("Writing page: ", payloadCount, NOISE_VBS);
      rv = write_FPGA_Flash_Page(dataRead, flashAddress);
      if (rv) {
	log.add("Failed writing page. Error: ", rv, ERROR_VBS);
	transferOver = true;
	return BULK_TX_ERROR;
      }

      // and read it back
      //       rv = readFpgaPage(dataCheck, flashAddress);
      //       if (rv) {
      // 	log.add("Failed reading page back. Error: ", rv, ERROR_VBS);
      // 	transferOver = true;
      // 	return BULK_TX_ERROR;
      //       }
      //       // now compare what was sent and what was written to the flash
      //       // 
      //       for (int i=0; i < PAGE_SIZE; i++) {
      // 	if (dataRead[i] != dataCheck[i]) {
      // 	  pageErrors++;
      // 	  //log.add("Data do not match! byte: ", i, ERROR_VBS);
      // 	}
      //       }

      //       if (pageErrors != 0) {
      // 	pageOK = false;
      // 	log.add("Error while reading page: ", payloadCount, ERROR_VBS);
      // 	log.add("Page address:", ERROR_VBS);
      // 	log.add(" ", (int)flashAddress[0], ERROR_VBS);
      // 	log.add(" ", (int)flashAddress[1], ERROR_VBS);
      //         log.add(" ", (int)flashAddress[2], ERROR_VBS);
      // 	log.add("Number of errors when reading page: ", pageErrors, 
      // 		     ERROR_VBS);

      // 	cout << "dataRead (from file) = " << endl;
      // 	for (int a=0; a < PAGE_SIZE; a++) {
      // 	  cout << (int)dataRead[a] << " ";
      // 	}
      // 	cout << endl;
      // 	cout << "dataCheck (received from Flash) = " << endl;
      // 	for (int a=0; a < PAGE_SIZE; a++) {
      // 	  cout << (int)dataCheck[a] << " ";
      // 	}
      // 	cout << endl;

      // 	pageRetry++;
      // 	nbPageRetry++;
      // 	pageErrors = 0;
      //       }
      //       else pageOK = true;

      pageOK = true;
    }
  }

  log.add("... Done.", NOTE_VBS);
  log.add("Number of pages transmitted: ", payloadCount, NOTE_VBS);
  log.add("Number of pages retransmitted: ", nbPageRetry, NOTE_VBS);

  log.add("Resetting fpga ", NOTE_VBS);
  ctrlByte = RESET_F;
  rv = bulkTransfer(ctrlByte_ptr, 1, EP2, TIME_OUT);
  if (rv) {
    log.add("Could not reset FPGA! Error: ", rv, ERROR_VBS);
    return rv;
  }

  log.add("Restoring micro-controller previous state", NOTE_VBS);
  set_MC_Mode(orgMC_Mode_ptr);

  // Close file and usb device
  binFile.close();
  return rv;
}


// erase_FPGA_Flash
/*****************************************************************************/
// For the time being erases the fpga spi flash first page
int aes220Dev::erase_FPGA_Flash() {
  int rv = 99;
  uint8_t pgAddress[2] = {0, 0};
  rv = erase_FPGA_Flash_Page(pgAddress, 0);
  return rv;
}

// erase_Fpga_Flash_Page
/*****************************************************************************/
// Programs the fpga spi flash
int aes220Dev::erase_FPGA_Flash_Page(uint8_t * pgAddress, uint16_t nbOfPages) {

  int rv = 99;
  uint8_t ctrlByte;

  // First configure the FPGA with the flash SPI interface
  const string aes220a_fpgaSpiFile = "aes220a_progFpga_ent.bin";
  const string aes220b_fpgaSpiFile = "aes220b_progFpga_ent.bin";
  string fpgaSpiFile;
  uint8_t orgMC_Mode;
  uint8_t MC_Mode;
  // Record the mode the micro-controller is in
  read_MC_Mode(&orgMC_Mode);
  // Change the mode to port mode
  MC_Mode = PORT_MODE;
  set_MC_Mode(&MC_Mode);
  // Configure the FPGA to write to the Flash with the file that relates to the module model
  uint8_t boardInfo[8];
  uint8_t model = 'z';
  get_Board_Info(boardInfo);
  model = boardInfo[1];
  switch(model) {
  case 'a' | 'A':
    log.add("Configuring FPGA with aes220a progFpga file", NOTE_VBS);
    fpgaSpiFile.assign(aes220a_fpgaSpiFile);
    break;
  case 'b' | 'B':
    log.add("Configuring FPGA with aes220b progFpga file", NOTE_VBS);
    fpgaSpiFile.assign(aes220b_fpgaSpiFile);
    break;
  default:
    break;
  }
  rv = configure_FPGA(fpgaSpiFile);
  if (rv != 0) return FPGA_CONF_ERROR;

  int pageCount = 0;
  uint8_t dummyByte = 0x55;

  // Send start of programming byte using Vendor Command
  rv = set_FPGA_Flash_Programming_Mode();
  log.add("Setting the micro-controller to FPGA flash programming mode...", NOTE_VBS);

  while (pageCount <= nbOfPages) {
    log.add("Erasing page: ", pageCount, NOISE_VBS);
    rv = send_FPGA_Flash_Command(PAGE_ERASE, *pgAddress, *(pgAddress+1), dummyByte, NULL, 0);
    if (rv) {
      log.add("Failed erasing page. Error: ", rv, ERROR_VBS);
      return BULK_TX_ERROR;
    }
    else {
      log.add("Page erased", NOISE_VBS);
      pageCount++;
    }
  }

  log.add("... Done.", NOTE_VBS);
  log.add("Number of pages erased: ", pageCount, NOTE_VBS);

  log.add("Resetting fpga ", NOTE_VBS);
  ctrlByte = RESET_F;
  rv = bulkTransfer(&ctrlByte, 1, EP2, TIME_OUT);
  if (rv) {
    log.add("Could not reset FPGA! Error: ", rv, ERROR_VBS);
    return rv;
  }

  log.add("Restoring micro-controller previous state", NOTE_VBS);
  set_MC_Mode(&orgMC_Mode);

  return rv;
}

// write_FPGA_Flash_Page
/*****************************************************************************/
// Writes one fpga spi flash page (256bytes)
int aes220Dev::write_FPGA_Flash_Page(unsigned char *pgContents, 
			       unsigned char *pgAddress)
{
  int rv = 99;
  unsigned char ctrlByte;
  unsigned char cmdByte = PPTB1; // Page Program Through Buffer 1
  //timespec startTime, endTime;

  // Writes to the application log window
  log.add("Starting FPGA page writing process", NOISE_VBS);

  //clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &startTime); 
  //log.add("Start time is: ", startTime.tv_nsec, NOISE_VBS);

  // Start sending the configuration file through the USB interface
  unsigned char frameOut[PAGE_SIZE + 5];
  int payloadSize = PAGE_SIZE;

  ctrlByte = WRITE_CMD;
  cmdByte = PPTB1;

  // Create a frame by concatenating the control byte, cmds, address and the
  // read data
  frameOut[0] = ctrlByte;
  frameOut[1] = cmdByte;
  frameOut[2] = *pgAddress;
  frameOut[3] = *(pgAddress+1);
  frameOut[4] = *(pgAddress+2);
  for (int i = 0; i < payloadSize; i++) {
    frameOut[i+5] = *pgContents++;
  }
  // Check the flash status
  rv = wait_For_Flash();
  if (rv == FLASH_ERROR) return FLASH_ERROR;
  // and send the frame out via the USB interface

  rv = bulkTransfer(frameOut, payloadSize+5, EP2, TIME_OUT);
  if (rv == -7) { // if the command times out try again
    int count = 0;
    while (rv == -7) {
      count ++;
      log.add("Time out error while sending data, retry number: ", count , NOTE_VBS);
      // If too many attempts give up
      if (count == TIME_OUT_RETRY) return BULK_TX_ERROR;
      // otherwise try again
      rv = bulkTransfer(frameOut, payloadSize+5, EP2, TIME_OUT);
    }
  }
  // Wait for the page to be transferred fromt he buffer to the flash itself
  // (30 to 40ms)
  msleep(40);

  // Check the flash status
  rv = wait_For_Flash();
  if (rv == FLASH_ERROR) return FLASH_ERROR;

  //clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &endTime); 
  //log.add("End time is: ", endTime.tv_nsec, NOISE_VBS);
  //log.add("Time taken waiting for page write (in ns) is: ", 
  //	       (endTime.tv_nsec-startTime.tv_nsec), NOISE_VBS);

  if (rv) {
    log.add("Bulk transfer failure sending data. Error: ", rv, ERROR_VBS);
	}
  else {
    log.add("Page transfer completed.", NOISE_VBS);
  }
  return rv;
}

// send_FPGA_Flash_Command
/*****************************************************************************/
// Sends a command to the FPGA flash via its spi interface
// See the Xilinx document UG333 for the different commands available
int aes220Dev::send_FPGA_Flash_Command(uint8_t cmdByte, uint8_t byte2, uint8_t byte3, 
				       uint8_t byte4, uint8_t * data, uint16_t dataSize)
{
  int rv = 99;
  int headerSize = 5;
  uint8_t ctrlByte;

  // Writes to the application log window
  log.add("Starting send FPGA flash command", NOISE_VBS);

  uint8_t * frameOut = new uint8_t[dataSize];
  switch (cmdByte) {
  case FAST_READ | RND_READ | BUF1RD | BUF2RD :
    ctrlByte = READ_CMD;
    break; 
  default:  
    ctrlByte = WRITE_CMD;
    break;
  }

  // Create a frame by concatenating the control byte, cmds, address and the
  // read data
  frameOut[0] = ctrlByte;
  frameOut[1] = cmdByte;
  frameOut[2] = byte2;
  frameOut[3] = byte3;
  frameOut[4] = byte4;
  if (ctrlByte == WRITE_CMD) {
    for (int i = 0; i < dataSize; i++) {
      frameOut[i+headerSize] = *data++;
    }
  }
  // Check the flash status
  rv = wait_For_Flash();
  if (rv == FLASH_ERROR) return FLASH_ERROR;
  // and send the frame out via the USB interface
  if (ctrlByte == WRITE_CMD) {rv = bulkTransfer(frameOut, dataSize+headerSize, EP2, TIME_OUT);}
  else {rv = bulkTransfer(frameOut, headerSize, EP2, TIME_OUT);}
  if (rv == -7) { // if the command times out try again
    int count = 0;
    while (rv == -7) {
      count ++;
      log.add("Time out error while sending data, retry number: ", count , NOTE_VBS);
      // If too many attempts give up
      if (count == TIME_OUT_RETRY) return BULK_TX_ERROR;
      // otherwise try again
      rv = bulkTransfer(frameOut, headerSize, EP2, TIME_OUT);
    }
  }
  // Read the data back if it is a read command
  // This part has not been tested yet!!!
  if (ctrlByte == READ_CMD) {
    rv = bulkTransfer(data, dataSize, EP6, TIME_OUT);
    if (rv == -7) { // if the command times out try again
      int count = 0;
      while (rv == -7) {
	count ++;
	log.add("Time out error while sending data, retry number: ", count , NOTE_VBS);
	// If too many attempts give up
	if (count == TIME_OUT_RETRY) return BULK_TX_ERROR;
	// otherwise try again
	rv = bulkTransfer(frameOut, dataSize, EP6, TIME_OUT);
      }
    }
  }  // Wait for the command to be executed (30 to 40ms)
  msleep(40);

  // Check the flash status
  rv = wait_For_Flash();
  if (rv == FLASH_ERROR) return FLASH_ERROR;

  if (!rv) {
    log.add("Command completed.", NOISE_VBS);
  }
  delete frameOut;
  return rv;
}

// readFpgaPage
/*****************************************************************************/
// Reads one fpga spi flash page (256bytes)
int aes220Dev::read_FPGA_Page(unsigned char *pgContents, 
			      unsigned char *pgAddress)
{
  int rv = 99;
  unsigned char ctrlByte;
  unsigned char cmdByte = PPTB1; // Page Program Through Buffer 1

  // Writes to the application log window
  log.add("Starting FPGA page reading process", NOISE_VBS);

  // Start sending the configuration file through the USB interface
  unsigned char frameOut[PAGE_SIZE + 5];
  int payloadSize = PAGE_SIZE;

  ctrlByte = READ_CMD;
  cmdByte = FAST_READ;

  // Create a command frame by concatenating the control byte, cmds, address
  // and the dummy data byte
  frameOut[0] = ctrlByte;
  frameOut[1] = cmdByte;
  frameOut[2] = *pgAddress;
  frameOut[3] = *(pgAddress+1);
  frameOut[4] = *(pgAddress+2);
  frameOut[5] = 0x55; // dummy byte
  /*cout << "Reading page: " << endl;
    cout << (int)frameOut[2]
    << (int)frameOut[3]
    << (int)frameOut[4] << endl;*/

  // Check the flash status
  rv = wait_For_Flash();
  if (rv == FLASH_ERROR) return FLASH_ERROR;
  // then send the read command frame out via the USB interface
  rv = bulkTransfer(frameOut, 6, EP2, TIME_OUT);
  if (rv == -7) { // if the command time out try again
    int count = 0;
    while (rv == -7) {
      count ++;
      log.add("Time out error while sending data, retry number ", 
									 count, NOTE_VBS);
      if (count == TIME_OUT_RETRY) return BULK_TX_ERROR;
      rv = bulkTransfer(frameOut, 6, EP2, TIME_OUT);
    }
  }
  if (rv) {
    log.add("Bulk transfer failure sending data. Error: ", rv, ERROR_VBS);
    return BULK_TX_ERROR;
  }
  // and read the data back
  rv = bulkTransfer(pgContents, payloadSize, EP6, TIME_OUT);
  if (rv == -7) {
    int count = 0;
    while (rv == -7) {
      count ++;
      log.add("Time out error while receiving data, retry number ", 
									 count, NOTE_VBS);
      if (count == TIME_OUT_RETRY) return BULK_TX_ERROR;
      rv = bulkTransfer(pgContents, payloadSize, EP6, TIME_OUT);
    }
  }
  if (rv) {
    log.add("Bulk transfer failure receiving data. Error: ", rv, 
								 ERROR_VBS);
    return BULK_TX_ERROR;
  }

  log.add("Page transfer completed.", NOISE_VBS);

  return rv;
}

// wait_For_Flash
/*****************************************************************************/
int aes220Dev::wait_For_Flash()
{
  int cnt = 0;
  int flashStatus;


  //clock_settime(CLOCK_PROCESS_CPUTIME_ID, &tS); 

  // Writes to the application log window
  log.add("Checking FPGA flash status", NOISE_VBS);
  flashStatus = flash_Ready();
  while (flashStatus != FLASH_READY) {
    if (flashStatus == FLASH_ERROR) return FLASH_ERROR;
    cnt++;
    if (cnt == 10000) {
      log.add("Flash not responding to status request", ERROR_VBS);
      return FLASH_ERROR;
    }
    flashStatus = flash_Ready();
  }

  log.add("Flash ready", NOISE_VBS);

  return 0;
}

// flash_Ready
/*****************************************************************************/
// Checks if the fpga flash is ready
int aes220Dev::flash_Ready()
{
  int rv = 99;
  unsigned char flashStatus = 0x00;
  unsigned char *flashStatus_ptr = &flashStatus;

  rv = read_FPGA_Flash_Status(flashStatus_ptr);
  if (rv != 0) {
    log.add("Error checking flash status", ERROR_VBS);
    return FLASH_ERROR;
  }
  if (flashStatus != 0x9C) {
    log.add("Flash status returned: ", (int)flashStatus,
		 NOISE_VBS);
    return FLASH_NOT_READY;
  }
  return FLASH_READY;
}

// read_FPGA_Flash_Status
/*****************************************************************************/
// Reads the fpga spi flash status
int aes220Dev::read_FPGA_Flash_Status(unsigned char *flashStatus)
{
  int rv = 99;
  unsigned char ctrlByte = STATUS_CHECK; // flash status check
  unsigned char *ctrlByte_ptr = &ctrlByte;


  // Send control byte
  log.add("Sending flash request via bulk transfer", NOISE_VBS);
  rv = bulkTransfer(ctrlByte_ptr, 1, EP2, TIME_OUT);
  if (rv) {
    log.add("Bulk transfer failure sending data. Error: ", rv, ERROR_VBS);
    return BULK_TX_ERROR;
  }
  // Read returned status
  rv = bulkTransfer(flashStatus, 1, EP6, TIME_OUT);
  if (rv) {
    log.add("Bulk transfer failure receiving flash status. Error: ", rv, ERROR_VBS);
    return BULK_RX_ERROR;
  }
  return rv;
}

// sendByte
/*****************************************************************************/
// Sends a byte to aes220
int aes220Dev::send_Byte(unsigned char *bts_ptr) 
{
  int rv = 99;
  rv = bulkTransfer(bts_ptr, 1, EP2, TIME_OUT);
  if (rv) {
    log.add("sendByte: Bulk transfer failure.  Error: ", rv, ERROR_VBS);
    return BULK_TX_ERROR;
  }
  return rv;
}

// receivedByte
/*****************************************************************************/
// Receives a byte from aes220
int aes220Dev::receive_Byte(unsigned char *btr_ptr) 
{
  int rv = 99;
  rv = bulkTransfer(btr_ptr, 1, EP6, TIME_OUT);
  if (rv) {
    log.add("receiveByte: Bulk transfer failure.  Error: ", rv, ERROR_VBS);
    return BULK_RX_ERROR;
  }
  return rv;
}

// pipe_Out
/*****************************************************************************/
// Sends a buffer to aes220 using slave FIFO mode of the FX2
int aes220Dev::pipe_Out(uint8_t *buf_ptr, uint32_t bufSize, uint8_t channelAddress)
{
  int rv = 99;
  uint32_t toBeTransferred = bufSize;
  uint32_t framePayloadSize = 0;
  const uint8_t headerSize = 3;
  uint8_t header[headerSize];
  uint8_t *data_ptr;

  // Make sure the uC is in Slave FIFO mode
  log.add("Pipe out: ensuring micro-controller is in Slave FIFO mode", NOISE_VBS);
  uint8_t orgMC_Mode;
  uint8_t *orgMC_Mode_ptr = &orgMC_Mode;
  uint8_t MC_Mode;
  uint8_t *MC_Mode_ptr = &MC_Mode;
  // Read the mode the micro-controller is in
  read_MC_Mode(orgMC_Mode_ptr);
  if (orgMC_Mode != SLAVE_FIFO_MODE) {
    // Change the mode to Slave FIFO mode
    MC_Mode = SLAVE_FIFO_MODE;
    log.add("Pipe out: micro-controller in port mode, selecting Slave_FIFO mode", NOISE_VBS);
    set_MC_Mode(MC_Mode_ptr);
  }
  else {
    log.add("Pipe out: micro-controller in Slave_FIFO mode", NOISE_VBS);
  }
	
  while (toBeTransferred > 0) {
    // Break up the size of data to be transferred if required
    if (toBeTransferred > MAX_FRAME_PAYLOAD) {
      framePayloadSize = MAX_FRAME_PAYLOAD;
    }
    else framePayloadSize = toBeTransferred;
    // Assembling the header
    header[0] = channelAddress & ~0x80; // Clear the first bit (MSb): read flag
    header[1] = (uint8_t)(framePayloadSize >> 8);
    header[2] = (uint8_t)framePayloadSize;
    // Transferring the header
    log.add("Starting transferring header via bulk transfer...", NOTE_VBS);
    rv = bulkTransfer(header, headerSize, EP2, TIME_OUT);
    if (rv) {
      log.add("pipe out header transfer: bulk transfer failure.  Error: ", rv , ERROR_VBS);
      return BULK_TX_ERROR;
    }
    log.add("...bulk transfer completed", NOTE_VBS);
    // Pointing to the data
    data_ptr = buf_ptr + (bufSize-toBeTransferred);
    // Transferring the data via EP2
    log.add("Starting transferring data via bulk transfer...", NOTE_VBS);
    rv = bulkTransfer(data_ptr, framePayloadSize, EP2, TIME_OUT);
    if (rv) {
      log.add("pipe out data transfer: bulk transfer failure.  Error: ", rv , ERROR_VBS);
      return BULK_TX_ERROR;
    }
    log.add("...sent", NOTE_VBS);
    // Decrement the amount of data still to be transferred
    toBeTransferred -= framePayloadSize;
  }
  return rv;
}

// pipe_In
/*****************************************************************************/
// Receives a buffer from aes220  using slave FIFO mode of the FX2
int aes220Dev::pipe_In(uint8_t *buf_ptr, uint32_t bufSize, uint8_t channelAddress)
{
  int rv = 99; 
	uint32_t toBeReceived = bufSize;
	uint32_t framePayloadSize = 0;
	const uint8_t headerSize = 3;
	uint8_t header[headerSize];
	uint8_t *data_ptr;

	// Make sure the uC is in Slave FIFO mode
	log.add("Pipe in: ensuring micro-controller is in Slave FIFO mode", NOISE_VBS);
  uint8_t orgMC_Mode;
  uint8_t *orgMC_Mode_ptr = &orgMC_Mode;
  uint8_t MC_Mode;
  uint8_t *MC_Mode_ptr = &MC_Mode;
  // Read the mode the micro-controller is in
  read_MC_Mode(orgMC_Mode_ptr);
  if (orgMC_Mode != SLAVE_FIFO_MODE) {
    // Change the mode to Slave FIFO mode
    log.add("Pipe in: micro-controller in port mode, selecting Slave_FIFO mode", NOISE_VBS);
    MC_Mode = SLAVE_FIFO_MODE;
    set_MC_Mode(MC_Mode_ptr);
  }
  else {
    log.add("Pipe in: micro-controller in Slave_FIFO mode", NOISE_VBS);
  }
	
  // Read the data itself
  while (toBeReceived > 0) {
    if (toBeReceived > MAX_FRAME_PAYLOAD) {
      framePayloadSize = MAX_FRAME_PAYLOAD;
    }
    else framePayloadSize = toBeReceived;
    // Assembling the header
    header[0] = channelAddress | 0x80; // set the first bit (MSb): write flag
    header[1] = (uint8_t)(framePayloadSize >> 8);
    header[2] = (uint8_t)framePayloadSize;
    // Transferring the header
    log.add("Starting transferring header via bulk transfer...", NOTE_VBS);
    rv = bulkTransfer(header, headerSize, EP2, TIME_OUT);
    if (rv) {
      log.add("pipe in header transfer: bulk transfer failure.  Error: ", rv , ERROR_VBS);
      return BULK_TX_ERROR;
    }
    log.add("...sent", NOTE_VBS);
    // Pointing to the data
    data_ptr = buf_ptr + (bufSize-toBeReceived);
    // Receiving the data via EP6
    log.add("Starting transferring data via bulk transfer...", NOTE_VBS);
    rv = bulkTransfer(data_ptr, framePayloadSize, EP6, TIME_OUT);
    if (rv) {
      log.add("pipe in data transfer: bulk transfer failure.  Error: ", rv , ERROR_VBS);
      return BULK_TX_ERROR;
    }
    log.add("...received", NOTE_VBS);
    // Decrement the amount of data still to be received
    toBeReceived -= framePayloadSize;
  }
  return rv;
}

// set_MC_Mode
/*****************************************************************************/
// Sets the uC mode (Port mode or slave FIFO mode)
int aes220Dev::set_MC_Mode(uint8_t *MC_Mode_ptr)
{
  int rv = 99;

  log.add("Sending mode command with mode:", *MC_Mode_ptr, NOTE_VBS);
  rv = do_usb_command(EP0_WRITE, VC_UC_MODE, 0, 0, MC_Mode_ptr, 1, TIME_OUT);
  if (rv != 1) {
    log.add("Vendor command failure sending mode command. Error: ", rv, ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("... mode commmand sent", NOTE_VBS);
  }
  return rv;
}

// read_MC_Mode
/*****************************************************************************/
// Reads the uC mode
int aes220Dev::read_MC_Mode(uint8_t *MC_Mode_ptr)
{
  int rv = 99;
  uint8_t modeByte[3] = {99, 99, 99}; // fpga status, uC mode, uC previous mode

  log.add("Reading micro-controller mode...", NOTE_VBS);
  rv = do_usb_command(EP0_READ, VC_UC_MODE, 0, 0, modeByte, 3, TIME_OUT);
  if (rv != 3) {
    log.add("Vendor command failure reading micro-controller mode command. Error: ", 
		 rv, ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("...received", NOTE_VBS);
    *MC_Mode_ptr = modeByte[1];
  }
  return 0;
}

// readFIFORegs
/*****************************************************************************/
// Reads the FIFO registers
int aes220Dev::read_FIFO_Regs(uint8_t *regs_ptr)
{
  int rv = 99;
  const int regsSize = 16;

  log.add("Sending read FIFO registers command...", NOTE_VBS);
  rv = do_usb_command(EP0_READ, VC_FIFO_DEBUG, 0, 0, regs_ptr, regsSize, TIME_OUT);
  if (rv != regsSize) {
    log.add("Vendor command failure sending read FIFO registers command. Error: ", 
		 rv, ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("...sent", NOTE_VBS);
  }
  return rv;
}

// setUPP
/*****************************************************************************/
// Sets the user programmable pins direction 
int aes220Dev::set_UPP(uint8_t pinsDir)
{
  int rv = 99;
  uint8_t uppCmd[3] = { UPP_PIN_DIR, 0, 0 };

  // Manipulate the bits to correspond to the port pins
  // Set the relevant bits according to userPinsDirByte
  uint8_t upp0Dir = 1 & pinsDir;
  uint8_t upp1Dir = 2 & pinsDir;
  uint8_t upp2Dir = 4 & pinsDir;
  uint8_t upp3Dir = 8 & pinsDir;
  uint8_t upp4Dir = 16 & pinsDir;
  uint8_t upp5Dir = 32 & pinsDir;
  uint8_t uppLDir = (upp3Dir << 3) | (upp2Dir << 3) | (upp1Dir << 2) | (upp0Dir << 2);
  uint8_t uppHDir = (upp5Dir >> 2) | (upp4Dir >> 3);
  uppCmd[1] = uppLDir;
  uppCmd[2] = uppHDir;
  log.add("UPP dir L cmd: ", uppLDir, NOISE_VBS);
  log.add("UPP dir H cmd: ", uppHDir, NOISE_VBS);

  log.add("Sending UPP pin dir command...", NOTE_VBS);
  rv = do_usb_command(EP0_WRITE, VC_UPP_CMD, 0, 0, uppCmd, 3, TIME_OUT);
  if (rv != 3) {
    log.add("Vendor command failure sending pins direction command. Error: ", 
		 rv, ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("...sent", NOTE_VBS);
  }
  return rv;
}

// writeUPP
/*****************************************************************************/
// Writes to the user programmable pins
int aes220Dev::write_UPP(uint8_t pinsVal)
{
  int rv = 99;
  uint8_t uppCmd[2] = { UPP_PIN_VAL, pinsVal };

  log.add("Sending UPP pins value command...", NOTE_VBS);
  rv = do_usb_command(EP0_WRITE, VC_UPP_CMD, 0, 0, uppCmd, 2, TIME_OUT);
  if (rv != 2) {
    log.add("Vendor command failure sending pins direction command. Error: ", 
		 rv, ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("...sent", NOTE_VBS);
  }
  return rv;
}

// sendCmd
/*****************************************************************************/
// Sends a command to the micro-controller
int aes220Dev::send_Cmd(uint8_t cmd) 
{
  int rv = 99;
  rv = do_usb_command(EP0_WRITE, VC_UC_CMD, 0, 0, &cmd, 1, TIME_OUT);
  return rv;
}

// readI2C
/*****************************************************************************/
// Reads data from a device on the I2C bus
int aes220Dev::readI2C(uint8_t deviceAddress, uint8_t *data, uint16_t dataLength) 
{
  int rv = 99;
  rv = do_usb_command(EP0_READ, VC_I2C, deviceAddress, 0, data, dataLength, TIME_OUT);
  return rv;
}

// writeI2C
/*****************************************************************************/
// Writes data to a device on the I2C bus
int aes220Dev::writeI2C(uint8_t deviceAddress, uint8_t *data, uint16_t dataLength) 
{
  int rv = 99;
  rv = do_usb_command(EP0_WRITE, VC_I2C, deviceAddress, 0, data, dataLength, TIME_OUT);
  return rv;
}

// combinedI2C
/*****************************************************************************/
// Writes then reads data to and from a device on the I2C
int aes220Dev::combinedI2C(uint8_t deviceAddress, 
			   uint8_t *dataToWrite, uint16_t dataToWriteLength,
			   uint8_t *dataToRead, uint16_t dataToReadLength) 
{
  int rv = 99;
  rv = do_usb_command(EP0_WRITE, VC_I2C, deviceAddress, 1, dataToWrite, dataToWriteLength, 
		      TIME_OUT);
  rv = do_usb_command(EP0_READ, VC_I2C, deviceAddress, 0, dataToRead, dataToReadLength, 
		      TIME_OUT);
  return rv;
}

// 3p3vOn
/*****************************************************************************/
// Turns the 3.3V supply on the FPGA IOs on
int aes220Dev::turn3p3vOn() 
{
	// BKLDOEN is the LN3906 register for enabling/disabling the bucks and LDOs
  int rv = 99;
	uint8_t cmd[2] = {BKLDOEN, 0x75};
  rv = writeI2C(0x60, cmd, 2);
  return rv;
}

// 3p3vOff
/*****************************************************************************/
// Turns the 3.3V supply on the FPGA IOs off
int aes220Dev::turn3p3vOff() 
{
	// BKLDOEN is the LN3906 register for enabling/disabling the bucks and LDOs
  int rv = 99;
	uint8_t cmd[2] = {BKLDOEN, 0x71};
  rv = writeI2C(0x60, cmd, 2);
  return rv;
}

// check_FPGA_status
/*****************************************************************************/
// Checks the fpga configuration status
 int aes220Dev::check_FPGA_Status() 
 {
   const uint8_t bs = 3;
   uint8_t inByte[bs] = {99, 99, 99};
   uint8_t *inBytePtr = inByte;
   int rv = 99;

   log.add("Waiting for FPGA status", NOTE_VBS);
   while (inByte[0] != PROG_DONE) {
     rv = do_usb_command(EP0_READ, VC_UC_MODE, 0, 0, inBytePtr, bs, TIME_OUT);
     log.add("USB vendor command reply received.", NOISE_VBS);
     if (rv != bs) {
       log.add("Vendor command failure at FPGA status. Error: ", rv, ERROR_VBS);
       return VND_COMM_ERROR;
     }
     else {
       log.add("Received status byte.", NOTE_VBS);
     }
     // Status byte received, now interpret it
     switch (inByte[0]) { 
     case PROG_DONE:
       log.add("FPGA configured!", NOTE_VBS);
       rv = 0;
       break;
     case F_BUSY: 
       log.add("FPGA busy", NOTE_VBS);
       break;
     case INIT_B_LOW: 
       log.add("FPGA configuration failed, INIT_B unexpectedly low.", ERROR_VBS);
       return FPGA_PROG_ERROR;
       break;
     case INIT_B_HIGH:
       log.add("FPGA configuration failed, despite INIT_B high", ERROR_VBS);
       return FPGA_PROG_ERROR;
       break;
     case DONE_LOW:
       log.add("FPGA configuration failed, DONE pin stayed low.", ERROR_VBS);
       return FPGA_PROG_ERROR;
       break;
     case PROG_ERROR: 
       log.add("FPGA configuration failed, unknown error.", ERROR_VBS);
       return FPGA_PROG_ERROR;
       break;
     case F_NOT_READY: 
       log.add("FPGA configuration failed, FPGA not ready for configuration.", ERROR_VBS);
       return FPGA_PROG_ERROR;
       break;
     default: 
       log.add("FPGA status uncomfirmed!", (int)inByte[0], ERROR_VBS);
       return FPGA_UNKNOWN_STATE;
       break;
     }
   }
   return rv;
 }

// set_FPGA_Flash_Programming_Mode
/*****************************************************************************/
// Sets FPGA Flash programming mode using Vendor Command
int aes220Dev::set_FPGA_Flash_Programming_Mode()
{
  unsigned char startConfigByte = PROG_F_MODE;
  unsigned char *startConfigBytePtr = &startConfigByte;
  uint16_t len = 1;
  int rv = 99;
  log.add("Sending start byte...", NOTE_VBS);
  rv = do_usb_command(EP0_WRITE, VC_UC_MODE, 0, 0, startConfigBytePtr, len, TIME_OUT);
  if (rv != len) {
    log.add("Vendor command failure at start prog. Error: ", rv, 
		 ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("...sent", NOTE_VBS);
    return 0;
  }
}

// get_Firmware_Info
/*****************************************************************************/
// Reads the board information
int aes220Dev::get_Firmware_Info(const uint8_t* firmwareInfo_ptr)
{
  int rv = 99;
  uint16_t value = 0;
  uint16_t index = 0;
  uint16_t len = 3;

  log.add("Requesting firmware info...", NOTE_VBS);
  rv = do_usb_command(EP0_READ, VC_SOFT_INFO, value, index, firmwareInfo_ptr, len, TIME_OUT);
  if (rv != len) {
    log.add("Vendor command failure reading firmware info. Error: ", 
		 rv, ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("...received", NOTE_VBS);
  }
  return rv;
}

// write_FPGA_PageII
/*****************************************************************************/
// Writes one fpga spi flash page (256bytes)
int aes220Dev::write_FPGA_Flash_PageII(uint8_t buffer, uint8_t *pgAddress, uint8_t *pgContents)
{
  int rv = 99;
  const uint8_t MAX_PAYLOAD = MAX_EP0_DATA - 4;
  uint8_t flashCmdByte;
  uint8_t headerSize;
  uint8_t frameOut[MAX_EP0_DATA];
  uint16_t payloadSize = PAGE_SIZE;
  uint16_t transmitBytes = PAGE_SIZE;
  uint16_t value;
  uint16_t index;
  uint16_t frameSize;

  if (buffer == BUF1) {
    flashCmdByte = BUF1WR; // Write to buffer 1
  }
  else if (buffer == BUF2) {
    flashCmdByte = BUF2WR; // Write to buffer 2
  }
  else return FLASH_ERROR;

  // Writes to the application log window
  log.add("Starting FPGA page writing process", NOISE_VBS);

  // Start sending the configuration file through the USB interface
  while(transmitBytes > 0) {
    if (transmitBytes > MAX_PAYLOAD) {
      payloadSize = MAX_PAYLOAD;
    }
    else payloadSize = transmitBytes;



    //Generate a header (control byte, cmds, address):
    headerSize = 4;
    frameOut[0] = flashCmdByte;
    frameOut[1] = *pgAddress;
    frameOut[2] = *(pgAddress+1);
    frameOut[3] = 0x55; // Dummy byte

    // Create a frame by concatenating the header and the data
    for (int i = 0; i < payloadSize; i++) {
      frameOut[i+headerSize] = *pgContents++;
    }

    frameSize = headerSize + payloadSize;

    // Write data to the buffer
    //rv = do_usb_command(frameOut, payloadSize+5, EP2, TIME_OUT);
    value = flashCmdByte;
    index = 0;
    rv = do_usb_command(EP0_WRITE, VC_FLASHCMD, value, index, frameOut, frameSize, TIME_OUT);

    // Wait for the flash to be ready
    // (30 to 40ms)
    //msleep(40);

    // Check the flash status
    rv = wait_For_Flash();
    if (rv == FLASH_ERROR) return FLASH_ERROR;

    // Write the buffer to the page

    /*
      if (rv) {
      log.add("Transfer failure sending data. Error: ", rv, ERROR_VBS);
      }
      else {
      log.add("Page transfer completed.", NOISE_VBS);
      }
    */
  }
  return rv;
}

/*****************************************************************************
 Manufacturing test functions
 Not to be used with aes220_firmware.c
 Remove from stable/release versions
*****************************************************************************/

// writeBlockRAM
/*****************************************************************************/
// Sends a buffer to aes220 to be written on block RAM
int aes220Dev::writeBlockRAM(unsigned short addr, unsigned char *bts_ptr, 
			     unsigned short bufSize)
{
  int rv = 0;
  // Send address and data length to be written using Vendor Command
  unsigned char dataSize[2];
  dataSize[0] = (unsigned char)bufSize; // LSB
  dataSize[1] = (bufSize >> 8);         // MSB

  size_t bs = 2;
  log.add("Sending start byte...", NOTE_VBS);
  rv = do_usb_command(0x40, VC_WR_BRAM, addr, 0, dataSize, bs, TIME_OUT);
  if (rv != bs) {
    log.add("Vendor command failure at writing block RAM. Error: ", rv, 
		 ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("...sent", NOTE_VBS);
  }
  // Send the data itself
  log.add("Sending data...", NOTE_VBS);
  rv = bulkTransfer(bts_ptr, bufSize, EP2, TIME_OUT);
  if (rv) {
    cerr << "sendByte: Bulk transfer failure.  Error: " << rv << endl;
    return BULK_TX_ERROR;
  }
  else {
    log.add("...sent", NOTE_VBS);
  }
  return rv;
}

// readBlockRAM
/*****************************************************************************/
// Receives a buffer from aes220, read from block RAM
int aes220Dev::readBlockRAM(unsigned short addr, unsigned char *btr_ptr, 
			    unsigned short bufSize)
{
  int rv = 0;
  // Send address and data length to be read using Vendor Command
  unsigned char dataSize[2];
  cout << "bufSize before shift: " << bufSize << endl;
  dataSize[0] = bufSize;
  dataSize[1] = (bufSize >> 8);
  cout << "bufSize after shift: " << dataSize[1] << endl;

  size_t bs = 2;
  log.add("Sending start byte...", NOTE_VBS);
  rv = do_usb_command(0x40, VC_RD_BRAM, addr, 0, dataSize, bs, TIME_OUT);
  if (rv != bs) {
    log.add("Vendor command failure at reading block RAM. Error: ", rv, 
		 ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("...sent", NOTE_VBS);
  }

  // Read the data itself
  log.add("Reading data...", NOTE_VBS);
  rv = bulkTransfer(btr_ptr, bufSize, EP6, TIME_OUT);
  if (rv) {
    cerr << "receiveByte: Bulk transfer failure.  Error: " << rv << endl;
    return BULK_RX_ERROR;
  }
  else {
    log.add("...received", NOTE_VBS);
  }
  return rv;
}

// testSDRAM
/*****************************************************************************/
// launches aes220 sdram test
int aes220Dev::testSDRAM() 
{
  int rv = 0;
  // Send address and data length to be read using Vendor Command
  unsigned char dummy = 0x00;
  unsigned char *dummy_ptr = &dummy;
  size_t bs = 1;
  log.add("Sending start of test vendor command...", NOTE_VBS);
  rv = do_usb_command(0x40, VC_TST_SDRAM, 0, 0, dummy_ptr, bs, TIME_OUT);
  if (rv != bs) {
    log.add("Vendor command failure at reading block RAM. Error: ", rv, ERROR_VBS);
    return VND_COMM_ERROR;
  }
  else {
    log.add("...sent", NOTE_VBS);
  }
  return rv;
}

