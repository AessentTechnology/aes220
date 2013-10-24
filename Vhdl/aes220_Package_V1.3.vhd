----------------------------------------------------------------------------------------------------
-- File name: aes220_Package_V1.3.vhd
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
-- V1.2   Removed the patch level as strictly speaking the package doesn't
--        invoke the library file directly.
--        As long as the entities pinout do not change the package will be
--        valid. If the entities pinout change then the minor rev number will
--        change too (to 1.3)
-- V1.3   Changing the pipes to a VALID/READY interface
--
----------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2012-2013 Sebastien Saury, Aessent Technology Ltd
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the Lesser GNU General Public License as published by
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
use ieee.numeric_std.all;

package aes220_Package_V1_3 is

  -- types declaration
  subtype byte is unsigned(7 downto 0);
  type    byte_array is array (natural range <>) of byte;

  signal rst_s : std_logic;
  signal ip_s       : unsigned(18 downto 0);   -- Pipe connections
  signal pi_s       : unsigned(9 downto 0);  -- Pipe connections

  component aes220_FX2_Interface_ent
    Port(
      -- FX2 connections
      RST_in : in    std_logic;   -- Places the different processes into reset if setup    
      FI_in  : in    unsigned(2 downto 0);  -- Input signals from the FX2
      IF_out : out   unsigned(7 downto 0);  -- Output signals to the FX2
      FI_io  : inout unsigned(7 downto 0);  -- FX2 data bus 
      -- Pipe connections
      PI_in  : in  unsigned(9 downto 0);
      IP_out : out unsigned(18 downto 0);
      -- User application connections
      IFCLK_out : out std_logic     -- User clock, same as FX2_CLKOUT
      );
  end component;
  
  component aes220_PipeIn_ent
    Port (
      -- Connections to the FX2 interface
      IP_in  : in  unsigned(18 downto 0);
      PI_out : out unsigned(9 downto 0);
      -- User application connections
      P_ADDR_in : in unsigned(6 downto 0);  -- The pipe address
      VALID_out : out std_logic;     -- Data available flag
      READY_in  : in std_logic;
      DATA_out  : out unsigned(7 downto 0)  -- data to user app
      );
  end component;

  component aes220_PipeOut_ent
    port(
      -- Connections to the FX2 interface
      IP_in    : in  unsigned(18 downto 0);
      PI_out   : out unsigned(9 downto 0);
      -- User application connections
      P_ADDR_in   : in unsigned(6 downto 0);  -- The pipe address
      READY_out   : out std_logic;     -- Data available flag
      VALID_in    : in std_logic;
      DATA_in     : in  unsigned(7 downto 0)  -- data to user app
      );
  end component;

end aes220_Package_V1_3;


