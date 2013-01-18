----------------------------------------------------------------------------------------------------
-- File name: aes220_SimulationPackage_V1.2.0.vhd
----------------------------------------------------------------------------------------------------
-- Authors: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Useful simulation functions for generating test benches (non
-- synthesizable code)
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V0.1.1 adding a simulated fifo full signal in receive_data procedure
-- V1.2.0 removed some reports no longuer required
-- 
----------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2011 Sebastien Saury, Aessent Technology Ltd
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

use std.textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

package aes220_SimulationPackage_V1_2_0 is

  -- types declaration
  subtype byte is std_logic_vector(7 downto 0);
  type    byte_array is array (natural range <>) of byte;
  --type    header is record
  --  channel    : byte;
  --  count_high : byte;
  --  count_low  : byte;
  --end record;

  signal rst_s    : std_logic;
  signal fi_s     : std_logic_vector(2 downto 0);
  signal if_s     : std_logic_vector(7 downto 0);
  signal ifData_s : std_logic_vector(7 downto 0);

  -- FIFO controls
  --constant FIFO_READ   : std_logic_vector(4 downto 0) := "00011";  -- assert SLRD & SLOE
  --constant FIFO_WRITE  : std_logic_vector(4 downto 0) := "01000";  -- assert SLWR
  --constant FIFO_COMMIT : std_logic_vector(4 downto 0) := "00100";  -- assert PKTEND
  ----constant FIFO_COMMIT : std_logic_vector(4 downto 0) := "01100";  -- assert SLWR & PKTEND
  --constant FIFO_WAIT   : std_logic_vector(4 downto 0) := "10000";  -- assert nothing
  ---- FIFO addresses
  --constant OUT_FIFO    : std_logic_vector(1 downto 0) := "00"; -- EP2OUT
  --constant IN_FIFO     : std_logic_vector(1 downto 0) := "10"; -- EP6IN  
  
  procedure send_data (
    variable dataOut_ar : in    byte_array;
    variable dataSize_v : in    integer;
    -- FX2 connections to the test bench
    signal rst_s : inout   std_logic;
    signal fi_s  : inout  std_logic_vector(2 downto 0);
    signal if_s  : in   std_logic_vector(7 downto 0);
    signal ifData_s : inout std_logic_vector(7 downto 0));
  
  procedure receive_data (
    variable dataIn_ar  : inout byte_array;
    variable dataSize_v : in    integer;
    -- FX2 connections to the test bench
    signal rst_s : inout   std_logic;
    signal fi_s  : inout  std_logic_vector(2 downto 0);
    signal if_s  : in   std_logic_vector(7 downto 0);
    signal ifData_s : inout std_logic_vector(7 downto 0));

  procedure pipe_out (
    variable channel_v  : in    integer;
    variable dataSize_v : in    integer;
    variable dataOut_ar : in    byte_array;
    -- FX2 connections to the test bench
    signal rst_s : inout std_logic;
    signal fi_s  : inout std_logic_vector(2 downto 0);
    signal if_s  : in  std_logic_vector(7 downto 0);
    signal ifData_s : inout std_logic_vector(7 downto 0));
  
  procedure pipe_in (
    variable channel_v  : in    integer;
    variable dataSize_v : in    integer;
    variable dataIn_ar  : inout byte_array;
    -- FX2 connections to the test bench
    signal rst_s : inout std_logic;
    signal fi_s  : inout std_logic_vector(2 downto 0);
    signal if_s  : in  std_logic_vector(7 downto 0);
    signal ifData_s : inout std_logic_vector(7 downto 0));
  
end aes220_SimulationPackage_V1_2_0;

package body aes220_SimulationPackage_V1_2_0 is

  -- purpose: takes various parameters and mimicks the FX2
  -- (the FX2 signals themselves).
  -- Uses FX2 Interface port
  -- Transfer direction: out = host (PC) to FPGA, in = FPGA to host (PC)
  procedure send_data (
    variable dataOut_ar : in    byte_array;
    variable dataSize_v : in    integer;
    -- FX2 connections to the test bench
    signal rst_s : inout std_logic;
    signal fi_s  : inout std_logic_vector(2 downto 0);
    signal if_s  : in    std_logic_vector(7 downto 0);
    signal ifData_s : inout std_logic_vector(7 downto 0)) is

    variable arrayIndex_v : integer;

  begin  -- test_procedure
    report "Beginning send_data_4" severity note;
    fi_s(2) <= 'Z';              -- fi is inout for now (to be reviewed)
    fi_s(0) <= '0';              -- Data available signal
    fi_s(1) <= '0';              -- fifo full signal (fifo not full)
    arrayIndex_v := 0;
    wait for 50ns;
    wait for 50ns;                     -- First wait instruction gets ignored
                                       -- on a simulation restart for some reason!!!
    fi_s(0) <= '1';
    ifData_s <= dataOut_ar(arrayIndex_v);
    while arrayIndex_v /= dataSize_v loop
      wait on if_s(7);     -- ifclk
      if if_s(4) = '0' then      -- slcs
        if (if_s(6 downto 5)) = "00" then -- fifo address = out fifo
          if (if_s(3) and if_s(2)) = '1' then  -- sloe and slrd
            if if_s(7) = '1' then
              arrayIndex_v := arrayIndex_v + 1;
            end if;
            if arrayIndex_v < dataSize_v then
              ifData_s <= dataOut_ar(arrayIndex_v);
            end if;
          end if;
        end if;
      end if;
    end loop;
    fi_s(0) <= '0';
  end send_data;

  -- purpose: takes various parameters and mimicks the FX2
  -- (the FX2 signals themselves).
  -- Uses FX2 Interface port
  -- Transfer direction: out = host (PC) to FPGA, in = FPGA to host (PC)
  procedure pipe_out (
    variable channel_v  : in integer;
    variable dataSize_v : in integer;
    variable dataOut_ar : in byte_array;
    -- FX2 connections to the test bench
    signal rst_s : inout std_logic;
    signal fi_s  : inout std_logic_vector(2 downto 0);
    signal if_s  : in    std_logic_vector(7 downto 0);
    signal ifData_s : inout std_logic_vector(7 downto 0)) is

    variable headerSize_v   : integer := 3;
    variable headerArray_ar : byte_array(headerSize_v - 1 downto 0);
    variable dataSize_s     : std_logic_vector(15 downto 0);

  begin  -- pipe_out
    report "Beginning pipe_out" severity note;
    headerArray_ar(0) := '0' & conv_std_logic_vector(channel_v, 7);
    dataSize_s := conv_std_logic_vector(dataSize_v, 16);    
    headerArray_ar(1) := dataSize_s(15 downto 8);
    headerArray_ar(2) := dataSize_s(7 downto 0);
    wait for 50ns;
    -- Call the procedures
    -- Send the header out
    send_data(headerArray_ar, headerSize_v,
                     rst_s, fi_s, if_s, ifData_s);
    wait for 150ns;
    -- Now send the data
    send_data(dataOut_ar, dataSize_v,
                     rst_s, fi_s, if_s, ifData_s);
    report "Finishing pipe_out" severity note;
    wait for 150ns;                     -- Wait so that if another function is
                                        -- called there are some periods coming
                                        -- through between the two.
  end pipe_out;

  -- purpose: takes various parameters and mimicks the FX2_interface module
  -- (The FX2 signals themselves).
  -- Uses FX2 Interface port
  -- Transfer direction: out = host (PC) to FPGA, in = FPGA to host (PC)
  procedure receive_data (
    variable dataIn_ar  : inout byte_array;
    variable dataSize_v : in    integer;
    -- FX2 connections to the test bench
    signal rst_s : inout std_logic;
    signal fi_s  : inout std_logic_vector(2 downto 0);
    signal if_s  : in    std_logic_vector(7 downto 0);
    signal ifData_s : inout std_logic_vector(7 downto 0)) is

    variable arrayIndex_v : integer;
    
  begin  -- test_procedure
    report "Beginning receive_data_1" severity note;
    ifData_s <= (others => 'Z');
    arrayIndex_v := 0;
    fi_s(1) <= '0';              -- fifo full signal (fifo not full)
    while arrayIndex_v /= dataSize_v loop
      wait on if_s(7);     -- ifclk
      if if_s(4) = '0' then      -- slcs
        if (if_s(6 downto 5)) = "10" then -- fifo address = in fifo
          if (if_s(1)) = '1' then  -- slwr
            if if_s(7) = '1' then  -- ifclk
              arrayIndex_v := arrayIndex_v + 1;
              --if arrayIndex_v = 8 then     -- Simulates fifo full
              --  fi_s(1) <= '1';            -- Comment or uncomment 
              --elsif arrayIndex_v = 9 then  -- as required
              --  wait for 200ns;            --
              --  fi_s(1) <= '0';            --
              --end if;                      -- 
            end if;
            if arrayIndex_v < dataSize_v then
              dataIn_ar(arrayIndex_v) := ifData_s;
            end if;
          end if;
        end if;
      end if;
    end loop;
    report "Finishing receive_data_1" severity note;
  end receive_data;

  -- purpose: takes various parameters and mimicks the FX2
  -- (the FX2 signals themselves).
  -- Uses FX2 Interface port
  -- Transfer direction: out = host (PC) to FPGA, in = FPGA to host (PC)
  procedure pipe_in (
    variable channel_v  : in    integer;
    variable dataSize_v : in    integer;
    variable dataIn_ar  : inout byte_array;
    -- FX2 connections to the test bench
    signal rst_s : inout std_logic;
    signal fi_s  : inout std_logic_vector(2 downto 0);
    signal if_s  : in    std_logic_vector(7 downto 0);
    signal ifData_s : inout std_logic_vector(7 downto 0)) is

    variable headerSize_v   : integer := 3;
    variable headerArray_ar : byte_array(headerSize_v - 1 downto 0);
    variable dataSize_s     : std_logic_vector(15 downto 0);

  begin  -- pipe_in
    report "Beginning pipe_in" severity note;
    headerArray_ar(0) := '1' & conv_std_logic_vector(channel_v, 7); 
    dataSize_s := conv_std_logic_vector(dataSize_v, 16);    
    headerArray_ar(1) := dataSize_s(15 downto 8);
    headerArray_ar(2) := dataSize_s(7 downto 0);
    wait for 50ns;
    -- Call the procedures
    -- Send the header out
    send_data(headerArray_ar, headerSize_v,
                     rst_s, fi_s, if_s, ifData_s);
    --wait for 150ns;
    -- Now receive the data
    receive_data(dataIn_ar, dataSize_v,
                        rst_s, fi_s, if_s, ifData_s);
    report "Finishing pipe_in" severity note;
    wait for 150ns;                     -- Wait so that if another function is
                                        -- called there are some periods coming
                                        -- through between the two.
  end pipe_in;

end aes220_SimulationPackage_V1_2_0;

