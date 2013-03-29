/******************************************************************************
File name: aes220.c
===============================================================================
DESCRIPTION

Utilities for the aes220 High-Speed USB FPGA mini-module

===============================================================================
CHANGES


===============================================================================
NOTES


===============================================================================
PINOUT
  ____________________________________________________________________________
 |                                                                            |
 |                              ________________________                      |
 |                             |                       |                      |
 |               D0 <> IOA0 <> | PA0               PB0 | <> IOB0 LED6         |
 |               D1 <> IOA1 <> | PA1               PB1 | <> IOB1              |
 |               D2 <> IOA2 <> | PA2               PB2 | <> IOB2              |
 |               D3 <> IOA3 <> | PA3               PB3 | <> IOB3              |
 |               D4 <> IOA4 <> | PA4               PB4 | <> IOB4              |
 |               D5 <> IOA5 <> | PA5               PB5 | <> IOB5              |
 |               D6 <> IOA6 <> | PA6               PB6 | <> IOB6              |
 |               D7 <> IOA7    | PA7               PB7 | <> IOB7              |
 |                             |                       |                      |
 |                     IOD0 <  | PD0                   |                      |
 |                     IOD1  > | PD1            CLKOUT |  > CLKOUT            |
 |                     IOD2 <> | PD2                   |                      |
 |                     IOD3 <> | PD3                   |                      |
 |                     IOD4 <> | PD4                   |                      |
 |                     IOD5 <> | PD5                   |                      |
 |                     IOD6 <> | PD6                   |                      |
 |                     IOD7 <  | PD7            FX2    |                      |
 |                             |_______________________|                      |
 |                                                                            |
 |  ___ 3v3                 _________________________________                 |
 |   |   __       __       |                                 |                |
 |   |--|__|LED2 |__|LED1  |                                 |                |
 |   |    |        |_______| P13                          T9 | < CLKOUT       |
 |   |    |________________| N11                             |                |
 |   |   __       __       |                                 |                |
 |   |--|__|LED4 |__|LED3  |                          PROG_B | < IOD0         |
 |   |    |        |_______| N12                        DONE | > IOD1 LED5    |
 |   |    |________________| P11                   CSI_B  P10 | <>IOD2        |
 |   |                     |                        DOUT R11 | <>IOD3         |
 |   |     _               |                       AWAKE T11 | <>IOD4         |
 |   |   __|__SW1          |                      INIT_B T12 | <>IOD5         |
 |   |__|     |____________| D6                     CCLK R14 | <>IOD6         |
 |   |     _               |                         SUSPEND | < IOD7         |
 |   |   __|__SW2          |                                 |                |
 |   |__|     |____________| E6                              |                |
 |                         |                                 |                |
 |                  IOB0<> | T2 CSO_B                 D7  T5 | <>IOA0  D0     |
 |                  IOB1<> | R2 M2                    D6  T6 | <>IOA1  D1     |
 |                  IOB2<> | T3 VS2                   D5  P7 | <>IOA2  D2     |
 |                  IOB3<> | P4 M0                    D4  N8 | <>IOA3  D3     |
 |                  IOB4<> | R3 RDWR_B                D3 P12 | <>IOA4  D4     |
 |                  IOB5<> | N4 M1                    D2 T13 | <>IOA5  D5     |
 |                  IOB6<> | P5 VS0                   D1 R13 | <>IOA6  D6     |
 |                  IOB7<> | N6 VS1                   D0 T14 | <>IOA7  D7     |
 |                         |                   XC3S200AN     |                |
 |                         |_________________________________|                |
 |                                                                            |
 |                                                                aes220      |
 |____________________________________________________________________________|

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
===============================================================================

******************************************************************************/


#include <stdio.h>

#include <fx2regs.h>
#include <fx2macros.h>
#include <serial.h>
#include <delay.h>
#include <autovector.h>
#include <lights.h>
#include <setupdat.h>
#include <eputils.h>
#include <i2c.h>
#include <aes220.h>

void assertSoftReset()
{
  OEA |= 0x01; // Make sure PA0 is an output
  PA0 = 1; // Reset active level = 1
}

void clearSoftReset()
{
  OEA |= 0x01; // Make sure PA0 is an output
  PA0 = 0; // Reset active level = 1
}

BOOL startFpga() 
{
  // Start the FPGA by resetting it and wait for it to finish its 
  // configuration process.
  BOOL fpgaProgd = FALSE;

  // Configuring the ports
  OEA = 0x00;
  OEB = 0b11101111; // set PB0/1/2/3/5/6/7 as outputs
  OED = 0b10001101; // set PD0/2/3/7 as outputs
  SUSPEND_F = 0;
  PROG_B = 0; // Reset the FPGA (hard reset)

  // Waking up the FPGA
  // Set internal Master SPI mode (fpga boot from Flash)
  M2 = 0; 
  M1 = 1;
  M0 = 1;
  VS2 = 1;
  VS1 = 1;
  VS0 = 1;
  while (INIT_B != 0) {};
  PROG_B = 1; // release reset (hard)
 
  while (INIT_B != 1) {}; // wait for fpga to do its houskeeping

  // Give time to the FPGA to boot up from flash 
  delay(200); // 200ms increased from 100ms or aes220b uC hangs

  //fpgaProgd = TRUE; // Has to be TRUE or the micro-controller will hang when erasing the FPGA
  if (DONE == 1) { fpgaProgd = TRUE; }
  else { fpgaProgd = FALSE; } // Blank Flash or problem during config
  
  // Set ports as input to avoid conflicts with application just
  // configured
  OEA = 0x00; // Port A as input
  OEB = 0x00; // Port B as input
  OED = 0x81; // Port D as input save for PROG_B and SUSPEND_F
  PROG_B = 1;
  SUSPEND_F = 0;

  return fpgaProgd;
}

BYTE setupFpgaConf() 
{
  BYTE fpgaStatus;
  // Configure ports
  // Ports ands signals initialisation:
  OED = 0xC5; // set PD0/2/6/7 as outputs, the rest as inputs
  SUSPEND_F = 0;
  PROG_B = 0; // Reset the FPGA
  OEA = 0xFF; // set port A as outputs (SelectMAP data bus)
  OEB = 0xFF; // set port B as outputs

  INIT_B = 1;
  RDWRB  = 1;
  CSI_B  = 1;    // Chip select signal set permanently to 0 (one 
                 // device only)
  CCLK  = 0;    // sets CCLK low

  M2    = 1;    // M2 = 1 for SelectMap mode 
  M1    = 1;    // M1 = 1 for SelectMap mode
  M0    = 0;    // M0 = 0 for SelectMap mode

  //PROG_B = 0; // reset the fpga
  delay(500); // 500ms
  while (INIT_B != 0) {}; // wait for INIT_B to go low
  PROG_B = 1;             // PROG_B back up
  while (INIT_B != 1) {}; // Wait for INIT_B to do the same
  RDWRB = 0; // select write mode
  CSI_B = 0;  // assert chip select
  delay(500);
  if (DONE == 0) {fpgaStatus = F_READY;}
  else fpgaStatus = F_NOT_READY;
  return fpgaStatus;
}

BYTE configureFpga(DWORD dataLen)
{
  BYTE fpgaStatus = PROG_ERROR;
  volatile WORD bytes;

  fpgaStatus = setupFpgaConf();

  if (fpgaStatus == F_READY) {
    while(dataLen > 0) { 
      if ( !(EP2468STAT & bmEP2EMPTY) ) { // EP2 received data

	WORD i;

	bytes = MAKEWORD(EP2BCH,EP2BCL);

	for (i=0;i<bytes;++i) {
	  IOA = EP2FIFOBUF[i]; // output the byte on port A
	  CCLK = 0;     // tick the clock (low)
	  LED6 = 1;     // flash the LED, why not?
	  CCLK = 1;     // tick the clock (high)
	  LED6 = 0;     // keep flashing this LED
	}
	dataLen -= bytes;
	if ( (INIT_B == 0) & (DONE == 0) ) {
	  fpgaStatus = INIT_B_LOW; // Init_B unexpectedly low
	  LED6 = 1; // turn LED off
	  return fpgaStatus;
	}
	//Re-arm ep2
	REARM();
      }
    }
    //    }
    if (DONE == 1) {
      // Keep the SOFT_RESET active for the time being
      OEA = 0x00; // Port A as input
      assertSoftReset(); // keep soft_reset at one (active)

      CSI_B = 1;  // release chip select
      RDWRB = 1; // release write mode
      // Set ports as input to avoid conflicts with application just
      // downloaded
      OEB = 0x00; // Port B as input
      OED = 0x81; // Port D as input save for PROG_B and SUSPEND_F
      fpgaStatus = PROG_DONE;
    }
    else fpgaStatus = DONE_LOW;
  }
  return fpgaStatus;
}

void setupFpgaProg() 
{
  extern BYTE xdata fpgaStatus;
  // Configure ports
  // Ports ands signals initialisation:
  OEA = 0x00; // set port A as inputs
  OEB = 0xFF; // set port B as outputs
  OED = 0b10001101; // set PD0, PD2, PD3 and PD7 as outputs
  SUSPEND_F = 0;

  PROG_B = 1;
  LOAD_B = 1;    // Shift register load signal set to 1
  CS_B   = 1;    // Chip select signal set to 1
  fpgaStatus = PROG_F_MODE;
}

BYTE progFpga()
{
  extern BYTE xdata fpgaStatus;
  volatile WORD bytes;
  setupFpgaProg();
  if (fpgaStatus != PROG_F_MODE) return 1;
  while(fpgaStatus != PROG_DONE) { 
    if ( !(EP2468STAT & bmEP2EMPTY)) {
      WORD i;
      BYTE ctrlCode;

      bytes = MAKEWORD(EP2BCH,EP2BCL);

      ctrlCode = EP2FIFOBUF[0];
      switch (ctrlCode) {
      case STATUS_CHECK:
	CS_B = 0;    // Enable flash
	LOAD_B = 0;
	IOB = 0xD7;  // Write the value on port B
	LOAD_B = 1;
	IOB = 0x55;  // Write a dummy value to flush out status byte from flash
	LOAD_B = 0;
	LOAD_B = 1;
	EP6FIFOBUF[0] = IOA; // read and send value on port A back
	CS_B = 1;
	// ARM ep6 out
	EP6BCH=0;
	SYNCDELAY();
	EP6BCL=1;
	break; // end of case STATUS_CHECK
      case WRITE_CMD:
	CS_B = 0;
	for (i=1;i<bytes;++i) {
	  LOAD_B = 0;
	  IOB = EP2FIFOBUF[i];
	  LOAD_B = 1;
	}
	CS_B = 1;
	break; // end of case WRITE_CMD
      case READ_CMD:
	CS_B = 0;
	for (i=1;i<bytes;++i) {
	  LOAD_B = 0;
	  IOB = EP2FIFOBUF[i];
	  LOAD_B = 1;
	}
	for (i=0;i<PAGE_SIZE;++i) {
	  LOAD_B = 0;
	  IOB = 0xAA; // dummy byte
	  LOAD_B = 1;
	  EP6FIFOBUF[i] = IOA;
	}
	CS_B = 1;
	// ARM ep6 out
	EP6BCH=MSB(PAGE_SIZE);
	SYNCDELAY();
	EP6BCL=LSB(PAGE_SIZE);
	break; // end of case READ_CMD
      case RESET_F:
	startFpga();
	fpgaStatus = PROG_DONE;
	break; // end of case RESET_FPGA
      default:
	LED6 = 1 ; // D6 OFF
	break;
      } // end of switch
      REARM(); // ep2
    }
  }
  return 0;
}


void setUserPinsDir(BYTE uppLDirByte, BYTE uppHDirByte) 
{
  const BYTE bmOED = 0b10010011;
  const BYTE bmOEA = 0b11110101;

  // Clear UPP direction to inputs
  OED &= bmOED; // Clearing bits 2/3/5/6
  OEA &= bmOEA; // Clearing bits 1/3

  // Set the relevant bits according to userPinsDirByte
  OED |= uppLDirByte;
  OEA |= uppHDirByte;
}

void setUserPins(BYTE userPinsByte) 
{
  UPP0 = bmBIT0 & userPinsByte;
  UPP1 = bmBIT1 & userPinsByte;
  UPP2 = bmBIT2 & userPinsByte;
  UPP3 = bmBIT3 & userPinsByte;
  UPP4 = bmBIT4 & userPinsByte;
  UPP5 = bmBIT5 & userPinsByte;

}

void setMode(BYTE uCMode)
{
  switch (uCMode) {

  case PORT_MODE:

    PORTACFG = 0x00; // otherwise PA7 = SLCS -> is maintained at '1' by the
    SYNCDELAY();     // FPGA 

    //IFCONFIG = 0b11100000; // intern. clk, 48MHz, provided to FPGA, not
    IFCONFIG = 0b11000000; // intern. clk, 48MHz, not provided to FPGA, not
    SYNCDELAY();           // inverted, port mode

    // arm ep2
    EP2BCL = 0x80; // write once
    SYNCDELAY();
    EP2BCL = 0x80; // do it again

    // arm ep6
    EP6BCL = 0x00; // write once
    SYNCDELAY();
    EP6BCL = 0x00; // do it again

    // Set ports as input to avoid conflicts
    OEA = 0x00; // Port A as input
    OEB = 0x00; // Port B as input
    OED = 0x81; // Port D as input save for PROG_B and SUSPEND_F
    PROG_B = 1;
    SUSPEND_F = 0;

    break; // end of case PORT_MODE

  case SLAVE_FIFO_MODE:

    OED = 0x81;
    SUSPEND_F = 0;

    PORTACFG = 0x40; // PA7 = SLCS -> needs to be maintained at '1' by the
    SYNCDELAY();     // FPGA otherwise port D outputs set to '0' resetting
    // the FPGA when setting IFCONFIG below. Is set to '0'
    // by the FPGA once out of idle state.

    //IFCONFIG = 0b11100011; // extern. clk, 48MHz, provided to FPGA, 
    IFCONFIG = 0b01000011; // extern. clk, 48MHz, provided by FPGA, 
    SYNCDELAY();           // not inverted clock, slave FIFO mode

    OED = 0x81;
    SUSPEND_F = 0;

    // Resetting the FIFO
    FIFORESET = bmNAKALL; SYNCDELAY();
    FIFORESET = bmNAKALL | 2; SYNCDELAY();
    FIFORESET = bmNAKALL | 6; SYNCDELAY();
    FIFORESET = 0x00; SYNCDELAY();

    // Configuring peripheral domain side of FIFO
    EP2FIFOCFG = 0x00; SYNCDELAY(); // autoout=0, 8 bits wide bus (Port B)
                                    // Note: do not use Empty Plus One option as no data available
                                    // signal is generated when transmitting a single byte.
    EP6FIFOCFG = 0x48; SYNCDELAY(); // Full minus one, autoIN=1, 8 bits wide bus (Port B)  
                                    // Note: do not allow zero length packets
    // as this create a problem when transferring 513 bytes
    // (buffer size + 1). The PKTEND signal also needs to be 
    // delayed by one clock period (signal from FPGA)
    // otherwise again sending 513 bytes fails.

    EP6AUTOINLENH = 0x02; // Send data in 512 byte chunks
    SYNCDELAY();
    EP6AUTOINLENL = 0x00;
    SYNCDELAY();

    RESETFIFO(0x06);
    SYNCDELAY();

    // All the FIFO have to be set as 8 bit wide bus otherwise PortD is not available
    EP4FIFOCFG &= ~0b00000001; // 8 bit wide bus (Port B) 
    SYNCDELAY(); 
    EP8FIFOCFG &= ~0b00000001; // 8 bit wide bus (Port B) 
    SYNCDELAY(); 

    // Setting the flags polarity and pin allocation
    FIFOPINPOLAR = 0x3D; // PKTEND, SLRD, SLWR, SLOE AND FIFO FULL active high
    PINFLAGSAB = 0xE0; // Flag B is EP6 FIFO full flag
    SYNCDELAY();
    PINFLAGSCD = 0x08; // Flag C is EP2 FIFO empty flag
    SYNCDELAY();

    OED = 0x81;
    SUSPEND_F = 0;


    // Trigger 0 to 1 transition on autoout to arm the buffers
    /*   EP2FIFOCFG &= bmAUTOOUT; // autoout=1, 8 bits wide bus (Port B) */
    /*   SYNCDELAY(); */

    break; // end of case SLAVE_FIFO_MODE
  } // end of uCMode switch
}

BOOL writeEeprom(BYTE prom_addr, WORD addr, WORD length, BYTE* buf)
{
  BYTE addr_len=0;
  BYTE addr_buffer[2];
  BYTE bs;
  BYTE *data_buffer_ptr = buf;
  BYTE *last_data_ptr = buf + length;

  addr_len = 2;
  addr_buffer[0] = MSB(addr);
  addr_buffer[1] = LSB(addr);

  while ( data_buffer_ptr < last_data_ptr ) {
    if ( (last_data_ptr - data_buffer_ptr) > MAX_EEP_WRITE) { // 
      bs = MAX_EEP_WRITE;
    }
    else bs = last_data_ptr - data_buffer_ptr;
    if ( ! i2c_write ( prom_addr, addr_len, addr_buffer, bs, data_buffer_ptr ) ) return FALSE;
    addr += bs; // More data to come so remember to increase the address
    data_buffer_ptr += bs;
  }
  return TRUE;
}

void execFlashCmd(WORD cmd, WORD len)
{
  BYTE i;
  CS_B = 0;    // Enable SPI interface
  transferSpiByte((BYTE)cmd);
  for (i=0; i<len; i++) {
    EP0BUF[i] = transferSpiByte(EP0BUF[i]);
  }
  CS_B = 1;
}

BYTE transferSpiByte(BYTE spiByte) 
{
  IOB = spiByte;
  LOAD_B = 0;
  LOAD_B = 1;
  NOP;
  NOP;
  NOP;
  return IOA;
}

BYTE readBoardStatusRegister()
{
  BYTE addr_len=0;
  WORD addr_buffer;
  BYTE bs, buf;

  addr_len = 2;
  addr_buffer = 0x3DF8;
  bs = 1;

  if (!eeprom_read(0x51, addr_buffer, bs, &buf)) return 0x00;

  return buf;
}

