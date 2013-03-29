/******************************************************************************
File name: aes220_C#API.h
===============================================================================
DESCRIPTION

Commands relevant to the programming of the aes220 assembly (fpga and micro-
controller) using the C# language.

===============================================================================
CHANGES

Post release:

Post V1.4.2: First release

===============================================================================

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

******************************************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace aes220ClassLibrary
{
    unsafe public class aes220Dev
    {
        aes220_Dev aes220 = new aes220_Dev();


        /* Function: Open(int idx, int vbs)

        Parameters:

        idx: the device identification number (0 if only one such device on bus)

        vbs: level of verbosity used to write the log file (0 = none, 3 = error messages, 
        6 = mundane messages, 9 = everything.

        Returns: 

        Returns 0 on success.
         */
        public int Open(int idx, int vbs)
        {
            int rv = 99;
            rv = aes220.Open(idx, vbs);
            return rv;
        }


        /* Function: Open(int vid, int pid, int idx, int vbs)
       Overloaded function allowing to open the device with a different vid/pid pair. 

       Parameters:

       vid: the USB vendor ID of the device (if different from default one)

       pid: the USB device ID (if different from default)

       idx: the device identification number (0 if only one such device on bus)

       vbs: level of verbosity used to write the log file (0 = none, 3 = error messages, 
       6 = mundane messages, 9 = everything)

       Returns: 

       Returns 0 on success.
        */
        public int Open(int vid, int pid, int idx, int vbs)
        {
            int rv = 99;
            rv = aes220.Open(vid, pid, idx, vbs);
            return rv;
        }



        /* Function: int Close()
       Closes the device.

       Parameters:

       None

       Returns: 

       Returns 0 on success.
        */
        public int Close()
        {
            int rv = 99;
            rv = aes220.Close();
            return rv;
        }


        /* Function: int PipeOut(byte[] buf, uint bufSize, byte channel)
       Transmits a buffer of data (bytes) over the USB link from the host (PC) to the device 
       (aes220).

       Parameters:

       buf: a pointer to a buffer of bytes.
   
       bufSize: the size of the afore mentioned buffer (max size is 4GiB)

       channel: the channel to communicate with in the FPGA application

       Returns:

       Returns 0 on success.
        */
        public int PipeOut(byte[] payload, uint payloadSize, byte channel)
        {
            int rv = 99;
            fixed (byte* payload_ptr = payload) { rv = aes220.PipeOut(payload_ptr, payloadSize, channel); }
            return rv;
        }


        /* Function:  int PipeIn(byte[] buf, uint bufSize, byte channel)
       Receives a buffer of data (bytes) over the USB link from the device (aes220) to the host (PC).

       Parameters:

       buf: a pointer to a buffer of bytes.

       bufSize: the size of the afore mentioned buffer (max size is 4GiB)

       channel: the channel to communicate with in the FPGA application

       Returns:

       Returns 0 on success.
        */
        public int PipeIn(byte[] payload, uint payloadSize, byte channel)
        {
            int rv = 99;
            fixed (byte* payload_ptr = payload) { rv = aes220.PipeIn(payload_ptr, payloadSize, channel); }
            return rv;
        }


        /* Function: int AssertSoftReset()
       Send a reset signal to the FPGA. It is not a hard reset so the result depends on the code implememted in the FPGA.

       Note: The USB interface provided does take account of the Soft Reset signal.

       Parameters:

       None

       Returns:

       Returns 0 on success.
        */
        public int AssertSoftReset()
        {
            int rv = 99;
            rv = aes220.AssertSoftReset();
            return rv;
        }



        /* Function: int ClearSoftReset()
       Clears the reset signal to the FPGA. It is not a hard reset so the result depends on the code implememted in the FPGA. 

       Note: The USB interface provided does take account of the Soft Reset signal.

       Parameters:

       None

       Returns:

       Returns 0 on success.
        */
        public int ClearSoftReset()
        {
            int rv = 99;
            rv = aes220.ClearSoftReset();
            return rv;
        }


        /* Function: int Turn3V3On()
       Turns ON the 3.3V power supply to the banks and FPGA I/Os

       Note: 3.3V is turned ON by default but can also be turned OFF using Turn3V3Off (see below)

       Parameters:

       None

       Returns:

       Returns 0 on success.
        */
        public int Turn3V3On()
        {
            int rv = 99;
            rv = aes220.Turn3V3On();
            return rv;
        }


        /* Function: int Turn3V3Off()
       Turns ON the 3.3V power supply to the banks and FPGA I/Os

       Note: 3.3V is turned ON by default but it can be necessary to turn it OFF if using an external 3.3V supply (if more current is required than can be provided on-board) or if stacking up two or more boards together.

       Parameters:

       None

       Returns:

       Returns 0 on success.
        */
        public int Turn3V3Off()
        {
            int rv = 99;
            rv = aes220.Turn3V3Off();
            return rv;
        }


        /* Function: int ReadI2C(byte deviceAddress, byte[] data, uint16_t dataLength)
       Reads data from an I2C device

       Parameters:

       deviceAddress: the address of the device on the I2C bus

       data: a data array (pointer to)

       dataLength: the length of the data (max length 64KB)

       Returns:

       Returns 0 on success.
        */
        public int ReadI2C(byte deviceAddress, byte[] data, ushort dataLength)
        {
            int rv = 99;
            fixed (byte* data_ptr = data) { rv = aes220.ReadI2C(deviceAddress, data_ptr, dataLength); }
            return rv;
        }


        /* Function: int WriteI2C(byte deviceAddress, byte[] data, ushort dataLength)
       Writes data from an I2C device

       Parameters:

       deviceAddress: the address of the device on the I2C bus

       data: a data array (pointer to)

       dataLength: the length of the data (max length 64KB)

       Returns:

       Returns 0 on success.
        */
        public int WriteI2C(byte deviceAddress, byte[] data, ushort dataLength)
        {
            int rv = 99;
            fixed (byte* data_ptr = data) { rv = aes220.WriteI2C(deviceAddress, data_ptr, dataLength); }
            return rv;
        }


        /* Function: int CombinedI2C(byte deviceAddress, byte[] dataToWrite, ushort dataToWriteLength, byte[] dataToRead, ushort dataToReadLength)
       Executes a write followed by a read of data to and from an I2C device without inserting a stop bit in between. 

       Parameters:

       deviceAddress: the address of the device on the I2C bus

       dataToWrite: a data array (pointer to)

       dataToWriteLength: the length of the data to write (max length 64KB)

       dataToRead: a data array (pointer to)

       dataToReadLength: the length of the data to write (max length 64KB)

       Returns:

       Returns 0 on success.
        */
        public int CombinedI2C(byte deviceAddress,
                byte[] dataToWrite, ushort dataToWriteLength,
                byte[] dataToRead, ushort dataToReadLength)
        {
            int rv = 99;
            fixed (byte* dataToWrite_ptr = dataToWrite)
            {
                fixed (byte* dataToRead_ptr = dataToRead)
                {
                    rv = aes220.CombinedI2C(deviceAddress,
                                        dataToWrite_ptr, dataToWriteLength,
                                    dataToRead_ptr, dataToReadLength);
                }
            }
            return rv;
        }

        /* Function: int SetBoardInfo(const byte[] boardInfo)
       Sets the information relevant to the module such as Serial Number, Module Type (aes220a or b) and its revision number. This should be left alone unless the micro-controller EEPROM is erased and needs reprogramming.

       Parameters:

       boardInfo: an array of 8 unsigned char. Bytes: 3.3V ON/OFF(1), a/b, A, 1, SN, dd, mm, yyyy

       Note: Do not use this function to turn the 3.3V ON or OFF, use the Turn3V3ON/OFF functions

       Returns:

       Returns 0 on success.
        */
        public int SetBoardInfo(byte[] boardInfo)
        {
            int rv = 99;
            fixed (byte* boardInfo_ptr = boardInfo) { rv = aes220.SetBoardInfo(boardInfo_ptr); }
            return rv;
        }


        /* Function: int GetBoardInfo(const byte[] boardInfo)
       Reads the information relevant to the module such as Serial Number, Module Type (aes220a or b) and its revision number as well as whether the 3.3V rail is on or off.

       Parameters:

       boardInfo: an array of 8 unsigned char. Bytes: 3.3V ON/OFF, a/b, A, 1, SN, dd, mm, yyyy

       Returns:

       Returns 0 on success.
        */
        public int GetBoardInfo(byte[] boardInfo)
        {
            int rv = 99;
            fixed (byte* boardInfo_ptr = boardInfo) { rv = aes220.GetBoardInfo(boardInfo_ptr); }
            return rv;
        }


        /* Function: int GetFirmwareInfo(const byte[] firmwareInfo)
       Reads the software version written into the code.

       Parameters:

       boardInfo: an array of 3 unsigned char. Bytes: Major, Minor, and revision numbers e.g.: {1.4.0} 

       Returns:

       Returns 0 on success.
        */
        public int GetFirmwareInfo(byte[] firmwareInfo)
        {
            int rv = 99;
            fixed (byte* firmwareInfo_ptr = firmwareInfo) { rv = aes220.GetFirmwareInfo(firmwareInfo_ptr); }
            return rv;
        }


        /* Function: int ProgramMCRAM(const byte[]  file)
       Programs the micro-controller RAM with the given file.

       Parameters:

       file: pointer to the file to be downloaded in the micro-controller's RAM 

       Returns:

       Returns 0 on success.
        */
        public int ProgramMCRAM(string fileName)
        {
            int rv = 99;
            // Convert the string to a byte array
            byte[] bytesName = Encoding.ASCII.GetBytes(fileName);
            // And now to a sbyte array
            sbyte[] sbytesName = new sbyte[bytesName.Length];
            for (int i = 0; i < bytesName.Length; i++)
            { sbytesName[i] = (sbyte)bytesName[i]; }
            fixed (sbyte* file_ptr = sbytesName) { rv = aes220.ProgramMCRAM(file_ptr); }
            return rv;
        }


        /* Function: int ProgramMCEEPROM(const byte[]  file)
       Programs the micro-controller EEPROM with the given file.

       Parameters:

       file: pointer to the file to be downloaded in the micro-controller's EEPROM

       Returns:

       Returns 0 on success.
        */
        public int ProgramMCEEPROM(string fileName)
        {
            int rv = 99;
            // Convert the string to a byte array
            byte[] bytesName = Encoding.ASCII.GetBytes(fileName);
            // And now to a sbyte array
            sbyte[] sbytesName = new sbyte[bytesName.Length];
            for (int i = 0; i < bytesName.Length; i++)
            { sbytesName[i] = (sbyte)bytesName[i]; }
            fixed (sbyte* file_ptr = sbytesName) { rv = aes220.ProgramMCEEPROM(file_ptr); }
            return rv;
        }


        /* Function: int ConfigureFPGA(const byte[]  file)
       Configure the FPGA with the given file.

       Parameters:

       file: pointer to the FPGA configuration file

       Returns:

       Returns 0 on success.
        */
        public int ConfigureFPGA(string fileName)
        {
            int rv = 99;
            // Convert the string to a byte array
            byte[] bytesName = Encoding.ASCII.GetBytes(fileName);
            // And now to a sbyte array
            sbyte[] sbytesName = new sbyte[bytesName.Length];
            for (int i = 0; i < bytesName.Length; i++)
            { sbytesName[i] = (sbyte)bytesName[i]; }
            fixed (sbyte* file_ptr = sbytesName) { rv = aes220.ConfigureFPGA(file_ptr); }
            return rv;
        }

        /* Function: int ProgramFPGA(const byte[]  file)
       Program the FPGA flas with the given file.

       Parameters:

       file: pointer to the FPGA configuration file

       Returns:

       Returns 0 on success.
        */
        public int ProgramFPGA(string fileName)
        {
            int rv = 99;
            // Convert the string to a byte array
            byte[] bytesName = Encoding.ASCII.GetBytes(fileName);
            // And now to a sbyte array
            sbyte[] sbytesName = new sbyte[bytesName.Length];
            for (int i = 0; i < bytesName.Length; i++)
            { sbytesName[i] = (sbyte)bytesName[i]; }
            fixed (sbyte* file_ptr = sbytesName) { rv = aes220.ProgramFPGA(file_ptr); }
            return rv;
        }

        /* Function: int EraseFPGA()
       Erase the FPGA Flash (First page only to prevent the FPGA from booting up).

       Parameters:

       None

       Returns:

       Returns 0 on success.
        */
        public int EraseFPGA()
        {
            int rv = 99;
            rv = aes220.EraseFPGA();
            return rv;
        }

    }
}
