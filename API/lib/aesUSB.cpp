/******************************************************************************
File name: aesUSB.cpp
===============================================================================
DESCRIPTION

USB utilities

===============================================================================
CHANGES

Pre release
V1.3.2: Lower the time between retries when opening an USB device in openDev
        from 1s to 0.2s. 
Post release
V1.4.0: First release
V1.4.2: Changing log reporting (now using aesLog_V0.0.2)

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

#include <aesUSB.h>

usbDev::usbDev():log(AESUSB_LOG, 0), dev_handle(NULL), vid(0), pid(0), idx(0), vbs(0)
{
  int libusb_vbs = 0;
  int rv = 99;
  rv=libusb_init(&libusb_ctx);
  if (rv !=0) {
    
    log.add("Cannot initialise usb device ", ERROR_VBS);
    //log.add(libusb_error_name(rv), ERROR_VBS); 
    // Does not work with windows, need to update libusb
  }
  libusb_set_debug(libusb_ctx,libusb_vbs);
}
usbDev::usbDev(string lfn):log(lfn, 0), dev_handle(NULL),
					 vid(0), pid(0), idx(0), vbs(0)
{
  int libusb_vbs = 0;
  int rv = 99;
  rv=libusb_init(&libusb_ctx);
  if (rv !=0) {
    
    log.add("Cannot initialise usb device ", rv, ERROR_VBS);
  }
  libusb_set_debug(libusb_ctx,libusb_vbs);
}
usbDev::usbDev(int init_vid, int init_pid, string lfn):log(lfn, 0), dev_handle(NULL),
					   vid(init_vid), pid(init_pid), idx(0), vbs(0)
{
  int libusb_vbs = 0;
  int rv = 99;
  rv=libusb_init(&libusb_ctx);
  if (rv !=0) {
    log.add("Cannot initialise usb device ", rv, ERROR_VBS);
  }
  libusb_set_debug(libusb_ctx,libusb_vbs);
  rv = openDev(vid, pid, idx);
  if (rv != 0) {
    log.add("Cannot open usb device ", rv, ERROR_VBS);
  }
}

usbDev::usbDev(int init_vid, int init_pid, int init_idx, string lfn):log(lfn, 0), 
								     dev_handle(NULL),
								     vid(init_vid), pid(init_pid), 
								     idx(init_idx), vbs(0)
{
  int libusb_vbs = 0;
  int rv = 99;
  rv=libusb_init(&libusb_ctx);
  if (rv !=0) {
    log.add("Cannot initialise usb device ", rv, ERROR_VBS);
  }
  libusb_set_debug(libusb_ctx,libusb_vbs);
  rv = openDev(vid, pid, idx);
  if (rv != 0) {
    log.add("Cannot open usb device ", rv, ERROR_VBS);
  }
}

usbDev::usbDev(int init_vid, int init_pid, int init_idx, int init_vbs, string lfn)
 :log(lfn, init_vbs), dev_handle(NULL),
  vid(init_vid), pid(init_pid), 
  idx(init_idx), vbs(init_vbs)
{
  int libusb_vbs = 0;
  int rv = 99;
  rv=libusb_init(&libusb_ctx);
  if (rv !=0) {
    log.add("Cannot initialise usb device ", rv, ERROR_VBS);
  }
  if (vbs == MUTE_VBS) {libusb_vbs = 0;}
  else if (vbs <= NOTE_VBS) {libusb_vbs = 1;} // Get errors from libusb on stderr
  else {libusb_vbs = 3;} // Get errors warnings and messages from libusb on stderr/stdout
  libusb_set_debug(libusb_ctx,libusb_vbs);
  rv = openDev(vid, pid, idx);
  if (rv != 0) {
    log.add("Cannot open usb device ", rv, ERROR_VBS);
  }
  log.add("aes220 constructor done", NOISE_VBS);
}

void usbDev::set_debug_level(int n=3) {
  libusb_set_debug(libusb_ctx,n);
}

usbDev::~usbDev()
{
  log.add("Destructor called", NOISE_VBS);
  if (is_open()) close();
  libusb_exit(libusb_ctx);
}

// setters:
void usbDev::set_vid(int newVid) {vid = newVid;}
void usbDev::set_pid(int newPid) {pid = newPid;}
void usbDev::set_idx(int newIdx) {idx = newIdx;}
void usbDev::set_vbs(int newVbs) {log.setVerbosity(newVbs);}
void usbDev::set_log_file(string logFileName) {log.to(logFileName);}
void usbDev::set_log_file(string logFileName, int newVbs) {
  log.to(logFileName);
  log.setVerbosity(newVbs);}

// getters:
int usbDev::get_vid() {return vid;}
int usbDev::get_pid() {return pid;}
int usbDev::get_idx() {return idx;}
int usbDev::get_vbs() {return vbs;}

bool usbDev::is_open() {
  if (dev_handle != NULL) {
  return true;
  }
  else {
    log.add("Device not opened (no handle).", NOISE_VBS);
    return false;
  }
}



int usbDev::open(int vid,int pid,int idx) {
  libusb_device **list;
  log.add("Getting device list. ", NOISE_VBS);
  int devices = libusb_get_device_list( libusb_ctx, &list );
  log.add("Number of devices found: ", devices, NOISE_VBS);
  int cur_idx = 0;
  log.add("Opening device with vid: ", vid, NOISE_VBS);
  log.add("Opening device with pid: ", pid, NOISE_VBS);
  for ( int i=0;i<devices;++i) {
    libusb_device_descriptor dscr;
    if ( !libusb_get_device_descriptor ( list[i], &dscr ) ) {
      if ( dscr.idVendor == vid && dscr.idProduct == pid ) {
	log.add("Device identified.", NOISE_VBS);
	if ( idx == cur_idx++ ) {
	  log.add("Matching idx", NOISE_VBS);
	  int rv = libusb_open( list[i], &dev_handle);
	  log.add("Returned value from libusb_open: ", rv, NOISE_VBS);
	  if (!rv) {
	    log.add("Checking kernel driver is free", NOISE_VBS);
	    rv = libusb_kernel_driver_active(dev_handle,0);
	    if (rv == 1) {
	      log.add("Kernel driver active, detaching it: ", rv, NOTE_VBS);
	      rv = libusb_detach_kernel_driver(dev_handle,0);
	    }
	    log.add("Claiming interface", NOISE_VBS);
	    rv=libusb_claim_interface(dev_handle,0);
	    if (!rv) {
	      interface=0;
	      log.add("Setting alternative interface", NOISE_VBS);
	      rv=libusb_set_interface_alt_setting(dev_handle,0,0);
	      if (rv) {
		log.add("Error setting alternative interface", rv, ERROR_VBS);
		libusb_close(dev_handle);
		dev_handle=NULL;
	      }
	      else {/*log.add("Interface set", NOISE_VBS);*/};
	      alt_setting=0;
	    }
	    else {
	      log.add("Returned value from libusb_claim_interface ", rv, ERROR_VBS);
	      libusb_close(dev_handle);
	      dev_handle=NULL;
	    }
	  }
	  else {
	    log.add("Unable to open device idx: " , idx, ERROR_VBS);
	    log.add("Error returned from libusb_open: " , rv, ERROR_VBS);
	  }
	}
      }
    }
  }

  if (!dev_handle) {
    log.add("Device not opened", ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }
  log.add("Freeing device list", NOISE_VBS);
  libusb_free_device_list(list,1);
  return 0;
}

int usbDev::close() {
  if (!is_open()) {
    log.add("Device not opened when trying to close device", AESUSB_NO_HANDLE_ERR, ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }
  int rv = libusb_release_interface(dev_handle,interface);
  if (rv) {
    log.add("Close() function, Error trying to release the interface", rv, ERROR_VBS);
    return rv;
  }
  libusb_close(dev_handle);
  dev_handle=NULL;
  interface=0;alt_setting=0;
  log.add("Device closed", NOISE_VBS);
  return 0;
}

int usbDev::openDev(int vid, int pid, int idx)
{
  int breakout = 0;
  log.add("Opening device, attempt number: ", (breakout+1), NOISE_VBS);
  int rv = open(vid, pid, idx);
  while (rv == AESUSB_NO_HANDLE_ERR) {
    msleep(200); // wait for a 0.2 second
    rv = open(vid, pid, idx);
    breakout++;
    if (breakout == 5) {
      log.add("Cannot open the device after attempt ", breakout, ERROR_VBS);
      return 1;
    }
  }
  if(rv) {
    log.add("Failed to open device", rv, ERROR_VBS);
    return(rv);
  }
  else {
    log.add("Attempts to successfully open device: ", (breakout+1), NOISE_VBS);
    return(0);
  }
}

int usbDev::closeDev()
{
  int rv = close();
  if(rv) {
    log.add("Error while closing device", rv, ERROR_VBS);
    return(rv);
  }
  else return(rv);
}

int usbDev::claim_interface()
{
  int rv;
  if (!is_open()) {
    log.add("Device not opened when claiming interface", AESUSB_NO_HANDLE_ERR, ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }
  log.add("Checking kernel driver is free", NOISE_VBS);
  rv = libusb_kernel_driver_active(dev_handle,0);
  if (rv == 1) {
    log.add("Kernel driver active, detaching it", rv, NOTE_VBS);
    rv = libusb_detach_kernel_driver(dev_handle,0);
  }
  log.add("Claiming interface", NOISE_VBS);
  rv=libusb_claim_interface(dev_handle,0);
  if (!rv) {
    interface=0;
    log.add("Setting alternative interface", NOISE_VBS);
    rv=libusb_set_interface_alt_setting(dev_handle,0,0);
    if (rv) {
      log.add("Error setting alternative interface", rv, ERROR_VBS);
      libusb_close(dev_handle);
      dev_handle=NULL;
    }
    else {log.add("Interface set", NOISE_VBS);};
    alt_setting=0;
  }
  else {
    log.add("Returned value from libusb_claim_interface ", rv, ERROR_VBS);
    libusb_close(dev_handle);
    dev_handle=NULL;
  }
  return rv;
}

int usbDev::check_kernel_status()
{
  if (!is_open()) {
    log.add("Device not opened when checking kernel status", AESUSB_NO_HANDLE_ERR, ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }
  int rv = libusb_kernel_driver_active(dev_handle,0);
  return rv;
}

int usbDev::set_interface(int iface, int alt){
  if (!is_open()) {
    log.add("Device not opened when trying to set interface", AESUSB_NO_HANDLE_ERR, ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }
  if (interface != iface) {
    int rv = libusb_release_interface(dev_handle,interface);
    if (!rv){
      log.add("Can't release interface when trying to set it", rv, ERROR_VBS);
      return rv;
    }
    rv=libusb_claim_interface(dev_handle,iface);
    if (!rv) {
      log.add("Can't claim interface when trying to set it", rv, ERROR_VBS);
      return rv;
    }
    this->interface=iface;
  }
  int rv=libusb_set_interface_alt_setting(dev_handle,interface,alt);
  if (!rv) {
    log.add("Cannot set alternative setting interface", rv, ERROR_VBS);
    return rv;
  }
  alt_setting=alt;
  return 0;
}


int usbDev::do_usb_command(unsigned char type, // EP0_READ or EP0_WRITE (0xC0 or 0x40)
			   unsigned char request, // user defined (switch)
			   unsigned short value, // word, (e.g. addresse)
			   unsigned short index, // word, (user defined)
			   const unsigned char* buf, // the data 
			   unsigned short length, // the data length
			   int timeout ) {
  if (!is_open()) {
    log.add("Device not opened when sending vendor command", AESUSB_NO_HANDLE_ERR, ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }

  int rv = libusb_control_transfer (dev_handle, type, request, value, index, (unsigned char*)buf,
				    length, timeout);
  return rv;
}

int usbDev::clear_halt(char ep) {
  if (!is_open()) {
    log.add("Device not opened when trying to clear endpoint halt/stall condition", 
	    AESUSB_NO_HANDLE_ERR, ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }
  int rv = libusb_clear_halt(dev_handle,(unsigned char)ep);
  if (!rv) {
    log.add("Cannot clear endpoint halt/stall condition", rv, ERROR_VBS);
    return rv;
  }
  else return rv;
}

int usbDev::usbReset() 
{
   int libusbRv = 99;

  if (!is_open()) {
    log.add("Device not opened when trying to reset it", AESUSB_NO_HANDLE_ERR, ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }
  log.add("Resetting device.", NOTE_VBS);
  libusbRv = libusb_reset_device(dev_handle);
  if (libusbRv == LIBUSB_ERROR_NO_DEVICE) {
    //    log.add(libusb_error_name(libusbRv), libusbRv, ERROR_VBS);
    // Does not work with windows, need to update libusb
    log.add("Device Changed.  Closing", ERROR_VBS);
    libusb_close(dev_handle);
    interface = 0; alt_setting = 0;
  }
  if (libusbRv) {
    log.add("Device reset failed", libusbRv, ERROR_VBS);
    return AESUSB_RST_ERR;
  }
  else  return 0;
}

int usbDev::set_configuration(int configuration) 
{
  int rv = 99;
  int libusbRv = 99;

  if (!is_open()) {
    log.add("Device not opened when trying to set configuration", AESUSB_NO_HANDLE_ERR, ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }
  /*
    int rv = libusb_release_interface(dev_handle,interface);
    if (rv) {
    log.add("Error trying to release the interface", rv, ERROR_VBS);
    return rv;
    }
  */
  libusbRv = libusb_set_configuration(dev_handle,configuration);
  if (libusbRv) {
    log.add("Error trying to set interface configuration", ERROR_VBS);
    //log.add(libusb_error_name(libusbRv), libusbRv, ERROR_VBS);
    // Does not work with windows, need to update libusb
    rv = AESUSB_SET_CONF_ERR;
  }
  else rv = 0;
  return rv;
}

int usbDev::ep_bulk(unsigned char* buf, int size, unsigned char ep,
		    int timeout)
{
  int transferred;
  int rv = 99;
  int libusbRv = 99;

  if (!is_open()) {
    log.add("Device not opened when trying bulk transfer", AESUSB_NO_HANDLE_ERR, ERROR_VBS);
    return AESUSB_NO_HANDLE_ERR;
  }
  libusbRv = libusb_bulk_transfer ( dev_handle, ep, buf, size, &transferred, timeout );
  if (libusbRv < 0) {
    //log.add(libusb_error_name(rv), libusbRv, ERROR_VBS); rv = AESUSB_BULK_ERR;
    // Does not work with windows, need to update libusb
    if (libusbRv == LIBUSB_ERROR_TIMEOUT) {
      log.add("Transfer Timeout. Bytes transferred ->", transferred, ERROR_VBS); 
      rv = AESUSB_BULK_ERR;
    }
  }
  else rv=0;
  return rv;
}
