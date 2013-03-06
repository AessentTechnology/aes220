----------------------------------------------------------------------------------------------------
-- File name: aes220_Loopback_Example_TestBench_V1.2.1.vhd
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Test bench using procedures present in the simulation package (non synthesizable code)
--
----------------------------------------------------------------------------------------------------
--CHANGES
-- 
-- V1.0.0: Original version
-- V1.2.0: To exercise aes220_Loopback_Example_V1.2.0.vhd
-- V1.2.1: To exercise aes220_Loopback_Example_V1.2.1.vhd
--
----------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2012-2013 Sebastien Saury, Aessent Technology Ltd
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
----------------------------------------------------------------------------------------------------
library ieee;
library work;
use work.aes220_SimulationPackage_V1_2_1.all;

use std.textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity aes220_Loopback_Example_TestBench_V1_2_1_ent is
	generic(
		RESET_ACTIVE_LEVEL_c : std_logic := '1';
    NUMBER_OF_CYCLES_c   : integer := 20
    );
end aes220_Loopback_Example_TestBench_V1_2_1_ent;

architecture testbench_arch of aes220_Loopback_Example_TestBench_V1_2_1_ent is

  -- signals declaration
  signal led_s   : std_logic_vector (4 downto 1);
  signal clock_s : std_logic := '0';
  
  -- components declarations
  component aes220_Loopback_Example_V1_2_1_ent
    Port(
      -- FX2 connections
      RST_in  : in    std_logic;      -- Allows to place the different processes into reset
      FI_in   : in    std_logic_vector(2 downto 0);
      IF_out  : out   std_logic_vector(7 downto 0);      
      FI_io   : inout std_logic_vector(7 downto 0);
      LED_out : out   std_logic_vector(4 downto 1)
      );
  end component;


begin

  -- Components instantiations
  myApp : aes220_Loopback_Example_V1_2_1_ent
    port map (
      -- FX2 connections (signals defined in the aes220_SimulationPackage.vhd)
      RST_in  => rst_s,
      FI_in   => fi_s,
      IF_out  => if_s,
      FI_io   => ifData_s,
      LED_out => led_s
      );

-- purpose: Generates the FX2 clock
-- type   : combinational
-- inputs : 
-- outputs: clock_s
  clock: process
  begin  -- process clock
    clock_s <= '0';
    wait for 10.4ns;
    clock_s <= '1';
    wait for 10.4ns;
  end process clock;
  
  fi_s(2) <= clock_s; -- Clock to the FX2 Interface
  
  test_proc: process
    -- Channels addresses:
    variable outChannel1_v  : integer := 1;
    variable outChannel2_v  : integer := 2;
    variable outChannel3_v  : integer := 3;
    variable inChannel_v    : integer := 4;
    -- Data arrays
    variable dataSize_v   : integer := 16;
    variable one_v        : integer := 1;
    variable lsb_ar       : byte_array(0 downto 0);
    variable msb_ar       : byte_array(0 downto 0);
    variable dataOut_ar   : byte_array(dataSize_v-1 downto 0);
    variable dataIn_ar    : byte_array(dataSize_v-1 downto 0);

  begin  -- process test_proc
    rst_s <= '1';
    -- Prepare the array
    for index in 0 to dataSize_v - 1 loop
      dataOut_ar(index) := conv_std_logic_vector(index, 8);
      dataIn_ar(index) := (others => '0');
    end loop;
    lsb_ar(0) := conv_std_logic_vector(dataSize_v, 8);
    msb_ar(0) := (others => '0');
    wait for 100ns;
    rst_s <= '0';
    
    -- Call the procedures
    -- Sending data out
    -- First send the lsb out
    pipe_out(outChannel1_v, one_v, lsb_ar,
             rst_s, fi_s, if_s, ifData_s);
    -- Followed by the msb out
    pipe_out(outChannel2_v, one_v, msb_ar,
             rst_s, fi_s, if_s, ifData_s);
    -- Then Send the data out
    pipe_out(outChannel3_v, dataSize_v, dataOut_ar,
             rst_s, fi_s, if_s, ifData_s);

    -- Receiving data in
    -- Send the lsb out again to reset the counter
    pipe_out(outChannel1_v, one_v, lsb_ar,
             rst_s, fi_s, if_s, ifData_s);
    -- Read the incoming data (write it into the dataIn_ar array)
    pipe_in(inChannel_v, dataSize_v, dataIn_ar,
            rst_s, fi_s, if_s, ifData_s);
    wait;
  end process test_proc;

end testbench_arch;

