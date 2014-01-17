/******************************************************************************
File name: aesfx2dev.cpp
===============================================================================
DESCRIPTION

Cypress FX2 utilities

===============================================================================
CHANGES

Pre release
110209-01: using usleep function in open function
110209-02: incrementing time on retry in open function
           programFX2 no longer open device, only checks it is opened
110306-01: changing aesFx2Dev to an inherited class from usbDev

Post release
1.4.0: First release
1.4.2: Change log function, now a separate class
1.4.3: Changed variable length array unsigned char data[nbytes] to
       fixed size one unsigned char data[256]

===============================================================================
NOTES


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

#include <aesFx2Dev.h>


//-----------------------------------------------------------------------------

aesFx2Dev::aesFx2Dev():usbDev(AESFX2_LOG) {}

aesFx2Dev::aesFx2Dev(string lfn):usbDev(lfn) {}

aesFx2Dev::aesFx2Dev(int init_vid, int init_pid, string lfn):usbDev(init_vid, init_pid, lfn) {}

aesFx2Dev::aesFx2Dev(int init_vid, int init_pid, int init_idx, string lfn):
  usbDev(init_vid, init_pid, init_idx, lfn) {}

aesFx2Dev::aesFx2Dev(int init_vid, int init_pid, int init_idx, int init_vbs, string lfn):
  usbDev(init_vid, init_pid, init_idx, init_vbs, lfn) {}

aesFx2Dev::~aesFx2Dev() {}

int aesFx2Dev::reset()
{
  // Reset by writing a 1 to address 0xE600.
  const size_t reset_addr=0xe600;
  const unsigned char val = '1';
  int rv = writeRAM(reset_addr, &val, 1);
  if (rv == 1) { return 0; } // success, 1 byte transmitted
  else return 1;
}

int aesFx2Dev::run()
{
  // Start running by writing a 0 to address 0xE600.
  const size_t reset_addr=0xe600;
  const unsigned char val = '0';
  int rv = writeRAM(reset_addr, &val, 1);
  if (rv == 1) { return 0; } // success, 1 byte transmitted
  else return rv;
}


int aesFx2Dev::writeRAM(size_t addr,const unsigned char *data,
			       size_t nbytes)
{
  if (!is_open()) {
    cerr << "is open: " << is_open() << endl;
    log.add("writeRAM: Not connected!", NO_HANDLE, ERROR_VBS);
    return(NO_HANDLE);
  }

  int rv = 99;

  const size_t chunk_size=16;
  const unsigned char *d=data;
  const unsigned char *dend=data+nbytes;
  while(d<dend) {
    size_t bs=dend-d;
    if(bs>chunk_size)  bs=chunk_size;
    size_t dl_addr=addr+(d-data);
    rv = do_usb_command(EP0_WRITE, 0xa0, dl_addr, 0, d, bs, 1000);
    d+=bs;
  }
  return(rv);
}

int aesFx2Dev::programIHexLine(const char *buf,	const char *path,int line) {
  const char *s=buf;
  if(*s!=':')
    {  cerr << path << ": " << line << ": format violation (1)" << endl;
      return(1);  }
  ++s;

  unsigned int nbytes=0,addr=0,type=0;
  if(sscanf(s,"%02x%04x%02x",&nbytes,&addr,&type)!=3)
    {  fprintf(stderr,"%s:%d: format violation (2)\n",path,line);
      return(1);  }
  s+=8;

  if(type==0)
    {
      //printf("  Writing nbytes=%d at addr=0x%04x\n",nbytes,addr);
      assert(nbytes>=0 && nbytes<256);
      unsigned char data[256];
      unsigned char cksum=nbytes+addr+(addr>>8)+type;
      for(unsigned int i=0; i<nbytes; i++)
	{
	  unsigned int d=0;
	  if(sscanf(s,"%02x",&d)!=1)
	    {  fprintf(stderr,"%s:%d: format violation (3)\n",
		       path,line);
	      return(1);  }
	  s+=2;
	  data[i]=d;
	  cksum+=d;
	}
      unsigned int file_cksum=0;
      if(sscanf(s,"%02x",&file_cksum)!=1)
	{  fprintf(stderr,"%s:%d: format violation (4)\n",path,line);
	  return(1);  }
      if((cksum+file_cksum)&0xff)
	{  fprintf(stderr,"%s:%d: checksum mismatch (%u/%u)\n",
		   path,line,cksum,file_cksum);  return(1);  }
      if(writeRAM(addr,data,nbytes)>0)
	{
	  return(0);
	} // was 1 originally?
    }
  else if(type==1)
    {
      // EOF marker. Oh well, trust it.
      return(-1);
    }
  else
    {
      fprintf(stderr,"%s:%d: Unknown entry type %d\n",path,line,type);
      return(1);
    }

  return(0);
}

int aesFx2Dev::programIHexFile(const char *path)
{
  if(!is_open())
    {  log.add("ProgramIHexFile: Not connected!", NO_HANDLE, ERROR_VBS);
      return(NO_HANDLE);
    }

  FILE *fp=fopen(path,"r");
  if(!fp)
    {  log.add("Failed to open file.", FILE_NOT_FOUND, ERROR_VBS);
      return(FILE_NOT_FOUND);
    }

  int n_errors=0;

  const size_t buflen=1024;  // Hopefully much too long for real life...
  char buf[buflen];
  int line=1;
  for(;;++line)
    {
      *buf='\0';
      if(!fgets(buf,buflen,fp))
	{
	  if(feof(fp))
	    {  break;  }
	  fprintf(stderr,"Reading %s (line %d): %s\n",path,line,
		  strerror(ferror(fp)));
	  fclose(fp);  fp=NULL;
	  return(3);
	}

      int rv=programIHexLine(buf,path,line);
      if(rv<0)  break;
      if(rv)
	{  ++n_errors;  }
    }

  if(fp)
    {  fclose(fp);  }
  //cerr << "nerrors: " << n_errors << endl;
  return(n_errors ? -1 : 0);
}

int aesFx2Dev::configureFX2(const char *path)
{
  if(!is_open())
    {  log.add("configureFX2: device not opened", NO_HANDLE, ERROR_VBS);
      return(NO_HANDLE);
    }

  int rv = reset();
  rv = programIHexFile(path);
  if (rv) {
    log.add("configureFX2, cannot configure device", rv, ERROR_VBS);
    return rv;
  }
  rv = run();
  closeDev(); // Necessary to regain handle on the device, otherwise
              // errors occurs when trying to talk to it
  openDev(get_vid(), get_pid(), get_idx());
  return rv;
}

int aesFx2Dev::testEEPROM(const unsigned char *testByteOut,
				 const unsigned char *testByteIn)
{
  if (!is_open()) {
    cerr << "is open: " << is_open() << endl;
    log.add("testEEPROM: Not connected!", NO_HANDLE, ERROR_VBS);
    return(NO_HANDLE);
  }

  int rv = 0;
  size_t dl_addr = 0;
  size_t bs = 1;
  rv = do_usb_command(EP0_WRITE, 0xb1, dl_addr, 0, testByteOut, bs, 1000);
  rv = do_usb_command(0xc0, 0xb1, dl_addr, 0, testByteIn, bs, 1000);

  return(rv);
}

int aesFx2Dev::testEEPROM2(const unsigned char *testByteOut,
				  const unsigned char *testByteIn,
				  size_t nbytes)
{
  if (!is_open()) {
    cerr << "is open: " << is_open() << endl;
    log.add("testEEPROM: Not connected!", NO_HANDLE, ERROR_VBS);
    return(NO_HANDLE);
  }

  int rv = 0;
  size_t addr = 8;
  size_t bs = nbytes;
  rv = writeEEPROM1(addr, testByteOut, bs);
  if (rv != 0) return EEPROM_ERROR;
  rv = readEEPROM(addr, testByteIn, bs);
  return rv;
}

// writeEEPROM1
// write to EEPROM using vendor commands directly
int aesFx2Dev::writeEEPROM1(size_t addr,const unsigned char *data,
			       size_t nbytes)
{
  if (!is_open()) {
    log.add("writeEEPROM: device not connected!", NO_HANDLE, ERROR_VBS);
    return(NO_HANDLE);
  }

  int rv = 0;

  const size_t chunk_size=64;
  const unsigned char *d=data;
  const unsigned char *dend=data+nbytes;
  while(d<dend) {
    size_t bs=dend-d;
    if(bs>chunk_size)  bs=chunk_size;
    size_t dl_addr=addr+(d-data);
    log.add("Writing to EEPROM, number of bytes: ", bs, NOISE_VBS);
    rv = do_usb_command(EP0_WRITE, VC_EEPROM, dl_addr, 0, d, bs, 1000);
    if (rv < 0) {
      log.add("Error when writing to EEPROM: ", rv, ERROR_VBS);
      return rv;
    }
    else if (rv != bs) {
      log.add("Bytes writen to EEPROM: ", rv, ERROR_VBS);
      log.add("instead of:             ", bs, ERROR_VBS);
      return EEPROM_ERROR;
    }
    d+=bs;
    log.add("Wrote to EEPROM, number of bytes: ", rv, NOISE_VBS);
  }
  return 0;
}

// writeEEPROM2
// write to EEPROM using I2C function
int aesFx2Dev::writeEEPROM2(uint16_t addr,const uint8_t *const data,
			    int nbytes)
{
  if (!is_open()) {
    log.add("writeEEPROM: device not connected!", NO_HANDLE, ERROR_VBS);
    return(NO_HANDLE);
  }

  int rv = 0;
  const uint8_t *data_ptr = data;
  const uint8_t *lastData_ptr = data + nbytes;
  uint16_t currentAddr = addr;
  uint8_t dataBuf[MAX_EP0_DATA];
  uint16_t bufSize;

  while(data_ptr < lastData_ptr) {
    if( (lastData_ptr - data_ptr) > (MAX_EP0_DATA - 2) ) {
      bufSize = MAX_EP0_DATA;                  // ^ Need to leave room for the 2 address bytes
    }
    else bufSize = lastData_ptr - data_ptr + 2;
    dataBuf[0] = (currentAddr >> 8);
    dataBuf[1] = (uint8_t)currentAddr;
    for (int i = 0; i < (bufSize - 2); i++) {
      dataBuf[i+2] = *data_ptr++;
    }
    log.add("Writing to EEPROM, number of bytes: ", bufSize, NOISE_VBS);

    //rv = do_usb_command(EP0_WRITE, 0xb1, 0, 0, testData, 10, 1000);
    rv = writeI2C(0x51, dataBuf, bufSize);
    if (rv < 0) {
      log.add("Error when writing to EEPROM: ", rv, ERROR_VBS);
      return rv;
    }
    else if (rv != bufSize) {
      log.add("Bytes writen to EEPROM: ", rv, ERROR_VBS);
      log.add("Instead of:             ", bufSize, ERROR_VBS);
      return EEPROM_ERROR;
    }
    currentAddr += bufSize-2; // Don't count the 2 address bytes contained in the buffer
    cout << "current address after first write: " << currentAddr << endl;
    log.add("Wrote to EEPROM, number of bytes: ", rv, NOISE_VBS);
  }
  return 0;
}

int aesFx2Dev::programEEPROM(const char *fFile)
{
  if(!is_open())
    {  log.add("programBinFile: device not opened", NO_HANDLE, ERROR_VBS);
      return(NO_HANDLE);
    }

  // Open file for reading, this is the binary version of the RAM file
  // and set position at end of file (ate)
  ifstream  binFile(fFile, ios::in | ios::binary | ios::ate);
  if (binFile == 0) {
    log.add("Error! Input file not found", ERROR_VBS);
    return FILE_NOT_FOUND;
  }
  int fileSize = binFile.tellg(); // we are at the end of the file
  binFile.seekg(0, ios::beg); // now that we have the size we go back to the
                              // beginning of the file

  uint16_t start_addr = 0x00;
  unsigned char * dataOut;
  dataOut = new unsigned char[fileSize];

  binFile.read(reinterpret_cast<char*>(dataOut), fileSize);

  if ((dataOut[0] != 0xc2) && (dataOut[0] != 0xc0)) {
    log.add("Error, not a boot EEPROM file!", ERROR_VBS);
    log.add("dataOut[0] = ", (int)dataOut[0], ERROR_VBS);
    return EEPROM_ERROR;
  }

  //int rv = 0;
  // Using writeEEPROM1 for now as there is a bug in writeEEPROM2 (or rather writeI2C)
  int rv = writeEEPROM1(start_addr, (const unsigned char*)dataOut, fileSize);
  //int rv = writeEEPROM2(start_addr, (const unsigned char*)dataOut, fileSize);
  //int rv = writeEEPROM2(start_addr, (const unsigned char*)dataOut, 10);

  // Reading first few bytes of EEPROM for debug
  unsigned char * dataReadBack;
	int length = 8;
  dataReadBack = new unsigned char[length];
  for (int i = 0 ; i < length; i++) dataReadBack[i] = 99;
  readEEPROM(0, dataReadBack, length);
  cout << "First EEPROM " << length << " bytes: " << endl;
  for (int i = 0; i < length; i++) {
    cout << (int)dataReadBack[i] << ' ';
  }
  cout << endl;

  return rv;
}

int aesFx2Dev::readEEPROM(size_t addr, const unsigned char *data,
			       size_t nbytes)
{
  if (!is_open()) {
    log.add("readEEPROM: Not connected!", NO_HANDLE, ERROR_VBS);
    return(NO_HANDLE);
  }

  int rv = 99;

  const size_t chunk_size=64;
  const unsigned char *d=data;
  const unsigned char *dend=data+nbytes;
  while(d<dend) {
    size_t bs=dend-d;
    if(bs>chunk_size)  bs=chunk_size;
    size_t dl_addr=addr+(d-data);
    rv = do_usb_command(EP0_READ, 0xb1, dl_addr, 0, d, bs, 1000);
    if (rv < 0) {
      log.add("Error when reading from EEPROM: ", rv, ERROR_VBS);
      return rv;
    }
    else if (rv != bs) {
      log.add( "Bytes read from EEPROM: ", rv , ERROR_VBS);
      log.add( "Instead of: ", bs, ERROR_VBS);
      return EEPROM_ERROR;
    }
    d+=bs;
  }
  return 0;
}

int aesFx2Dev::bulkTransfer(unsigned char *buf, int bufSize,
														unsigned char ep, int timeout)
{
  int rv = 99;
  uint16_t bufSizeLtd = 0;
  unsigned char *cur_data_ptr = buf;
  int dataSize = bufSize;
	int maxSize;
  if(!is_open())
    {  log.add("bulkTransfer: device not opened", NO_HANDLE, ERROR_VBS);
      return(NO_HANDLE);
    }
  //  unsigned char ep;
  // (the end point defines a in or out communication)
  //   if (strcmp(ep, "OUT_EP2") == 0) { *ep = 0x02; } // end point buffer 2
  //   else if (strcmp(ep, "OUT_EP4") == 0)  { *ep = 0x04; } // end point buffer 4
  //   else if (strcmp(ep, "IN_EP6") == 0)  { *ep = 0x86; } // end point buffer 6
  //   else if (strcmp(ep, "IN_EP8") == 0)  { *ep = 0x88; } // end point buffer 8
  //   else return 1; // direction error

  switch(ep) {
  case EP2:
    maxSize = MAX_EP2_DATA;
    break;
  case EP4:
    maxSize = MAX_EP4_DATA;
    break;
  case EP6:
    maxSize = MAX_EP6_DATA;
    break;
  case EP8:
    maxSize = MAX_EP8_DATA;
    break;
  default:
    maxSize = 512;
    break;
  }

  while (dataSize > 0) {
    if (dataSize > maxSize) {
      bufSizeLtd = maxSize;
    }
    else {
      bufSizeLtd = dataSize;
    }
    dataSize -= bufSizeLtd;
    rv = ep_bulk(cur_data_ptr, bufSizeLtd, ep, timeout);
    if(rv)
      {
	log.add("Failed to transfer bulk load", rv, ERROR_VBS);
	break;
      }
    cur_data_ptr += bufSizeLtd;
  }
  return rv;
}

int aesFx2Dev::writeI2C(unsigned char devAddr,
			unsigned char *data_ptr, int dataLen)
{
  if(!is_open())
    {  log.add("writeI2C: device not opened", NO_HANDLE, ERROR_VBS);
      return(NO_HANDLE);
    }
  int rv = 99;
  int leftToSend = dataLen;
  unsigned short dataLenLtd = 0;
  unsigned short index = 1;
  unsigned char *curData_ptr = data_ptr;

  // Start I2C write
  if (dataLen <= MAX_EP0_DATA) {
    index = SHORT_I2C_TRF;
    dataLenLtd = (unsigned short)dataLen;
  }
  else {
    index = START_I2C_TRF;
    dataLenLtd = MAX_EP0_DATA;
  }
  log.add("Transmitting I2C bytes: ", dataLenLtd, NOISE_VBS);
  rv  = do_usb_command(EP0_WRITE, VC_I2C, (unsigned short)devAddr, index,
		       curData_ptr, dataLenLtd, 1000);
  if(rv != dataLenLtd)
    {
      log.add("Failed to transfer I2C load: ", rv, ERROR_VBS);
    }
  curData_ptr += dataLenLtd;
  leftToSend -= dataLenLtd;
  log.add("Bytes left to send over the I2C: ", leftToSend, NOISE_VBS);
  while (leftToSend > 0) {
    if (leftToSend > MAX_EP0_DATA) { // More than 1 EP0 transfer required
      dataLenLtd = MAX_EP0_DATA;
      index = MORE_I2C_TRF; // Carry on
    }
    else {
      dataLenLtd = (unsigned short)leftToSend;
      index = LAST_I2C_TRF; // Last transfer (tells the uC to add a stop at
      // the end)
    }
    log.add("Transmitting I2C bytes: ", dataLenLtd, NOISE_VBS);
    rv  = do_usb_command(EP0_WRITE, VC_I2C, (unsigned short)devAddr, index,
			 curData_ptr, dataLenLtd, 1000);
    if(rv != dataLenLtd)
      {
	log.add("Failed to transfer I2C load: ", rv, ERROR_VBS);
      }
    curData_ptr += dataLenLtd;
    leftToSend -= dataLenLtd;
    log.add("Bytes left to send over the I2C: ", leftToSend, NOISE_VBS);
  }
  return rv;
}

int aesFx2Dev::readI2C(unsigned char devAddr,
		       unsigned char *data_ptr, int dataLen)
{
  int rv = 99;
  int leftToReceive = dataLen;
  unsigned short dataLenLtd = 0;
  unsigned short index = 99;
  unsigned char *curData_ptr = data_ptr;

  if(!is_open()) {
    log.add("writeI2C: device not opened", NO_HANDLE, ERROR_VBS);
    return(NO_HANDLE);
  }

  // Send read command with a stop at the very end
  if (dataLen < MAX_EP0_DATA) { // The whole payload fits an EP0 transfer
    log.add("Short I2C read for a combined frame", NOISE_VBS);
    index = SHORT_I2C_TRF;
    dataLenLtd = dataLen;
    //     log.add("Receiving I2C bytes: ", dataLenLtd, NOTE_VBS);
    //     rv  = do_usb_command(EP0_READ, VC_I2C, (unsigned short)devAddr, index,
    // 			 curData_ptr, dataLenLtd, 1000);
    //     if(rv != dataLenLtd)
    //       {
    // 	log.add("Failed to receive I2C load: ", rv, ERROR_VBS);
    //       }
    //     log.add("Received byte: ", (int)*curData_ptr, NOISE_VBS);
  }
  else { // The payload requires more than 1 EP0 transfer
    index = START_I2C_TRF;
    if (leftToReceive == MAX_EP0_DATA+1) { // Special case, the uC I2C
      // routines require a flag set when the data before last is
      // encountered. This would be difficult to achieve if the last EP0
      // transfer is of length 1. in this case shorten the one before
      // last EP0 transfer to ensure the last one is at least of length
      // 2.
      dataLenLtd = MAX_EP0_DATA-1;
    }
    else {
      dataLenLtd = MAX_EP0_DATA;
    }
  }
  log.add("Receiving I2C bytes: ", dataLenLtd, NOISE_VBS);
  rv  = do_usb_command(EP0_READ, VC_I2C, (unsigned short)devAddr, index,
		       curData_ptr, dataLenLtd, 1000);
  if(rv != dataLenLtd)
    {
      log.add("Failed to receive I2C load: ", rv, ERROR_VBS);
    }
  curData_ptr += dataLenLtd;
  leftToReceive -= dataLenLtd;
  log.add("Bytes left to receive over the I2C: ", leftToReceive,
	       NOISE_VBS);

  while (leftToReceive > 0) {
    if (leftToReceive == MAX_EP0_DATA+1) { // Special case, the uC I2C
      // routines require a flag set when the data before last is
      // encountered. This would be difficult to achieve if the last EP0
      // transfer is of length 1. in this case shorten the one before
      // last EP0 transfer to ensure the last one is at least of length
      // 2.
      dataLenLtd = MAX_EP0_DATA-1;
      index = MORE_I2C_TRF;
    }
    else if (leftToReceive > MAX_EP0_DATA) {
      dataLenLtd = MAX_EP0_DATA;
      index = MORE_I2C_TRF; // Carry on
    }
    else { // 64 bytes or less left to transfer (fits in 1 EP0 tranfer)
      dataLenLtd = (unsigned short)leftToReceive;
      index = LAST_I2C_TRF; // Last transfer
    }
    log.add("Receiving I2C bytes: ", dataLenLtd, NOISE_VBS);
    rv  = do_usb_command(EP0_READ, VC_I2C, (unsigned short)devAddr, index,
			 curData_ptr, dataLenLtd, 1000);
    if(rv != dataLenLtd)
      {
	log.add("Failed to receive I2C load: ", rv, ERROR_VBS);
      }
    curData_ptr += dataLenLtd;
    leftToReceive -= dataLenLtd;
    log.add("Bytes left to receive over the I2C: ", leftToReceive,
		 NOISE_VBS);
  }
  return rv;
}

int aesFx2Dev::combinedI2C(unsigned char devAddr,
			   unsigned char *writeData_ptr, int writeDataLen,
			   unsigned char *readData_ptr, int readDataLen)
{
  int rv = 99;
  int leftToSend = writeDataLen;
  unsigned short dataLenLtd = 0;
  unsigned short index = 0;
  unsigned char *curData_ptr = writeData_ptr;

  if(!is_open()) {
    log.add("writeI2C: device not opened", NO_HANDLE, ERROR_VBS);
    return(NO_HANDLE);
  }

  // Send write command with no stop
  // Start I2C write
    index = START_I2C_TRF;
  if (writeDataLen <= MAX_EP0_DATA) {
    log.add("Short I2C transfer for a combined frame", NOISE_VBS);
    dataLenLtd = (unsigned short)writeDataLen;
  }
  else {
    log.add("Start of I2C transfer for a combined frame", NOISE_VBS);
    dataLenLtd = MAX_EP0_DATA;
  }
  log.add("Transmitting I2C bytes: ", dataLenLtd, NOISE_VBS);
  rv  = do_usb_command(EP0_WRITE, VC_I2C, (unsigned short)devAddr, index,
		       curData_ptr, dataLenLtd, 1000);
  if(rv != dataLenLtd) {
    log.add("Failed to transfer I2C load: ", rv, ERROR_VBS);
  }
  curData_ptr += dataLenLtd;
  leftToSend -= dataLenLtd;
  log.add("Bytes left to send over the I2C: ", leftToSend, NOISE_VBS);
  if (writeDataLen <= MAX_EP0_DATA) {
    while (leftToSend > 0) {
      if (leftToSend > MAX_EP0_DATA) { // 64 bytes is the max EP0 payload
	dataLenLtd = MAX_EP0_DATA;
      }
      else {
	dataLenLtd = (unsigned short)leftToSend;
      }
      log.add("Transmitting I2C bytes: ", dataLenLtd, NOISE_VBS);
      rv  = do_usb_command(EP0_WRITE, VC_I2C, (unsigned short)devAddr, index,
			   curData_ptr, dataLenLtd, 1000);
      if(rv != dataLenLtd)
	{
	  log.add("Failed to transfer I2C load: ", rv, ERROR_VBS);
	}
      curData_ptr += dataLenLtd;
      leftToSend -= dataLenLtd;
      log.add("Bytes left to send over the I2C: ", leftToSend, NOISE_VBS);
    }
  }
  // Then send a read command with a stop at the very end
  rv = readI2C(devAddr, readData_ptr, readDataLen);
  return rv;
}

