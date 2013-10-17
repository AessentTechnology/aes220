----------------------------------------------------------------------------------------------------
-- File name: Clock_Multiplier_V1.0.2.vhd
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Generates the on board reference clock (when no external reference clock is
-- available). Set at 100kHz for now.
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V1.0.0: original version
-- V1.0.1: removed the SEL_in entry, removed aes220_ from file and arch/entity name
-- V1.0.2: added buffers to loopback and output signal.
-- 
----------------------------------------------------------------------------------------------------
--NOTES
--
-- Template for DCM_SP comes from Xilinx own documentation
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
library UNISIM;
use UNISIM.VComponents.all;


entity Clock_Multiplier_ent is
  generic (
    CLKFX_MULTIPLY_c : integer := 4;
    CLKFX_DIVIDE_c   : integer := 1;
    CLKIN_PERIOD_c   : real    := 20.8);  -- Input clock period in ns
  Port(
    RST_in  : in    std_logic;
    CLK_in  : in    std_logic;    
    CLK_out : out   std_logic);
end Clock_Multiplier_ent;

architecture Clock_Multiplier_arch of
  Clock_Multiplier_ent is

  -- Signals declaration
  signal clk0_s  : std_logic := '0';
  signal clkFb_s : std_logic := '0';
  signal clkFx_s : std_logic := '0';
  
begin

  -- components instantiations

  dcm0 : DCM_SP
    generic map (
      CLKDV_DIVIDE => 2.0, -- Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
      -- 7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      CLKFX_DIVIDE => CLKFX_DIVIDE_c,     -- Can be any interger from 1 to 32
      CLKFX_MULTIPLY => CLKFX_MULTIPLY_c, -- Can be any integer from 2 to 32
      CLKIN_DIVIDE_BY_2 => FALSE,   -- TRUE/FALSE to enable CLKIN divide by two feature
      CLKIN_PERIOD => CLKIN_PERIOD_c, -- Specify period of input clock in ns
      CLKOUT_PHASE_SHIFT => "NONE", -- Specify phase shift of "NONE", "FIXED" or "VARIABLE"
      CLK_FEEDBACK => "1X",         -- Specify clock feedback of "NONE", "1X" or "2X"
      DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", -- "SOURCE_SYNCHRONOUS", "SYSTEM_SYNCHRONOUS" or
                                             -- an integer from 0 to 15
      DLL_FREQUENCY_MODE => "LOW",   -- "HIGH" or "LOW" frequency mode for DLL
      DUTY_CYCLE_CORRECTION => TRUE, -- Duty cycle correction, TRUE or FALSE
      PHASE_SHIFT => 0,              -- Amount of fixed phase shift from -255 to 255
      STARTUP_WAIT => FALSE) -- Delay configuration DONE until DCM_SP LOCK, TRUE/FALSE
    port map (RST => RST_in,
              CLKIN => CLK_in, CLKFB => clkFb_s,
              PSEN => '0', PSCLK => '0', PSINCDEC => '0',  -- Dynamic phase adjust
              CLK0 => clk0_s, CLK90 => open, CLK180 => open, CLK270 => open,
              CLK2X => open, CLK2X180 => open,
              CLKDV => open,
              CLKFX => clkFx_s, CLKFX180 => open,
              LOCKED => open, PSDONE => open, STATUS => open);

  -- Buffer for the clock loopback signal
  bufg0 : BUFG
    port map (
      O => clkFb_s,
      I => clk0_s);

  -- Buffer for the output clock signal
  bufg1 : BUFG
    port map (
      O => CLK_out,
      I => clkFx_s);

end Clock_Multiplier_arch;
