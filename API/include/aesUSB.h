/******************************************************************************
File name: aesUSB.h
===============================================================================
DESCRIPTION

USB utilities

===============================================================================
CHANGES

V1.4.3: Changed libusb-1.0 to libusbx-1.0 for Windows only.
V1.4.4: Removed unistd.h
V1.4.5: Re-added unistd.h but for Linux only
v1.4.6: libusbx-1.0 is back to libusb-1.0

===============================================================================
NOTES


===============================================================================

Copyrights (C) 2011-2016 Aessent Technology Ltd

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


#ifndef AESUSB_H
#define AESUSB_H

#include <iostream>
#include <fstream>
#include <cstdio>
#include <cassert>
#include <string>
#include <aesLog.h>

#ifdef _WIN32
 #include <libusb-1.0/libusb.h>
 #include <windows.h>
 #define msleep(x) Sleep(x)
#else
 #include <unistd.h>
 #include <libusb-1.0/libusb.h>
 #define msleep(x) usleep(x*1000)
#endif

#define MAX_EP0_DATA 64
#define EP0_READ     0XC0
#define EP0_WRITE    0x40

#define AESUSB_LOG   "aesUSB.log"

using namespace std;

class usbDev {

 public:
  usbDev();
  usbDev(string lfn);
  usbDev(int init_vid, int init_pid, string lfn);
  usbDev(int init_vid, int init_pid, int init_idx, string lfn);
  usbDev(int init_vid, int init_pid, int init_idx, int init_vbs, string lfn);
  ~usbDev();

  enum errorCode {AESUSB_NO_HANDLE_ERR = 1, AESUSB_SET_CONF_ERR, AESUSB_BULK_ERR, AESUSB_RST_ERR};

// setters:
	void set_vid(int newVid);
	void set_pid(int newPid);
	void set_idx(int newIdx);
	void set_vbs(int newVbs);
	void set_log_file(string logFileName);
	void set_log_file(string logFileName, int newVbs);

// getters:
	int get_vid();
	int get_pid();
	int get_idx();
	int get_vbs();

  // Open usb device; will close previous one.
  // Returns 0 on success; 1 on error.
  int openDev(int vid, int pid, int idx);
  // Close device. Returns 0 on success.
  int closeDev();
  int claim_interface();
  int check_kernel_status();
  int set_interface(int iface, int alt);
  bool is_open();
  void set_debug_level(int n); // level 0 to 3
  int do_usb_command(unsigned char type, unsigned char request, 
		     unsigned short value, unsigned short index, 
		     const unsigned char* buf, unsigned short length,
		     int timeout=1000 );
  int clear_halt(char ep);
  int usbReset();
  int set_configuration(int config);
  int ep_bulk(unsigned char* buf, int size, unsigned char ep, int timeout);
  /*
  void msg_handling(string errorDescription, int errorCode,
		    verbosity setVbs=MUTE);
  void msg_handling(string errorDescription, string msg,
		    verbosity setVbs=MUTE);
  void msg_handling(string errorDescription, verbosity setVbs=MUTE);
  */
  aesLog log;

 private:
  /* open vid = vendor id, pid = product id
   * idx = nth device if there are more than one.
   * Opens device with vid,pid and claims alt 0 of interface 0 */
  int open(int vid, int pid, int idx=0);
  int close();

  //ofstream logFile;

  libusb_context* libusb_ctx;
  libusb_device_handle* dev_handle;
  int interface,alt_setting;
  int vid;
  int pid;
  int idx;
  int vbs;
};

#endif
