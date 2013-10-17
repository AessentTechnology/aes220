/******************************************************************************
File name: aes220_FifoExample.c
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

#include <stdio.h>
#include <aes220_API.h>

#define PAYLOAD_OUT      512
#define PAYLOAD_IN       512
#define NB_OF_PLD_OUT    4
#define NB_OF_PLD_IN     4
int main() {

  int rv = 99;

  unsigned char inBuf[NB_OF_PLD_IN][PAYLOAD_IN];
  unsigned char outBuf[NB_OF_PLD_OUT][PAYLOAD_OUT];
  unsigned char *inBuf_ptr;
  unsigned char *outBuf_ptr;

  inBuf_ptr = &inBuf[0][0];
  outBuf_ptr = &outBuf[0][0];

  int idx = 0;      // Module ID 0 if only aes220 module plugged in
  int vbs = 3;      // Messages verbosity, min = 0, max = 9

  printf("\naes220 C FIFO example\n");

  // Open the device and declare a handle pointing to it
  aes220_handle *aes220_ptr = aes220_Open(idx, vbs);

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
    // Send out buffer's contents through pipe 1 with address 1
    // Address needs to match address in the vhdl file
    int outPipe1 = 0x01;
    printf("Sending buffer containing %d bytes via pipe %d.\n ", PAYLOAD_OUT, outPipe1);
    outBuf_ptr = &outBuf[payload][0];
    rv = aes220_Pipe_Out(aes220_ptr, outBuf_ptr, PAYLOAD_OUT, outPipe1);
    if (rv == 0) {
      printf("Bytes sent OK.\n");
      // Display the data sent
      printf("Bytes sent for payload %d : \n%d", payload+1, outBuf[payload][0]);
      for (int i = 1; i < PAYLOAD_OUT; i++) {
	printf(", %d", outBuf[payload][i]);
      }
      printf("\n");

    }
    else {
      printf("Error while sending bytes!\n");
      return rv;
    }
  }

  // Receiving x payloads (x being NB_OF_PLD_in)
  for (int payload = 0; payload < NB_OF_PLD_IN; payload++) {
    // Now receive the bytes back via pipe 2 with address 2
    // Address needs to match address in the vhdl file
    if (PAYLOAD_IN != 0) {
      int inPipe2 = 0x02;
      printf("Receiving buffer containing %d bytes via pipe %d.\n", PAYLOAD_IN, inPipe2);
      inBuf_ptr = &inBuf[payload][0];
      rv = aes220_Pipe_In(aes220_ptr, inBuf_ptr, PAYLOAD_IN, inPipe2);
      if (rv == 0) {
	printf("Bytes received OK.\n");
      }
      else {
	printf("Error while receiving bytes!\n");
	return rv;
      }

      // Display the data received
      printf("Bytes received for payload %d : \n%d", payload+1, inBuf[payload][0]);
      for (int i = 1; i < PAYLOAD_IN; i++) {
	printf(", %d", inBuf[payload][i]);
      }
      printf("\n");
    }
  }

#ifdef _WIN32
  printf("Enter a character to finish: ");
  getchar();
#endif

 // Close the device when no longer required
  aes220_Close(aes220_ptr);

  return rv;
}

