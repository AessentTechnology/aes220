----------------------------------------------------------------------------------------------------
-- File name: AsymmetricS1S8DualPortRAM_V1.0.0.vhd
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Instantiates a BRAM with a 1 bit port on one side and 8 bit port on the other
-- No parity signal used. 
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V1.0.0: original version
-- 
----------------------------------------------------------------------------------------------------
--NOTES
--
-- Template for RAMB16_S1_S9 comes from Xilinx own documentation
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
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;             -- Required for BRAM instantiation

entity asymmetric_S1S8_dual_port_RAM_ent is

  port (
    CLKS1_in   : in  std_logic;
    CLKS8_in   : in  std_logic;
    ENS1_in    : in  std_logic;
    ENS8_in    : in  std_logic;
    WES1_in    : in  std_logic;
    WES8_in    : in  std_logic;
    ADDRS1_in  : in  unsigned(13 downto 0);
    ADDRS8_in  : in  unsigned(10 downto 0);
    DIS1_in    : in  unsigned(0 downto 0);
    DIS8_in    : in  unsigned(7 downto 0);
    DOS1_out   : out unsigned(0 downto 0);
    DOS8_out   : out unsigned(7 downto 0));

end asymmetric_S1S8_dual_port_RAM_ent;

architecture instantiation_arch of asymmetric_S1S8_dual_port_RAM_ent is

  signal doS1_s : std_logic_vector(0 downto 0);
  signal doS8_s : std_logic_vector(7 downto 0);

begin

   -- RAMB16_S1_S9: 16k/2k x 1/8 + 0/1 Parity bit Dual-Port RAM
   --               Spartan-3A
   -- Xilinx HDL Language Template, version 14.2

   RAMB16_S1_S9_inst : RAMB16_S1_S9
   generic map (
      INIT_A => "0", --  Value of output RAM registers on Port A at startup
      INIT_B => X"000", --  Value of output RAM registers on Port B at startup
      SRVAL_A => "0", --  Port A output value upon SSR assertion
      SRVAL_B => X"000", --  Port B output value upon SSR assertion
      WRITE_MODE_A => "READ_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      WRITE_MODE_B => "READ_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "ALL", -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL"
      -- The following INIT_xx declarations specify the initial contents of the RAM
      -- Port A Address 0 to 4095, Port B Address 0 to 511
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Port A Address 4096 to 8191, Port B Address 512 to 1023
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Port A Address 8192 to 12287, Port B Address 1024 to 1535
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Port A Address 12288 to 16383, Port B Address 1535 to 2047
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      CLKA => CLKS1_in,    -- Port A Clock
      CLKB => CLKS8_in,    -- Port B Clock
      ENA => ENS1_in,      -- Port A RAM Enable Input
      ENB => ENS8_in,      -- PortB RAM Enable Input
      SSRA => '0',        -- Port A Synchronous Set/Reset Input
      SSRB => '0',        -- Port B Synchronous Set/Reset Input
      WEA => WES1_in,      -- Port A Write Enable Input
      WEB => WES8_in,       -- Port B Write Enable Input
      ADDRA => std_logic_vector(ADDRS1_in),  -- Port A 14-bit Address Input
      ADDRB => std_logic_vector(ADDRS8_in),  -- Port B 11-bit Address Input
      DIA => std_logic_vector(DIS1_in),      -- Port A 1-bit Data Input
      DIB => std_logic_vector(DIS8_in),      -- Port B 8-bit Data Input
      DIPB => "0",        -- Port B 1-bit parity
      DOA => dos1_s,     -- Port A 1-bit Data Output
      DOB => dos8_s);    -- Port B 8-bit Data Output

   DOS1_out <= unsigned(dos1_s);
   DOS8_out <= unsigned(dos8_s);
  
end instantiation_arch;
