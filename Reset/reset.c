/**
 * Copyright (C) 2009 Ubixum, Inc. 
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 **/

#include <stdio.h>

#include <fx2regs.h>
#include <fx2macros.h>
#include <serial.h>
#include <delay.h>
#include <autovector.h>
#include <i2c.h>
#include <lights.h>
#include <setupdat.h>
#include <eputils.h>


#define SYNCDELAY() SYNCDELAY4
#define REARMVAL 0x80
#define REARM() EP2BCL=REARMVAL

#define LG_PROM 0x51  // large prom ( is 16 bit addr mode)

#define READ_SIZE 100

#define LED6 PB0

xdata BYTE buf[READ_SIZE];

#define IIC_SIZE 8
extern xdata BYTE fx2_c0[];

volatile WORD bytes;
volatile bit gotbuf;
volatile BYTE icount;
volatile bit got_sud;
DWORD lcount;
bit on;


/*
 Modified eeprom_write that always uses two byte buffer.
 So can write to LG_PROM w/ out recompiling lib.
 (The library dynamically detects the prom based on the startup state.
  On the dev board, you can switch the prom with EEPROM select while
  the firmware is running.)
*/
void eeprom_write_local(BYTE prom_addr, WORD addr, WORD length, BYTE* buf) {
  BYTE addr_len=0;
  // 1st bytes of buffer are address and next byte is value
  BYTE data_buffer[3];
  BYTE cur_byte=0;
    
  while ( cur_byte<length ) {
    addr_len=0;
    printf ( "%d %04x:%02x\n", cur_byte, addr, buf[cur_byte]);
    data_buffer[addr_len++] = MSB(addr);
    data_buffer[addr_len++] = LSB(addr);
    data_buffer[addr_len++] = buf[cur_byte++];
    i2c_write ( prom_addr, addr_len, data_buffer, 0, NULL );
    ++addr; // next byte goes to next address
  }
    
}

void main() {
    
  BOOL on=FALSE;
  unsigned int size=0;
  LED6 = 0;
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

  EA=1; // global interrupt enable
 
  OEB |= 0x01; // set PB0 as output
  LED6 = 0;
 
  eeprom_write_local(LG_PROM, 0, IIC_SIZE, fx2_c0);

  while(TRUE) {
    if ( got_sud ) {
      printf ( "Handle setupdata\n" );
      handle_setupdata();
      got_sud=FALSE;
    }
    if ( !(EP2468STAT & bmEP2EMPTY) ) { // EP2 received data
      if  ( !(EP2468STAT & bmEP6FULL) ) { // wait for at least one 
	                                  // empty buffer
	WORD i;
	bytes = MAKEWORD(EP2BCH,EP2BCL);
	for (i=0;i<bytes;++i) {
	  EP6FIFOBUF[i] = 0x00;
	  // arm ep6 out
	  EP6BCH=MSB(bytes);
	  SYNCDELAY();
	  EP6BCL=LSB(bytes);
	  REARM(); // re-arm ep2
	}
      }
    }

    //delay(40);
    if (LED6) {LED6 = 0;} else {LED6 =1;}
  }
}

// Vendor commands bytes
#define VC_EPSTAT 0xb0
#define VC_EEPROM 0xb1
#define VC_F_CONF 0xb2

BOOL handle_vendorcommand(BYTE cmd)  
{
  WORD addr=SETUP_VALUE(),len=SETUP_LENGTH();

  switch ( cmd ) {

  case VC_EPSTAT:
    {
      xdata BYTE* pep= ep_addr(SETUPDAT[2]);
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
      switch (SETUP_TYPE) {
      case 0xc0:
	while (len) { // still have bytes to read
	  // can't read more than 64 bytes at a time
	  BYTE cur_read = len > 64 ? 64 : len; 
	  while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
	  eeprom_read(0x51, addr, cur_read, EP0BUF );
	  EP0BCH=0;
	  SYNCDELAY();
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
	  if ( !eeprom_write(0x51, addr, cur_write, EP0BUF ) ) return FALSE;
	  addr += cur_write;
	  len -= cur_write;
	}
	break;
      default:
	return FALSE; // bad type
      }
      printf ( "All OK\n" );
      return TRUE;
    }
    break;
  default:
    {
    printf ( "Need to implement vendor command: %02x\n", cmd );
    return FALSE;
    }
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

