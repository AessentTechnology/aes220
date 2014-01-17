/******************************************************************************
File name: aes220_FifoExample.cs
===============================================================================
DESCRIPTION

===============================================================================
CHANGES

Post V1.4.4: First release, example is using C# library

===============================================================================
NOTES

The path to the aes220a_Loopback_Example_V1_2_1_ent.bin file will need to be 
adjusted of the file is not with the executable.

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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
  class Program
  {

    static void Main(string[] args)
    {
      aes220ClassLibrary.aes220Dev aes220 = new aes220ClassLibrary.aes220Dev();
      int rv = 99, tmp;
      byte[] bufOut = new byte[5] { 1, 2, 3, 4, 5 };
      byte[] bufIn = new byte[5] { 0, 0, 0, 0, 0 };

      //string binFile = ("aes220a_Fifo_Example_ent.bin");
      string binFile = ("aes220b_Fifo_Example_ent.bin");

      Console.WriteLine("Opening aes220 Device");
      rv = aes220.Open(0, 9);
      Console.WriteLine("Device opened with status {0}", rv);

      Console.WriteLine("Configuring the FPGA with the FIFO example binary");
      rv = aes220.ConfigureFPGA(binFile);
      Console.WriteLine("Status returned: {0}", rv);
            
      Console.WriteLine("Sending payload out via pipe 1");
      rv = aes220.PipeOut(bufOut, 5, 1);

      Console.WriteLine("Receiving payload back via pipe 4");
      rv = aes220.PipeIn(bufIn, 5, 4);
      foreach (byte i in bufIn)
	{
	  Console.Write("{0}  ", i);
	}
      Console.WriteLine();

      Console.WriteLine("Closing aes220 Device");
      aes220.Close();
      Console.WriteLine("Status returned: {0}", rv);
      tmp = Console.Read();
    }
  }
}
