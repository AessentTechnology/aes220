// Copyright (C) 2009 Ubixum, Inc. 
//
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License, or (at your option) any later version.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this library; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

/** \file i2c.h 
 *  Utilities for reading and writing to i2c devices and as eeproms.
 **/

#ifndef AES_I2C_H
#define AES_I2C_H

#include "fx2types.h"

/**
 * i2c_write and i2c_read set this to FALSE at the beginning of a 
 * transaction.  If for some reason, the read/write is taking too
 * long or not returning, firmware can set this to TRUE to cause the
 * routine to abort.  (Usually done via an interrupt).
 **/
extern volatile xdata BOOL cancel_i2c_trans;


/**
 * \brief Starts a read frame on the i2c bus.
 *
 *  Needs to be followed by stopWriteI2C(---)
 *  If more data than len need to be transmitted in the same frame it can be
 *  followed by writeI2C(----)
 *
 * \param addr i2c address
 * \param len length of data
 * \param data_buf addr data
 **/
BOOL startWriteI2C(BYTE addr, WORD len, BYTE* data_buf_ptr);

/**
 * \brief write data to i2c bus without a start or stop bit.
 *
 *  Needs to be preceded by startWriteI2C(---)
 *  Needs to be followed by stopWriteI2C(---)
 *  If more data than len need to be transmitted in the same frame it can be
 *  followed by other writeI2C(----)
 *
 * \param len length of data
 * \param data_buf data
 **/
BOOL writeI2C(WORD len, BYTE* data_buf_ptr); 

/**
 * \brief add a stop on the i2c bus.
 *
 * \param none
 **/
BOOL stopWriteI2C();

/**
 * \brief Starts a read frame on the i2c bus.
 *
 *  Needs to be followed by stopReadI2C(---)
 *  If more data than len need to be received in the same frame it can be
 *  followed by readI2C(----)
 *
 * \param addr i2c address
 * \param len length of data
 * \param data_buf addr data
 **/
BOOL startReadI2C(BYTE addr, WORD len, BYTE* data_buf_ptr);

/**
 * \brief read data on the i2c bus.
 * 
 *  Needs to be preceded by startReadI2C(---)
 *  Needs to be followed by stopReadI2C(---)
 *  If more data than len need to be received in the same frame it can be
 *  followed by other readI2C(----)
 *
 * \param len number of bytes to read
 * \param buf buffer to store data
 **/
BOOL readI2C(WORD len, BYTE *data_buf_ptr);

/**
 * \brief add a stop on the i2c bus.
 * 
 * Also reads the last data to be received as the stop bit needs to be set
 * before reading the last byte. (remember to shorten by one the last readI2C
 * so that it doesn't contain the last byte).
 *
 * \param len last byte index
 * \param data_buf_ptr data buffer
 **/
BOOL stopReadI2C(WORD len, BYTE *data_buf_ptr);


#endif
