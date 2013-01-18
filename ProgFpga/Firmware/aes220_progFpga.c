/******************************************************************************
File name: aes220_fpgaProg_101101-01.c
===============================================================================
DESCRIPTION

Downloads the program file into the fpga flash memory.

===============================================================================
CHANGES


===============================================================================
NOTES

Using Slave Parallel (SelectMap) Mode: M[2:0]= [1:1:0]

Xilinx SelectMap bus is byte swapped (D0 is the MSB, D7 the LSB)

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
PINOUT
  ____________________________________________________________________________
 |                                                                            |
 |                              ________________________                      |
 |                             |                       |                      |
 |                     IOA0 <> | PA0               PB0 | <> IOB0 LED6         |
 |                     IOA1 <> | PA1               PB1 | <> IOB1              |
 |                     IOA2 <> | PA2               PB2 | <> IOB2              |
 |                     IOA3 <> | PA3               PB3 | <> IOB3              |
 |                     IOA4 <> | PA4               PB4 | <> IOB4              |
 |                     IOA5 <> | PA5               PB5 | <> IOB5              |
 |                     IOA6 <> | PA6               PB6 | <> IOB6              |
 |                     IOA7    | PA7               PB7 | <> IOB7              |
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
 |   |    |________________| P11                   CSI_B P10 | <>IOD2         |
 |   |                     |                        DOUT R11 | <>IOD3         |
 |   |     _               |                       AWAKE T11 | <>IOD4         |
 |   |   __|__SW1          |                      INIT_B T12 | <>IOD5         |
 |   |__|     |____________| D6                     CCLK R14 | <>IOD6         |
 |   |     _               |                         SUSPEND | < IOD7         |
 |   |   __|__SW2          |                                 |                |
 |   |__|     |____________| E6                              |                |
 |                         |                                 |                |
 |                  IOB0<> | T2 CSO_B                 D7  T5 | <>IOA0         |
 |                  IOB1<> | R2 M2                    D6  T6 | <>IOA1         |
 |                  IOB2<> | T3 VS2                   D5  P7 | <>IOA2         |
 |                  IOB3<> | P4 M0                    D4  N8 | <>IOA3         |
 |                  IOB4<> | R3 RDWR_B                D3 P12 | <>IOA4         |
 |                  IOB5<> | N4 M1                    D2 T13 | <>IOA5         |
 |                  IOB6<> | P5 VS0                   D1 R13 | <>IOA6         |
 |                  IOB7<> | N6 VS1                   D0 T14 | <>IOA7         |
 |                         |                   XC3S200AN     |                |
 |                         |_________________________________|                |
 |                                                                            |
 |                                                                aes220      |
 |____________________________________________________________________________|


===============================================================================

Sending two bytes and reading one
(first byte is 0xD7, snd byte is dummy, read byte is status byte)
              __                                                   ____________
CS_B   PD3:     \_________________________________________________/
              ____           __________       _________________________________
LOAD_B PD2:       \_________/          \_____/
                        ______             ____
PORT_IN PBX:  ---------<______>-----------<____>-------------------------------
                                                   ___
PORT_OUT PAX: ------------------------------------<___>------------------------
              ______________   _   _   ______   _   _   _______________________
CLKOUT PD0                  \_/ \_/ \_/      \_/ \_/ \_/

1               ^ pull CS_B low to reset the fpga (M[2:0] sampled at this point)
 2  5             ^ pull LOAD_B low     ^ pull LOAD_B low
  3  6                 ^ provide data     ^ provide data
   4  7                     ^ pull LOAD_B high^ pull LOAD_B high
       8                                           ^ read data


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


#define SYNCDELAY() SYNCDELAY4
#define REARMVAL 0x80
#define REARM() EP2BCL=REARMVAL

#define PROG_B PD0
#define M2     PB1
#define M1     PB5
#define M0     PB3
#define VS2    PB2
#define VS1    PB7
#define VS0    PB6


#define LOAD_B PD2
#define CS_B   PD3
#define LED6   PB0

#define START_BYTE  0x31

#define START_CONFIG_BYTE  0xAA
#define RESET_F            0xAF

// Spi Flash commmands
#define STATUS_CHECK       0x60
#define WRITE_PAGE         0x61
#define READ_PAGE          0x62

#define PAGE_SIZE 264

volatile WORD bytes;
volatile bit gotbuf;
volatile BYTE icount;
volatile bit got_sud;
DWORD lcount;
bit on;
BOOL START_CONFIG_PROC = TRUE;
BOOL CONFIGURE_FPGA = FALSE;

void main() {

  REVCTL=0; // not using advanced endpoint controls

  on=0;
  lcount=0;
  got_sud=FALSE;
  icount=0;
  gotbuf=FALSE;
  bytes=0;

  // renumerate
  RENUMERATE_UNCOND();


  SETCPUFREQ(CLK_48M);
  SETIF48MHZ();
  sio0_init(57600);


  USE_USB_INTS();
  ENABLE_SUDAV();
  ENABLE_SOF();
  ENABLE_HISPEED();
  ENABLE_USBRESET();


  // only valid endpoints are 2/6
  EP2CFG = 0xA2; // 10100010
  SYNCDELAY();
  EP6CFG = 0xE2; // 11100010
  SYNCDELAY();
  EP1INCFG &= ~bmVALID;
  SYNCDELAY();
  EP1OUTCFG &= ~bmVALID;
  SYNCDELAY();
  EP4CFG &= ~bmVALID;
  SYNCDELAY();
  EP8CFG &= ~bmVALID;
  SYNCDELAY();


  // arm ep2
  EP2BCL = 0x80; // write once
  SYNCDELAY();
  EP2BCL = 0x80; // do it again


  // make it so we enumberate


  EA=1; // global interrupt enable
  printf ( "Done initializing stuff\n" );


  OEA = 0x00; // set port A as inputs
  OEB = 0xFF; // set port B as outputs
  OED |= 0b00001101; // set PD0, PD2 and PD3 as outputs

  PROG_B = 1;
  LOAD_B = 1;    // Shift register load signal set to 1
  CS_B   = 1;    // Chip select signal set to 1

  while(TRUE) {
    if ( got_sud ) {
      printf ( "Handle setupdata\n" );
      handle_setupdata();
      got_sud=FALSE;
    }

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
	IOB = 0x55;  // Write a dummy value to flush out status byte
	// from flash
	LOAD_B = 0;
	LOAD_B = 1;
	EP6FIFOBUF[0] = IOA; // read and send value on port A back
	CS_B = 1;
	// ARM ep6 out
	EP6BCH=0;
	SYNCDELAY();
	EP6BCL=1;
	break; // end of case STATUS_CHECK
      case WRITE_PAGE:
	CS_B = 0;
	for (i=1;i<bytes;++i) {
	  LOAD_B = 0;
	  IOB = EP2FIFOBUF[i];
	  LOAD_B = 1;
	}
	CS_B = 1;
	break; // end of case WRITE_PAGE
      case READ_PAGE:
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
	break; // end of case READ_PAGE
      case RESET_F:
	PROG_B = 0;
	LED6 = 1; // D6 OFF
	M2 = 0;
	M1 = 1;
	M0 = 1;
	VS2 = 1;
	VS1 = 1;
	VS0 = 1;
	delay(1000);
	PROG_B = 1;
	LED6 = 0; // D6 ON
	break; // end of case RESET_FPGA
      default:
	LED6 = 1 ; // D6 OFF
	break;
      } // end of switch
      REARM(); // ep2
      //printf ( "Re-Armed ep2\n" );
    }
  }
}

// copied routines from setupdat.h

// value (low byte) = ep
#define VC_EPSTAT 0xB1

BOOL handle_vendorcommand(BYTE cmd) {

  switch ( cmd ) {

  case VC_EPSTAT:
    {
      xdata BYTE* pep= ep_addr(SETUPDAT[2]);
      printf ( "ep %02x\n" , *pep );
      if (pep) {
	EP0BUF[0] = *pep;
	EP0BCH=0;
	EP0BCL=1;
	return TRUE;
      }
    }
  default:
    printf ( "Need to implement vendor command: %02x\n", cmd );
  }
  return FALSE;
}

// this firmware only supports 0,0
BOOL handle_get_interface(BYTE ifc, BYTE* alt_ifc) {
  printf ( "Get Interface\n" );
  if (ifc==0) {*alt_ifc=0; return TRUE;} else { return FALSE;}
}
BOOL handle_set_interface(BYTE ifc, BYTE alt_ifc) {
  printf ( "Set interface %d to alt: %d\n" , ifc, alt_ifc );

  if (ifc==0&&alt_ifc==0) {
    // SEE TRM 2.3.7
    // reset toggles
    RESETTOGGLE(0x02);
    RESETTOGGLE(0x86);
    // restore endpoints to default condition
    RESETFIFO(0x02);
    EP2BCL=0x80;
    SYNCDELAY();
    EP2BCL=0X80;
    SYNCDELAY();
    RESETFIFO(0x86);
    return TRUE;
  } else
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
void sudav_isr() interrupt SUDAV_ISR {

  got_sud=TRUE;
  CLEAR_SUDAV();
}

bit on5;
xdata WORD sofct=0;
void sof_isr () interrupt SOF_ISR using 1 {
  ++sofct;
  if(sofct==8000) { // about 8000 sof interrupts per second at high speed
    on5=!on5;
    if (on5) {d5on();} else {d5off();}
    sofct=0;
  }
  CLEAR_SOF();
}

void usbreset_isr() interrupt USBRESET_ISR {
  handle_hispeed(FALSE);
  CLEAR_USBRESET();
}
void hispeed_isr() interrupt HISPEED_ISR {
  handle_hispeed(TRUE);
  CLEAR_HISPEED();
}

