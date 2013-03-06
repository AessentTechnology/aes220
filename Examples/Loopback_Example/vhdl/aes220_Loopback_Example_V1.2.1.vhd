----------------------------------------------------------------------------------------------------
-- File name: aes220_Loopback_Example_V1.2.1.vhd
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Write data to a BRAM using a pipe and read back via another pipe. Uses a
-- further two pipes to set a counter for cycling through the BRAM addresses.
-- Used to demonstrate the use of pipes.
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V1.0.0: original version
-- V1.2.0: updated to reflect new pipe interface (with pause signal)
-- V1.2.1: now using renamed package aes220_Package_V1_2 rather than aes220_Package_V1_2_1
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
use ieee.std_logic_unsigned.all;
use work.aes220_Package_V1_2.all;

entity aes220_Loopback_Example_V1_2_1_ent is
  generic(
    RESET_ACTIVE_LEVEL_c : std_logic := '1'
    );
  Port(
    -- FX2 connections
    RST_in : in    std_logic;      -- Allows to place the different processes into reset
    FI_in  : in    std_logic_vector(2 downto 0);
    IF_out : out   std_logic_vector(7 downto 0);      
    FI_io  : inout std_logic_vector(7 downto 0);  -- FX2 data bus
    ---- On board peripherals
    LED_out            : out std_logic_vector(4 downto 1)
    );
end aes220_Loopback_Example_V1_2_1_ent;

architecture aes220_Loopback_Example_V1_2_1_arch of
  aes220_Loopback_Example_V1_2_1_ent is

  -- signals declarations
  -- FX2 interface
  signal ifClk_s     : std_logic;        -- user application clock
  -- Pipe_1
  signal pi1_s      : std_logic_vector(9 downto 0);  
  signal rstCounter_s : std_logic;
  signal counterLSB_s : std_logic_vector(7 downto 0);
  -- Pipe_2
  signal pi2_s       : std_logic_vector(9 downto 0);
  signal ldCounter_s : std_logic;
  signal counterMSB_s  : std_logic_vector(7 downto 0);
  -- Pipe_3
  signal pi3_s    : std_logic_vector(9 downto 0); 
  signal pipe3Rd_s  : std_logic;
  signal pipe3Data_s  : std_logic_vector(7 downto 0);
  -- Pipe_4
  signal pi4_s    : std_logic_vector(9 downto 0);
  signal pipe4Wr_s  : std_logic;         -- signals the app to write data
  signal pipe4Data_s  : std_logic_vector(7 downto 0);  -- data from the app

  signal counterEn_s  : std_logic;
  signal ldValue_s    : std_logic_vector(15 downto 0);
  signal ramAddress_s : std_logic_vector(15 downto 0);
  

  -- components declaration
  component sync_ram
    port (
      clock     : in std_logic;
      we        : in std_logic;
      address   : in std_logic_vector;
      datain    : in std_logic_vector;
      dataout   : out std_logic_vector);
  end component;

  component UpLoadCounter_ent
    port(
      --
      CLK_in        : in  std_logic;
      CLR_in        : in  std_logic;
      EN_in         : in  std_logic;
      LOAD_in       : in  std_logic;
      LOAD_VALUE_in : in  std_logic_vector(15 downto 0);
      Q_out         : out std_logic_vector(15 downto 0)
      );
  end component;
  
  
begin

  -- Components instantiations: 
  -- FX2 Interface
  fx2_Interface : aes220_FX2_Interface_ent
    port map (RST_in => RST_in, ifCLK_out => ifClk_s,  -- User app
              FI_in  => FI_in, IF_out => IF_out, FI_io  => FI_io, PI_in  => pi_s, IP_out => ip_s);   
  
  -- Pipe_1_LSB is arbitrarily put on address 1
  Pipe_1_LSB : aes220_PipeIn_ent
    port map (
      -- Connections to the FX2 Interface
      IP_in       => ip_s,
      PI_out      => pi1_s,
      -- Chosen address for the pipe
      P_ADDR_in   => "0000001",
      -- User application connections
      PAUSE_in    => '0',
      READ_RQ_out => rstCounter_s,
      DATA_out    => counterLSB_s); 

  -- Pipe_2_MSB is arbitrarily put on address 2 (shorter way of writing the instantiation)
  Pipe_2_MSB : aes220_PipeIn_ent
    port map (IP_in => ip_s, PI_out => pi2_s, P_ADDR_in => "0000010",  
              PAUSE_in => '0', READ_RQ_out => ldCounter_s, DATA_out => counterMSB_s); 

  -- Pipe_3_Data is arbitrarily put on address 3
  Pipe_3_Data : aes220_PipeIn_ent
    port map (IP_in => ip_s, PI_out => pi3_s, P_ADDR_in => "0000011",  
              PAUSE_in => '0', READ_RQ_out => pipe3Rd_s, DATA_out => pipe3Data_s); 

  -- Pipe_4 is arbitrarily put on address 4
  Pipe_4_Data : aes220_PipeOut_ent
    port map (IP_in => ip_s, PI_out => pi4_s, P_ADDR_in => "0000100",  
              PAUSE_in => '0', WRITE_RQ_out => pipe4Wr_s, DATA_in => pipe4Data_s); 

  -- Add (instantiate) more pipes here (remember to chose a unique address)
  -- Pipe_5 : aes220_PipeXxx_VX_X_X_ent
  -- ...

  -- Logical OR all the signals from the different pipes to the interface:
  pi_s <= (pi1_s or pi2_s or pi3_s or pi4_s);

  addressCounter : UpLoadCounter_ent
    port map (
      --
      CLK_in        => ifClk_s,
      CLR_in        => rstCounter_s,
      EN_in         => counterEn_s,
      LOAD_in       => ldCounter_s,
      LOAD_VALUE_in => ldValue_s,
      Q_out         => ramAddress_s);

  ramBuffer : sync_ram
    port map (
      clock     => ifClk_s,
      we        => pipe3Rd_s,
      address   => ramAddress_s(12 downto 0),
      datain    => pipe3Data_s,
      dataout   => pipe4Data_s);

  counterEn_s <= (pipe3Rd_s or pipe4Wr_s);
  ldValue_s <= counterMSB_s & counterLSB_s;
  LED_out(4 downto 1) <= "0111"; -- D4 ON

end aes220_Loopback_Example_V1_2_1_arch;
