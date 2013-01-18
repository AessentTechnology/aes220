int writeEEPROM(size_t addr,const unsigned char *data,
			       size_t nbytes)
{
  if (!fx2Dev.is_open()) {
    cerr << "is open: " << fx2Dev.is_open() << endl;
    error_handling("writeEEPROM: Not connected!", NO_HANDLE);
    return(NO_HANDLE);
  }
	
  int rv = 0;
	
  const size_t chunk_size=96; // maximum packet payload
  const unsigned char *d=data; // point to start of array
  const unsigned char *dend=data+nbytes; // point to end of payload
  while(d<dend) { // while we haven't reached the end of the array
    size_t bs=dend-d; // what's left to be transmitted
    if(bs>chunk_size)  bs=chunk_size; // don't send more than max packet size
    size_t dl_addr=addr+(d-data); // 
    cout << "About to write " << bs << " bytes to EEPROM" << endl;
    rv = fx2Dev.do_usb_command(d, 0x40, 0xb1, dl_addr, 0, bs, 1000);
    if (rv != bs) {
    cout << "Wrote " << rv << " to EEPROM" << endl;
    return rv;
    }
    d+=bs;
  }	
  return(rv);
}


int usbDev::do_usb_command(const unsigned char* buf, unsigned char type, 
			   unsigned char request, unsigned short value,
			   unsigned short index, unsigned short length,
			   int timeout)
{
  if (!is_open()) {
    error_handling("Device not opened when trying to set interface", NO_HANDLE);
    return NO_HANDLE;
  }

  int rv = libusb_control_transfer (
				dev_handle,
				type,
				request,
				value,
				index,
				(unsigned char*)buf,
				length,
				timeout);
  return rv;
}
