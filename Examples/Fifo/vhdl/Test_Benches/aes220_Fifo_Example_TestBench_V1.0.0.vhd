----------------------------------------------------------------------------------------------------
-- File name: aes220_Fifo_Example_TestBench.vhd
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
use work.aes220_SimulationPackage_V1_3_0.all;

use std.textio.all;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity aes220_Fifo_Example_TestBench_ent is
	generic(
		RESET_ACTIVE_LEVEL_c : std_logic := '1';
    NUMBER_OF_CYCLES_c   : integer := 20
    );
end aes220_Fifo_Example_TestBench_ent;

architecture testbench_arch of aes220_Fifo_Example_TestBench_ent is

  -- signals declaration
  signal led_s   : unsigned (4 downto 1);
  signal clock_s : std_logic := '0';
  signal test : std_logic := '0';
  -- components declarations
  component aes220_Fifo_Example_ent
    Port(
      -- FX2 connections
      RST_in  : in    std_logic;      -- Allows to place the different processes into reset
      FI_in   : in    unsigned(2 downto 0);
      IF_out  : out   unsigned(7 downto 0);      
      FI_io   : inout unsigned(7 downto 0);
      LED_out : out   unsigned(4 downto 1)
      );
  end component;


begin

  -- Components instantiations
  myApp : aes220_Fifo_Example_ent
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
    wait for 10.415ns;
    clock_s <= '1';
    wait for 10.415ns;
  end process clock;
  
  fi_s(2) <= clock_s; -- Clock to the FX2 Interface
  
  test_proc: process
    -- Channels addresses:
    variable outChannel_v   : integer := 1;
    variable inChannel_v    : integer := 2;
    -- Data arrays
    variable dataSizeOut_v : integer := 16;
    variable dataSizeIn_v  : integer := 16;
    variable dataOut_ar    : byte_array(dataSizeOut_v-1 downto 0);
    variable dataIn_ar     : byte_array(dataSizeIn_v-1 downto 0);

  begin  -- process test_proc
    rst_s <= '1';
    -- Prepare the arrays
    for index in 0 to dataSizeOut_v - 1 loop
      dataOut_ar(index) := to_unsigned(index+1, 8);
    end loop;
    for index in 0 to dataSizeIn_v - 1 loop
      dataIn_ar(index) := (others => '0');
    end loop;
    wait for 100ns;
    rst_s <= '0';
    
    -- Call the procedures
    -- Sending data out
    pipe_out(outChannel_v, dataSizeOut_v, dataOut_ar,
             rst_s, fi_s, if_s, ifData_s);

    -- Receiving data in
    -- Read the incoming data (write it into the dataIn_ar array)
    pipe_in(inChannel_v, dataSizeIn_v, dataIn_ar,
            rst_s, fi_s, if_s, ifData_s);

    wait;
  end process test_proc;

end testbench_arch;

