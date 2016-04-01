----------------------------------------------------------------------------------------------------
-- File name: aes220_Fifo_Example.vhd
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Write data to a FIFO using a pipe and read it back via another pipe.
-- Used both to test fifo.vhd and to create a loopback example.
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V1.0.0: original version
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

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.aes220_Package_V1_3.all;

entity aes220_Fifo_Example_ent is
  generic(
    RESET_ACTIVE_LEVEL_c : std_logic := '1'
    );
  Port(
    -- FX2 connections
    RST_in : in    std_logic;      -- Allows to place the different processes into reset
    FI_in  : in    unsigned(2 downto 0);
    IF_out : out   unsigned(7 downto 0);      
    FI_io  : inout unsigned(7 downto 0);  -- FX2 data bus
    ---- On board peripherals
    LED_out            : out unsigned(4 downto 1));
end aes220_Fifo_Example_ent;

architecture aes220_Fifo_Example_arch of
  aes220_Fifo_Example_ent is

  -- signals declarations
  -- FX2 interface
  signal ifClk_s     : std_logic;        -- User application clock
  -- pipe_1
  signal pi1_s       : unsigned(9 downto 0); 
  signal pipe1Vld_s  : std_logic;         -- Valid data present for the app
  signal pipe1Rdy_s  : std_logic;         -- App ready to read data
  signal pipe1Data_s : unsigned(7 downto 0);  -- Data to the app
  -- pipe_2
  signal pi2_s       : unsigned(9 downto 0);
  signal pipe2Rdy_s  : std_logic;        -- Data required from app
  signal pipe2Vld_s  : std_logic;         -- Valid data from app
  signal pipe2Data_s : unsigned(7 downto 0);  -- Data from the app

begin

  -- Components instantiations: 
  -- FX2 Interface
  fx2_Interface : aes220_FX2_Interface_ent
    port map (RST_in => RST_in, ifCLK_out => ifClk_s,  -- User app
              FI_in  => FI_in, IF_out => IF_out, FI_io  => FI_io, PI_in  => pi_s, IP_out => ip_s);
  
  -- pipe_1_Data is arbitrarily put on address 1
  pipe_1_Data : aes220_PipeIn_ent
    port map (IP_in => ip_s, PI_out => pi1_s, P_ADDR_in => "0000001",  
              VALID_out => pipe1Vld_s, READY_in => pipe1Rdy_s, DATA_out => pipe1Data_s); 

  -- pipe_2 is arbitrarily put on address 2
  pipe_2_Data : aes220_PipeOut_ent
    port map (IP_in => ip_s, PI_out => pi2_s, P_ADDR_in => "0000010",  
              READY_out => pipe2Rdy_s, VALID_in => pipe2Vld_s, DATA_in => pipe2Data_s); 

  -- Add (instantiate) more pipes here (remember to chose a unique address)
  -- Pipe_5 : aes220_PipeXxx_VX_X_X_ent
  -- ...

  -- Logical OR all the signals from the different pipes to the interface:
  pi_s <= (pi1_s or pi2_s);

  Fifo : entity work.fifo_ent
    generic map (
    MEM_SIZE_c    => 16384,             -- Memory size in bits
    WDATA_WIDTH_c => 8,
    RDATA_WIDTH_c => 8)
    port map (
      WCLK_in    => ifClk_s,
      RCLK_in    => ifClk_s,
      VALID_in   => pipe1Vld_s,
      READY_out  => pipe1Rdy_s,
      READY_in   => pipe2Rdy_s,
      VALID_out  => pipe2Vld_s,
      DATA_in    => pipe1Data_s,
      DATA_out   => pipe2Data_s);

  LED_out(4 downto 1) <= "0111"; -- D4 ON

end aes220_Fifo_Example_arch;

