/***************************************************************************************************
File name: aes220_Firmware.c
====================================================================================================
DESCRIPTION

Base program handling pipe communication, fpga configuration, fpga flash 
programming and other utilities

====================================================================================================
CHANGES

V1.4.0: First release
V1.4.1: Increased delay in startFpga() (aes220.c) to 200ms or aes220b uC hangs
V1.4.2: Getting rid of "magic numbers" and using defined bit names (see fx2regs.h) 
V1.4.3: Remove the conditional on startFpga() in progFPGA RESET_F case as the micro-controller
        would hang after erasing the Flash and resetting the device.
V1.4.4: No change but now compiled with SDCC version >3.2
v1.4.5: Now quad buffer and using REVCTL=0x03 (advanced endpoints control) allowing faster transfer

====================================================================================================
NOTES


====================================================================================================
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
 |              RWB <  IOD2 <> | PD2                   |                      |
 |               OE <  IOD3 <> | PD3                   |                      |
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
 |   |    |________________| P11                   CSI_B P10 | <>IOD2 < RWB   |
 |   |                     |                        DOUT R11 | <>IOD3 < OE    |
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

====================================================================================================

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
====================================================================================================

***************************************************************************************************/


#include <stdio.h>
#include <string.h>

#include <fx2regs.h>
#include <fx2macros.h>
#include <serial.h>
#include <delay.h>
#include <autovector.h>
#include <setupdat.h>
#include <eputils.h>
#include <aes_i2c.h>
#include <i2c.h>
#include <fx2ints.h>

#include <aes220.h>

#define REARMVAL 0x80
#define REARM() EP2BCL=REARMVAL

// User signals
#define RWB       PD2
#define OE        PD3
#define SUSPEND_F PD7

// I2C commands
#define SHORT_I2C_TRF 0
#define START_I2C_TRF 1
#define MORE_I2C_TRF  2
#define LAST_I2C_TRF  3

volatile WORD bytes;
volatile __bit gotbuf;
volatile BYTE icount;
volatile __bit got_sud;

DWORD __xdata lcount;
DWORD __xdata fpgaFileLen;
__bit on;

//BOOL __xdata programFpga = FALSE;
//BOOL __xdata fpgaProgrammed = FALSE;
BYTE __xdata fpgaStatus = WAIT_MODE;
BYTE __xdata uCMode = WAIT_MODE;
BYTE __xdata prevMode = WAIT_MODE;


//BYTE rcvdCmd = 0;

BYTE __code codeVersion[3] = {1, 4, 5}; // Software version 1.4.x

BYTE __xdata TURN3V3OFF[] = {0x10, 0x71};

void main() 
{

  on=0; 
  lcount=0;
  got_sud=FALSE;
  icount=0;
  gotbuf=FALSE;
  bytes=0;

  // Setting up interrupts 
  USE_USB_INTS();
  ENABLE_SUDAV();
  ENABLE_SOF();
  ENABLE_HISPEED();
  ENABLE_USBRESET();
  
  SETCPUFREQ(CLK_48M);

  // Initialise the ports directions
  OEA = 0x00;
  OEB = 0x00;
  OED = (bmBIT7 | bmBIT0); // Set PD0/7 as outputs (SUSPEND_F, PROG_B)
  LED6 = LED_ON;   // Blue LED ON
  //LED6 = LED_OFF;   // Blue LED OFF
  PROG_B = 0; // FPGA held in reset (hard)
  SUSPEND_F = 0; // Maintain fpga suspend pin low to prevent it going in suspend mode

  // Start the FPGA by resetting it and wait for it to finish its 
  // configuration process.
  //fpgaProgrammed = startFpga(); 
  startFpga(); 

  // Check for the presence of an external 3.3V 
  // By default the device will leave the 3.3V ON unless it is told by the FPGA to turn it OFF
  // via the CHK3V3 signal (FPGA setting it to 1).
  OEB |= bmBIT0;
  OEA = bmBIT0;
  if (readBoardStatusRegister() == 0x00) { 
    LED6 = LED_OFF;   // Blue LED OFF
    // Turn 3.3V off
    startWriteI2C(PSU_ADDR, 2, TURN3V3OFF);
    stopWriteI2C();
  }

  // Maintain the FPGA in soft reset so FPGA state machine is not enabled
  assertSoftReset(); 

  // Enable suspend mode (micro-controller)
  SUSPEND = 10; 

  EA=1; // global interrupt enable

  // Set Port Mode as default (prevMode = Wait Mode)
  uCMode = PORT_MODE;

  while(TRUE) {
    if ( got_sud ) {
      handle_setupdata();
      got_sud=FALSE;
    }
    switch(uCMode) {

    case SLAVE_FIFO_MODE: 
      if (uCMode != prevMode) { // Newly entering the mode
	prevMode = uCMode;
	assertSoftReset();
	setMode(uCMode);
	clearSoftReset();
      }
      /* This can be used with bmAUTOOUT=0 but transfer rate drops to 4MB/s
      if ( !(EP2FIFOFLGS & bmEP2EMPTY) ) {
	EP2BCH = EP2FIFOBCH; SYNCDELAY;
	EP2BCL = EP2FIFOBCL; SYNCDELAY;
	}*/

      break; // end of case SLAVE_FIFO_MODE

    case PORT_MODE:
      
      if (uCMode != prevMode) { // Newly entering the mode
	prevMode = uCMode;
	assertSoftReset();
	setMode(uCMode);
	clearSoftReset();
      }
      
      break; // end of case PORT_MODE

    case WAIT_MODE:
      OEB |= bmBIT0;
      LED6 = LED_ON;
      assertSoftReset(); 
      NOP;
      NOP;
      clearSoftReset();
      break; // end of case WAIT_MODE

    case CONF_F_MODE: 
      if (prevMode != PORT_MODE) {
	setMode(PORT_MODE);
      }
      fpgaStatus = configureFpga(fpgaFileLen);
      /*
      if (fpgaStatus == PROG_DONE) {
	fpgaProgrammed = TRUE;
      }
      else {
	fpgaProgrammed = FALSE;
      }
      */
      uCMode = WAIT_MODE; // Exit the configuration mode and wait for a new one
      prevMode = CONF_F_MODE; // Reset previous mode
      break; // end of case CONF_F_MODE

    case PROG_F_MODE: 
      if (prevMode != PORT_MODE) {
      setMode(PORT_MODE);
      setMode(PORT_MODE);
      }
      progFpga();
      /*
      if (fpgaStatus == PROG_DONE) {
	fpgaProgrammed = TRUE;
      }
      else fpgaProgrammed = FALSE;
      */
      uCMode = WAIT_MODE; // Exit the program mode and wait for a new one
      prevMode = PROG_F_MODE; // Reset previous mode
      break; // end of case PROG_F_MODE

    default:
      break;
    } // end of switch(ucMODE)
  } // end of while (true)
} // end of main

BOOL handle_vendorcommand(BYTE cmd)  
{
  WORD addr=SETUP_VALUE(),len=SETUP_LENGTH(), index=SETUP_INDEX();
  switch ( cmd ) 
    {

    case VC_EPSTAT:
      {
	__xdata BYTE* pep= ep_addr(SETUPDAT[2]);
	if (pep) {
	  EP0BUF[0] = *pep;
	  EP0BCH=0;
	  EP0BCL=1;
	  return TRUE;
	}
      }
      break;

    case VC_EEPROM:
      {            
	// wait for ep0 not busy
	switch (SETUP_TYPE) 
	  {

	  case 0xc0:
	    while (len) { // still have bytes to read
	      // can't read more than 64 bytes at a time
	      BYTE cur_read = len > 64 ? 64 : len; 
	      while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
	      eeprom_read(EEP_ADDR, addr, cur_read, EP0BUF);
	      EP0BCH=0;
	      SYNCDELAY;
	      EP0BCL=cur_read;
	      len -= cur_read;
	      addr += cur_read;
	    }
	    break;

	  case 0x40:    
	    while (len) {
	      BYTE cur_write;
	      EP0BCL = 0; // allow pc transfer in
	      while(EP0CS & bmEPBUSY); // wait
	      cur_write=EP0BCL;
	      if (!writeEeprom(EEP_ADDR, addr, cur_write, EP0BUF)) return FALSE;
	      addr += cur_write;
	      len -= cur_write;
	    }
	    break;

	  default:
	    return FALSE; // bad type

	  }
	return TRUE;
      }
      break; // end of case VC_EEPROM

    case VC_I2C:
      {            
	BOOL rv = FALSE;
	BYTE devAddr;
	BYTE regAddr[1] = {0x10};
	//BYTE *regAddr_ptr = &regAddr;
	devAddr = (BYTE)addr;
	//regAddr = ;
	// wait for ep0 not busy
	switch (SETUP_TYPE) 
	  {

	  case 0xc0: // Read I2C request
	    if (len <= MAX_EP0_DATA) { // Short I2C transfer
	      while (EP0CS&bmEPBUSY); // Can't do this until EP0 is ready
	      startReadI2C((BYTE)addr, len, EP0BUF);
	      stopReadI2C(len, EP0BUF);
	      EP0BCH=0;
	      SYNCDELAY;
	      EP0BCL=len;
	    }
	    else { // Longer I2C transfer (up to 2^16 in total (64kB))
	      while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
	      startReadI2C((BYTE)addr, MAX_EP0_DATA, EP0BUF);
	      len -= MAX_EP0_DATA;
	      while (len) {
		BYTE curRead = len > MAX_EP0_DATA ? MAX_EP0_DATA : len;
		while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
		if (len <= MAX_EP0_DATA) {
		  stopReadI2C(len, EP0BUF);
		}
		else {
		  readI2C(curRead, EP0BUF);
		}
		EP0BCH=0;
		SYNCDELAY;
		EP0BCL=curRead;
		len -= curRead;
	      }
	    }
	    return rv;
	    break; // end of case 0xc0

	  case 0x40:  { // write I2C request
	    BYTE curWrite;
	    EP0BCL = 0; // allow pc transfer in
	    while(EP0CS & bmEPBUSY); // wait
	    curWrite = EP0BCL;
	    rv = startWriteI2C((BYTE)addr, curWrite, EP0BUF);
	    if (len <= MAX_EP0_DATA) { // Short I2C transfer
	      if (rv == TRUE) rv = stopWriteI2C();
	    }
	    else { // Longer I2C transfer (up to 2^16 in total (64kB))
	      len -= curWrite;
	      while(len) {
		EP0BCL = 0; // allow pc transfer in
		while(EP0CS & bmEPBUSY); // wait
		curWrite = EP0BCL;
		rv = writeI2C(curWrite, EP0BUF);
		len -= curWrite;
	      }
	      if (index == 0) { 
		rv = stopWriteI2C();
	      }
	    }
	    return rv;
	  }
	    break; // end of 0x40 case

	  default:
	    return FALSE; // bad type

	  } // end of SETUP_TYPE switch
	//return TRUE;
      }
      break; // end of case VC_I2C

    case VC_UC_MODE:
      {            
	switch (SETUP_TYPE) 
	  {

	  case 0xc0:
	    { // return the status byte and micro-controller mode
	      while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
	      EP0BUF[0] = fpgaStatus;
	      EP0BUF[1] = uCMode;
	      EP0BUF[2] = prevMode;
	      EP0BCH=0;
	      SYNCDELAY;
	      EP0BCL=3;
	      return TRUE; 
	    }
	    break; // case 0xC0

	  case 0x40:    
	    { 
	      EP0BCL = 0; // allow pc transfer in
	      while(EP0CS & bmEPBUSY); // wait
	      uCMode = EP0BUF[0];
	      switch (uCMode)
		{
		case CONF_F_MODE:
		  fpgaFileLen = MAKEDWORD(addr, index);
		  break;

		default:
		  break;
		}
	      return TRUE;
	    }
	    break; // case 0x40

	  default:
	    return FALSE; // bad SETUP_TYPE

	  } // end of SETUP_TYPE switch
      }
      break; // end of case VC_UCMODE

    case VC_UPP_CMD:
      {            
	switch (SETUP_TYPE) 
	  {

	  case 0xc0:
	    { // return the pins values
	      while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
	      EP0BUF[0] = (0x00 | (PD6 << 3) |(PD5 << 2) |(PD3 << 1) | PD2) ;
	      EP0BCH=0;
	      SYNCDELAY;
	      EP0BCL=1;
	      return TRUE; 
	    }
	    break; // case 0xC0

	  case 0x40:    
	    { 
	      EP0BCL = 0; // allow pc transfer in
	      while(EP0CS & bmEPBUSY); // wait
	      switch (EP0BUF[0])
		{
		case UPP_PIN_DIR:
		  NOP;
		  //setUserPinsDir(EP0BUF[1], EP0BUF[2]);
		  break;
		case UPP_PIN_VAL:
		  NOP;
		  //setUserPins(EP0BUF[1]);
		  break;
		default:
		  break;
		}
	      return TRUE;
	    }
	    break; // case 0x40

	  default:
	    return FALSE; // bad SETUP_TYPE

	  } // end of SETUP_TYPE switch
      }
      break; // end of case VC_UPP_CMD

    case VC_UC_CMD:
      {            
	switch (SETUP_TYPE) 
	  {

	  case 0xc0:
	    { // return the status byte
	      while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
	      return TRUE; 
	    }
	    break; // case 0xC0

	  case 0x40:    
	    { 
	      EP0BCL = 0; // allow pc transfer in
	      while(EP0CS & bmEPBUSY); // wait
	      //rcvdCmd = EP0BUF[0];
	      switch (EP0BUF[0]) 
		{
		case SLEEP_U:
		  // Clear and set wakeup pins
		  // wake up on a low on pin wakeup
		  WAKEUPCS = bmWU | bmWUEN;
		  PCON = 0x01;
		  break; // end of case SLEEP_U

		case SLEEP_F:
		  OED |= 0x80; // PD7 (suspend pin) as output
		  SUSPEND_F = 1;
		  break; // end of case SLEEP_F

		case WAKE_F:
		  OED |= 0x80; // PD7 (suspend pin) as output
		  SUSPEND_F = 0;
		  break; // end of case WAKE_F

		case FLASH_F:
		  setupFpgaProg();
		  break; // end of case FLASH_F

		case ASSERT_SOFT_RESET:
		  assertSoftReset();
		  break; // end of case ASSERT_SOFT_RESET

		case CLEAR_SOFT_RESET:
		  clearSoftReset();
		  break; // end of case CLEAR_SOFT_RESET

		default: 
		  return FALSE;
		  break;
		}
	      return TRUE;
	      break; // case 0x40
	    }
	  default:
	    return FALSE; // bad SETUP_TYPE

	  } // end of SETUP_TYPE switch
      }
      break; // end of case VC_UC_CMD

    case VC_FIFO_DEBUG:
      {            
	switch (SETUP_TYPE) 
	  {

	  case 0xc0:
	    { // return the status byte
	      while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
	      EP0BUF[0] = IFCONFIG;
	      EP0BUF[1] = EP2468STAT;
	      EP0BUF[2] = EP2CFG;
	      EP0BUF[3] = EP2CS;
	      EP0BUF[4] = EP2FIFOFLGS;
	      EP0BUF[5] = EP2FIFOBCH;
	      EP0BUF[6] = EP2FIFOBCL;
	      EP0BUF[7] = EP2BCH;
	      EP0BUF[8] = EP2BCL;
	      EP0BUF[9] = EP6CFG;
	      EP0BUF[10] = EP6CS;
	      EP0BUF[11] = EP6FIFOFLGS;
	      EP0BUF[12] = EP6FIFOBCH;
	      EP0BUF[13] = EP6FIFOBCL;
	      EP0BUF[14] = EP6BCH;
	      EP0BUF[15] = EP6BCL;
	      EP0BCH=0;
	      SYNCDELAY;
	      EP0BCL=16;
	      return TRUE; 
	    }
	    break; // case 0xC0

	  case 0x40:    
	    { 
	      EP0BCL = 0; // allow pc transfer in
	      while(EP0CS & bmEPBUSY); // wait
	      //uCMode = EP0BUF[0];
	      return TRUE;
	    }
	    break; // case 0x40

	  default:
	    return FALSE; // bad SETUP_TYPE

	  } // end of SETUP_TYPE switch
      }
      break; // end of case VC_FIFO_DEBUG

    case VC_FLASH_CMD:
      {            
	switch (SETUP_TYPE) 
	  {

	  case 0xc0:
	    { // return the status byte
	      while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
	      //execFlashCmd(addr, len);
	      EP0BCH=0;
	      SYNCDELAY;
	      EP0BCL=len;
	      return TRUE; 
	    }
	    break; // case 0xC0

	  case 0x40:    
	    { 
	      EP0BCL = 0; // allow pc transfer in
	      while(EP0CS & bmEPBUSY); // wait
	      execFlashCmd(addr, len);
	      return TRUE;
	    }
	    break; // case 0x40

	  default:
	    return FALSE; // bad SETUP_TYPE

	  } // end of SETUP_TYPE switch
      }
      break; // end of case VC_FLASHCMD

    case VC_SOFT_INFO:
      {            
	switch (SETUP_TYPE) 
	  {
	  case 0xc0:
	    { // return the status byte
	      while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
	      memcpy(EP0BUF, codeVersion, sizeof(codeVersion));
	      EP0BCH=0;
	      SYNCDELAY;
	      EP0BCL=len;
	      return TRUE; 
	    }
	    break; // case 0xC0
	  case 0x40:    
	    { 
	      EP0BCL = 0; // allow pc transfer in
	      while(EP0CS & bmEPBUSY); // wait
	      return TRUE;
	    }
	    break; // case 0x40

	  default:
	    return FALSE; // bad SETUP_TYPE

	  } // end of SETUP_TYPE switch
      }
      break; // end of case VC_SOFT_INFO

      /* case VC_BOARD_INFO: */
      /*   {             */
      /* 		switch (SETUP_TYPE)  */
      /* 			{ */

      /* 			case 0xc0: */
      /* 				{ // return the status byte */
      /* 					while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready */
      /* 					eeprom_read(0x51, BOARD_INFO_ADDR, BOARD_INFO_LEN, EP0BUF); */
      /* 					EP0BCH=0; */
      /* 					SYNCDELAY; */
      /* 					EP0BCL=B0ARD_INFO_LEN; */
      /* 					return TRUE;  */
      /* 				} */
      /* 				break; // case 0xC0 */

      /* 			case 0x40:     */
      /* 				{  */
      /* 					EP0BCL = 0; // allow pc transfer in */
      /* 					while(EP0CS & bmEPBUSY); // wait */
      /* 					if (!writeEeprom(0x51, BOARD_INFO_ADDR, BOARD_INFO_LEN, EP0BUF)) return FALSE; */
      /* 					return TRUE; */
      /* 				} */
      /* 				break; // case 0x40 */

      /* 			default: */
      /* 				return FALSE; // bad SETUP_TYPE */

      /* 			} // end of SETUP_TYPE switch */
      /*   } */
      /*   break; // end of case VC_BOARD_INFO */

    default:
      return FALSE;

    } // end of case cmd
  return FALSE;
}



// this firmware only supports 0,0
BOOL handle_get_interface(BYTE ifc, BYTE* alt_ifc) {
  if (ifc==0) {*alt_ifc=0; return TRUE;} else { return FALSE;}
}
BOOL handle_set_interface(BYTE ifc, BYTE alt_ifc) {
  if (ifc==0&&alt_ifc==0) {
    // SEE TRM 2.3.7
    // reset toggles
    RESETTOGGLE(0x02);
    RESETTOGGLE(0x86);
    if (uCMode == SLAVE_FIFO_MODE) {
      // Arm the EP2OUT buffers. Done four times because it's quad-buffered
      SYNCDELAY; OUTPKTEND = bmBIT7 | 2;  // EP2OUT
      SYNCDELAY; OUTPKTEND = bmBIT7 | 2;
      SYNCDELAY; OUTPKTEND = bmBIT7 | 2;
      SYNCDELAY; OUTPKTEND = bmBIT7 | 2;

      // Trigger 0 to 1 transition on autoout to arm the buffers
      SYNCDELAY; EP2FIFOCFG |= bmAUTOOUT;
    } 
    else {
      // restore endpoints to default condition
      SYNCDELAY; RESETFIFO(0x02);
      SYNCDELAY; REARM(); // Rearm 4 times for the four buffers
      SYNCDELAY; REARM();
      SYNCDELAY; REARM();
      SYNCDELAY; REARM();
      SYNCDELAY; RESETFIFO(0x86);
    }
    return TRUE;
  } else
    return FALSE;
}

// copied routines from setupdat.h
BOOL handle_get_descriptor() {
  return FALSE;
}

// get/set configuration
BYTE handle_get_configuration() {
  return 1;
}
BOOL handle_set_configuration(BYTE cfg) {
  return cfg==1 ? TRUE : FALSE; // we only handle cfg 1
}


// copied usb jt routines from usbjt.h
void sudav_isr() __interrupt SUDAV_ISR {
  got_sud=TRUE;
  CLEAR_SUDAV();
}

__bit on5;
__xdata WORD sofct=0;
void sof_isr () __interrupt SOF_ISR __using 1 {
  ++sofct;
  if(sofct==8000) { // about 8000 sof interrupts per second at high speed
    on5=!on5;
    sofct=0;
  }
  CLEAR_SOF();
}

void usbreset_isr() __interrupt USBRESET_ISR {
  handle_hispeed(FALSE);
  CLEAR_USBRESET();
}
void hispeed_isr() __interrupt HISPEED_ISR {
  handle_hispeed(TRUE);
  CLEAR_HISPEED();
}

void timer0_isr() __interrupt TF0_ISR {
  //d2 = !d2;
  if (LED6) { LED6 = 0;} else {LED6 = 1;}
}
