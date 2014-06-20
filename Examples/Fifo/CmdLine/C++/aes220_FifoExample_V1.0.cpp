/******************************************************************************
File name: aes220_FifoExample.cpp
===============================================================================
DESCRIPTION

Sends a number of payloads out and reads a number of payloads back in.

===============================================================================
CHANGES


===============================================================================
NOTES


===============================================================================

Copyright (C) 2012-2013 Sebastien Saury, Aessent Technology Ltd

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
#include <aes220_CppAPI.h>

using namespace std;

#define PAYLOAD_OUT      512
#define PAYLOAD_IN       512
#define NB_OF_PLD_OUT    4
#define NB_OF_PLD_IN     4
int main() {

  int rv = 99;

  uint8_t inBuf[NB_OF_PLD_IN][PAYLOAD_IN];
  uint8_t outBuf[NB_OF_PLD_OUT][PAYLOAD_OUT];
  uint8_t *inBuf_ptr;
  uint8_t *outBuf_ptr;

  inBuf_ptr = &inBuf[0][0];
  outBuf_ptr = &outBuf[0][0];

  int idx = 0;      // Module ID 0 if only aes220 module plugged in
  int vbs = 3;      // Messages verbosity, min = 0, max = 9

  cout << endl << "aes220 C++ FIFO example" << endl;
  cout << endl;

  // Create an aes220 device object and open it
  aes220_Dev aes220;
  aes220.Open(idx,vbs);

  for (int i = 0; i < PAYLOAD_OUT*NB_OF_PLD_OUT; i++) {
    *outBuf_ptr = i+1;  // Initialise the output buffer with increasing numbers
    ++outBuf_ptr;
  }

  for (int i = 0; i < PAYLOAD_IN*NB_OF_PLD_IN; i++) {
    *inBuf_ptr = 0xF0; // Initialise the input buffer to a constant value
    ++inBuf_ptr;
  }

  // Sending x payloads (x being NB_OF_PLD_OUT)
  for (int payload = 0; payload < NB_OF_PLD_OUT; payload++) {
    // Send out buffer's contents through pipe 3 with address 3
    // Address needs to match address in the vhdl file
    int outPipe1 = 0x01;
    cout << "Sending buffer containing " << PAYLOAD_OUT << " bytes via pipe " << outPipe1 << "."
	 << endl;
    outBuf_ptr = &outBuf[payload][0];
    rv = aes220.PipeOut(outBuf_ptr, PAYLOAD_OUT, outPipe1);
    if (rv == 0) {
      cout << "Bytes sent OK." << endl;
      // Display the data sent
      cout << "Bytes sent for payload " << payload+1 << " : " << endl;
      cout << (int)outBuf[payload][0];
      for (int i = 1; i < PAYLOAD_OUT; i++) {
	cout << ", " << (int)outBuf[payload][i];
      }
      cout << endl;

    }
    else {
      cout << "Error while sending bytes!" << endl;
      return rv;
    }
  }

  // Receiving x payloads (x being NB_OF_PLD_in)
  for (int payload = 0; payload < NB_OF_PLD_IN; payload++) {
    // Now receive the bytes back via pipe 4 with address 4
    // Address needs to match address in the vhdl file
    if (PAYLOAD_IN != 0) {
      int inPipe4 = 0x04;
      cout << "Receiving buffer containing " << PAYLOAD_IN << " bytes via pipe " << inPipe4 << "."
	   << endl;
      inBuf_ptr = &inBuf[payload][0];
      rv = aes220.PipeIn(inBuf_ptr, PAYLOAD_IN, inPipe4);
      if (rv == 0) {
	cout << "Bytes received OK." << endl;
      }
      else {
	cout << "Error while receiving bytes!" << endl;
	return rv;
      }

      // Display the data received
      cout << "Bytes received for payload " << payload+1 << " : " << endl;
      cout << (int)inBuf[payload][0];
      for (int i = 1; i < PAYLOAD_IN; i++) {
	cout << ", " << (int)inBuf[payload][i];
      }
      cout << endl;
    }
  }

#ifdef _WIN32
  char endChar;
  cout << "Enter a character to finish: ";
  cin >> endChar;
#endif

 // Close the device when no longer required
  aes220.Close();

  return rv;
}

