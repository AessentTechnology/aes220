/******************************************************************************
File name: aes220_LoopbackCmdLineExample_V1.4.2.cpp
===============================================================================
DESCRIPTION

===============================================================================
CHANGES

V1.4.1: updated title at the top of the file
        added comments
        added end character to prevent terminal window closing dow prematurely
        on Windows
V1.4.2: Made the end character only relevent for Windows compilations

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

#include <iostream>
#include "../../../API/aes220_API.h"

using namespace std;

#define PAYLOAD_OUT 256
#define PAYLOAD_IN  16

int main() {

  int rv = 99;

  unsigned char inBuf[PAYLOAD_OUT];
  unsigned char outBuf[PAYLOAD_OUT];

  int vid = 0x2443; // Aessent Technology USB VID
  int pid = 0x00dc; // aes220 USB PID
  int idx = 0;      // Module ID 0 if only aes220 module plugged in
  int vbs = 3;      // Messages verbosity, min = 0, max = 9

  cout << endl << "aes220_LoopbackCmdLineExample Version 1.4.2" << endl;
  cout << endl;

  // Open the device and declare a handle pointing to it
  aes220_handle *aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs);

  for (int i = 0; i < PAYLOAD_OUT; i++) {
    inBuf[i] = 0xF0; // Initialise the input buffer to a constant value
    outBuf[i] = i;  // Initialise the output buffer with increasing numbers
  }

  // Send out buffer's size (LSB) through pipe 1 with address 1
  // Address needs to match address in the vhdl file
  int outPipe1 = 0x01;
  uint8_t payloadLsbSz = (uint8_t)PAYLOAD_OUT;
  cout << "Sending buffer size LSB " << (int)payloadLsbSz << endl;
  rv = aes220_Pipe_Out(aes220_ptr, &payloadLsbSz, 1, outPipe1);
  if (rv == 0) {
    cout << "Byte sent OK." << endl;
  }
  else {
    cout << "Error while sending byte!" << endl;
    return rv;
  }

  // Send out buffer's size (MSB) through pipe 2 with address 2
  // Address needs to match address in the vhdl file
  int outPipe2 = 0x02;
  uint8_t payloadMsbSz = (uint8_t)(PAYLOAD_OUT>>8);
  cout << "Sending buffer size MSB " << (int)payloadMsbSz << endl;
  rv = aes220_Pipe_Out(aes220_ptr, &payloadMsbSz, 1, outPipe2);
  if (rv == 0) {
    cout << "Byte sent OK." << endl;
  }
  else {
    cout << "Error while sending byte!" << endl;
    return rv;
  }

  // Send out buffer's contents through pipe 3 with address 3
  // Address needs to match address in the vhdl file
  int outPipe3 = 0x03;
  cout << "Sending buffer containing " << PAYLOAD_OUT << " bytes via pipe " << outPipe3 << "." << endl;
  rv = aes220_Pipe_Out(aes220_ptr, outBuf, PAYLOAD_OUT, outPipe3);
  if (rv == 0) {
    cout << "Bytes sent OK." << endl;
  }
  else {
    cout << "Error while sending bytes!" << endl;
    return rv;
  }

  // Send out buffer's size (LSB) through pipe 1 with address 1 (to reset counter)
  cout << "Sending buffer size LSB (" << (int)payloadLsbSz << ") to reset counter"<< endl;
  rv = aes220_Pipe_Out(aes220_ptr, &payloadLsbSz, 1, outPipe1);
  if (rv == 0) {
    cout << "Byte sent OK." << endl;
  }
  else {
    cout << "Error while sending byte!" << endl;
    return rv;
  }

  for (int j = 0; j < 10; j++) {
    // Now receive the bytes back via pipe 4 with address 4
    // Address needs to match address in the vhdl file
    int inPipe4 = 0x04;
    rv = aes220_Pipe_In(aes220_ptr, inBuf, PAYLOAD_IN, inPipe4);
    if (rv == 0) {
      cout << "Bytes received OK." << endl;
    }
    else {
      cout << "Error while receiving bytes!" << endl;
      return rv;
    }

    // Display the data received
    cout << "Bytes received: " << endl;
    cout << (int)inBuf[0];
    for (int i = 1; i < PAYLOAD_IN; i++) {
      cout << ", " << (int)inBuf[i];
    }
    cout << endl;
  }

#ifdef _WIN32
  char endChar;
  cout << "Enter a character to finish: ";
  cin >> endChar;
#endif

 // Close the device when no longer required
  aes220_Close_Device(aes220_ptr);

  return rv;
}

