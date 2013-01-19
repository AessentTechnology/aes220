----------------------------------------------------------------------------------------------------
-- File name: aes220_Package_V1.2.0.vhd
----------------------------------------------------------------------------------------------------
-- Authors: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Package containing the types, signals and components declarations relevant
-- to the aes220 modules.
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V1.0.0 Original package
-- V1.2.0 Using entities from library version 1.2.0 (pause input added to pipes)
-- 
----------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2012 Sebastien Saury, Aessent Technology Ltd
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

package aes220_Package_V1_2_0 is

  -- types declaration
  subtype byte is std_logic_vector(7 downto 0);
  type    byte_array is array (natural range <>) of byte;

  signal rst_s : std_logic;
  signal ip_s       : std_logic_vector(18 downto 0);   -- Pipe connections
  signal pi_s       : std_logic_vector(9 downto 0);  -- Pipe connections

  component aes220_FX2_Interface_ent
    Port(
      -- FX2 connections
      RST_in : in    std_logic;   -- Places the different processes into reset if setup    
      FI_in  : in    std_logic_vector(2 downto 0);  -- Input signals from the FX2
      IF_out : out   std_logic_vector(7 downto 0);  -- Output signals to the FX2
      FI_io  : inout std_logic_vector(7 downto 0);  -- FX2 data bus 
      -- Pipe connections
      PI_in  : in  std_logic_vector(9 downto 0);
      IP_out : out std_logic_vector(18 downto 0);
      -- User application connections
      IFCLK_out : out std_logic     -- User clock, same as FX2_CLKOUT
      );
  end component;
  
  component aes220_PipeIn_ent
    Port (
      -- Connections to the FX2 interface
      IP_in  : in  std_logic_vector(18 downto 0);
      PI_out : out std_logic_vector(9 downto 0);
      -- User application connections
      P_ADDR_in   : in std_logic_vector(6 downto 0);  -- The pipe address
      PAUSE_in    : in std_logic;
      READ_RQ_out : out std_logic;     -- Data available flag
      DATA_out    : out std_logic_vector(7 downto 0)  -- data to user app
      );
  end component;

  component aes220_PipeOut_ent
    port(
      -- Connections to the FX2 interface
      IP_in    : in  std_logic_vector(18 downto 0);
      PI_out   : out std_logic_vector(9 downto 0);
      -- User application connections
      P_ADDR_in    : in std_logic_vector(6 downto 0);  -- The pipe address
      PAUSE_in     : in std_logic;
      WRITE_RQ_out : out std_logic;     -- Data available flag
      DATA_in      : in  std_logic_vector(7 downto 0)  -- data to user app
      );
  end component;

end aes220_Package_V1_2_0;


