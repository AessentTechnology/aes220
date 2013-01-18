/* Modified version of i2c.h 
Moving the stop step to its own procedure so has to be able to do more writes
before stopping the transaction.
Important too when forming a combined frame (write followed by read without a stop in between).

Sebastien Saury
Aessent Technology Ltd 

29.04.11

*/ 

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

#include <stdio.h> // NOTE this needs deleted

#include <fx2regs.h>
#include <fx2macros.h>
#include <aes_i2c.h>
#include <delay.h>


//#define DEBUG_I2C 1

#ifdef DEBUG_I2C
#define i2c_printf(...) printf(__VA_ARGS__)
#else
#define i2c_printf(...)
#endif


volatile xdata BOOL cancel_i2c_trans;
#define CHECK_I2C_CANCEL() if (cancel_i2c_trans) return FALSE


BOOL startWriteI2C(BYTE addr, WORD len, BYTE* data_buf_ptr) 
{
  // Modified version of i2c_write without a stop at the end    
  BYTE retry_count=2; // two tries to write address/read ack
  cancel_i2c_trans=FALSE;
  //BOOL wait=FALSE; // use timer if needed

  // 1. Set START=1. If BERR=1, start timer*.
 step1:
  CHECK_I2C_CANCEL();
  I2CS |= bmSTART;
  if ( I2CS & bmBERR ) {
    i2c_printf ( "Woops.. need to do the timer\n" );
    delay(10); // way too long probably
    goto step1;
  }
   
    
  // 2. Write the 7-bit peripheral address and the direction bit (0 for a write) to I2DAT.
  I2DAT = addr << 1;
        
  // 3. Wait for DONE=1 or for timer to expire*. If BERR=1, go to step 1.
  while ( !(I2CS & bmDONE) && !cancel_i2c_trans);
  CHECK_I2C_CANCEL();
  if (I2CS&bmBERR) {
    i2c_printf ( "bmBERR, going to step 1\n" );
    goto step1;
  }
    
        
  // 4. If ACK=0, go to step 9.
  if ( !(I2CS & bmACK) ) {
    if (stopWriteI2C() == FALSE) return FALSE;
    --retry_count;
    if (!retry_count){
      i2c_printf ( "No ack after writing address.! Fail\n");
      return FALSE;
    }
    delay(10);
    goto step1;
  }
  if (writeI2C(len, data_buf_ptr) == FALSE) goto step1;

  return TRUE;
}

BOOL writeI2C (WORD len, BYTE* data_buf_ptr ) 
{
  // Modified version of i2c_write without a stop at the end    
  WORD cur_byte = 0;
  BYTE retry_count=2; // two tries to write address/read ack
  cancel_i2c_trans=FALSE;
  //BOOL wait=FALSE; // use timer if needed

  // 8. Repeat steps 5-7 for each byte until all bytes have been transferred.
  while ( cur_byte < len ) {
    // 5. Load I2DAT with a dataf byte.
    I2DAT = data_buf_ptr[cur_byte];
    ++cur_byte;
    // 6. Wait for DONE=1*. If BERR=1, go to step 1.
    while (!(I2CS&bmDONE) && !cancel_i2c_trans);
    CHECK_I2C_CANCEL();
    if ( I2CS&bmBERR ) {
      i2c_printf ( "bmBERR on byte %d. Going to step 1\n" , cur_byte-1 );
      return FALSE;
    }
    // 7. If ACK=0, go to step 9.
    if ( !(I2CS & bmACK) ) {
      I2CS |= bmSTOP;
      while ( (I2CS&bmSTOP) && !cancel_i2c_trans);
      i2c_printf ( "No Ack after byte %d. Fail\n", cur_byte-1 );
      return FALSE; 
    }
  }
  return TRUE;
}


BOOL stopWriteI2C() 
{
  // 9. Set STOP=1. Wait for STOP = 0 before initiating another transfer.
  //real step 9
  I2CS |= bmSTOP;
  while ( (I2CS & bmSTOP) && !cancel_i2c_trans);
  CHECK_I2C_CANCEL();
  return TRUE;
}

BOOL startReadI2C(BYTE addr, WORD len, BYTE* data_buf_ptr) 
{
  BOOL rv = FALSE;
  WORD cur_byte;
  cancel_i2c_trans=FALSE;
  //WORD timeout_cycles = (WORD)(9.0 * XTAL / I2CFREQ );
    
  // 1. Set START=1. If BERR = 1, start timer*.
 start:
  if (cancel_i2c_trans) return TRUE;
  cur_byte=0;        

  I2CS |= bmSTART;
  if ( I2CS & bmBERR ) {            
    i2c_printf ( "Woops, step1 BERR, need to do timeout\n");
    delay(10); // NOTE way too long
    goto start;
  }
        
  // 2. Write the 7-bit peripheral address and the direction bit (1 for a read) to I2DAT.
  I2DAT = (addr << 1) | 1; // last 1 for read
    
  // 3. Wait for DONE=1 or for timer to expire*. If BERR=1, go to step 1.
                
  while ( !(I2CS & bmDONE) && !cancel_i2c_trans );
  if (cancel_i2c_trans) return TRUE;
  if ( I2CS & bmBERR )
    goto start;
            
  // 4. If ACK=0, set STOP=1 and go to step 15.
  if (!(I2CS&bmACK) ) {
    I2CS |= bmSTOP;
    while ( (I2CS&bmSTOP) && !cancel_i2c_trans );
    return FALSE; 
  }
  rv = readI2C(len, data_buf_ptr);

  return rv;
}


BOOL readI2C(WORD len, BYTE *data_buf_ptr)
{
  BYTE tmp;
  WORD cur_byte = 0;
  if (len == 1) {
    // with only one byte to read, this needs set here.
    // (In this case, the tmp read is the 2nd to last read)
    I2CS |= bmLASTRD; 
        
    // 5. Read I2DAT to initiate the first burst of nine SCL pulses to clock in the first byte from the slave.
    //    Discard the value that was read from I2DAT.
    tmp = I2DAT; // discard read
    
    //12. Wait for DONE=1. If BERR=1, go to step 1.
    while (!(I2CS&bmDONE) && !cancel_i2c_trans);
    if (cancel_i2c_trans) return TRUE;
    if ( I2CS&bmBERR ) return FALSE;
  }
  else {
    while (cur_byte+1<len) { // reserve last byte read for after the loop
        
      // 6. Wait for DONE=1. If BERR=1, go to step 1.
      // 9. Wait for DONE=1. If BERR=1, go to step 1.
      while (!(I2CS&bmDONE) && !cancel_i2c_trans); CHECK_I2C_CANCEL(); 
      if ( I2CS&bmBERR ) return FALSE;

      // 10. Before reading the second-to-last I2DAT byte, set LASTRD=1.
      if (cur_byte+2==len) // 2nd to last byte
	I2CS |= bmLASTRD;
        
      // 7. Read the just-received byte of data from I2DAT. This read also initiates the next read transfer.
      // 11. Read the second-to-last byte from I2DAT. With LASTRD=1, this initiates the final byte read on
      //     the bus.
      *data_buf_ptr = I2DAT;
      data_buf_ptr++;
                        
      // 8. Repeat steps 6 and 7 for each byte until ready to read the second-to-last byte.
    }    
    //12. Wait for DONE=1. If BERR=1, go to step 1.
    while (!(I2CS&bmDONE) && !cancel_i2c_trans); CHECK_I2C_CANCEL();
    if ( I2CS&bmBERR ) return FALSE;
  }
  return TRUE;
}

BOOL stopReadI2C(WORD len, BYTE *data_buf_ptr)
{
  BYTE *lastByte_ptr = data_buf_ptr + (len-1);
  // 13. Set STOP=1.
  I2CS |= bmSTOP;
  // 14. Read the final byte from I2DAT immediately (the next instruction) after setting the STOP 
	// bit. By reading I2DAT while the "stop" condition is being generated, the just-received data 
	// byte will be retrieved without initiating an extra read transaction (nine more SCL pulses) on 
	// the I²Cbus.
  *lastByte_ptr = I2DAT; // use instead of buffer addressing so next instruction reads I2DAT

  while ( (I2CS&bmSTOP) && !cancel_i2c_trans);
  if (cancel_i2c_trans) return TRUE;

  return TRUE;
}






