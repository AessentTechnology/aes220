----------------------------------------------------------------------------------------------------
-- File name: Fifo.vhd
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- FIFO made of a RAM buffer and a controller.
-- Select FIFO depth and buses width.
-- Default depth is 16384 bits (on BRAM in Spartan3AN)
-- Clocks for reading and writing to the FIFO can be different although no
-- clock domain control is implemented.
-- Read and write data bus widths need to be identical for now.
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V1.0.0: original version
--
----------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2013 Sebastien Saury, Aessent Technology Ltd
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

entity Fifo_ent is
  generic(
    MEM_SIZE_c    : integer := 16384; -- BRAM size in bits
    WDATA_WIDTH_c : integer := 8;
    RDATA_WIDTH_c : integer := 8;
    VALID_c       : std_logic := '1';
    READY_c       : std_logic := '1');
  Port(
    WCLK_in    : in  std_logic;
    RCLK_in    : in  std_logic;
    CLR_in     : in  std_logic; 
    VALID_in   : in  std_logic;
    READY_out  : out std_logic;
    REQUEST_in : in  std_logic;
    VALID_out  : out std_logic;
    DATA_in    : in  unsigned(WDATA_WIDTH_c - 1 downto 0); 
    DATA_out   : out unsigned(RDATA_WIDTH_c - 1 downto 0);
    DBG_out    : out unsigned(11 downto 0)
    );
end Fifo_ent;

architecture Fifo_arch of Fifo_ent is

  -- functions declarations
  -----------------------------------------------------------------------------------
  -- Xilinx log2 function so renamed after reading following discussion:
  -- http://www.edaboard.com/thread242745.html especially Kevin Jennings points
  -- roundup_log2(x) gives the minimum number of bits required to represent 'x'.
  -- roundup_log2(4) = 2, roundup_log2(5) = 3, etc.
  -----------------------------------------------------------------------------------
  function roundup_log2 (val: integer) return natural is
    variable res : natural;
  begin
    for i in 0 to 31 loop
      if (val <= (2**i)) then
        res := i;
        exit;
      end if;
    end loop;
    return res;
  end function roundup_log2;

  -- constants declarations
  constant WDATA_DEPTH_c : integer := MEM_SIZE_c / WDATA_WIDTH_c;  -- Fifo depth adjusted to
                                                                   -- bus width
  constant RDATA_DEPTH_c : integer := MEM_SIZE_c / RDATA_WIDTH_c;  -- Fifo depth adjusted to
                                                                   -- bus width
  constant WADDR_WIDTH_c : integer := roundup_log2(WDATA_DEPTH_c);  -- Address bus size
  constant RADDR_WIDTH_c : integer := roundup_log2(RDATA_DEPTH_c);  -- Address bus size
  
  -- signals declarations
  signal writeA_s      : std_logic;
  signal enableB_s     : std_logic;
  signal validOut_s    : std_logic;
  signal readyOut_s    : std_logic;
  signal dib_s         : unsigned(RDATA_WIDTH_c - 1 downto 0) := (others => '0');
  signal ramAddressA_s : unsigned(WADDR_WIDTH_c - 1 downto 0);
  signal ramAddressB_s : unsigned(RADDR_WIDTH_c - 1 downto 0);
  

begin

  -- Components instantiations: 

  FifoController : entity work.fifo_controller_ent
    generic map (
      VALID_c       => VALID_c,
      READY_c       => READY_c,
      WADDR_WIDTH_c => WADDR_WIDTH_c,
      RADDR_WIDTH_c => RADDR_WIDTH_c)
    port map (
      WCLK_in        => WCLK_in,
      RCLK_in        => RCLK_in,
      CLR_in         => CLR_in,
      REQUEST_in     => REQUEST_in,
      VALID_in       => VALID_in,
      READY_ouT      => readyOut_s,
      VALID_out      => validOut_s,
      WADDR_out      => ramAddressA_s,
      RADDR_out      => ramAddressB_s);

  RamBuffer : entity work.S8S8_dual_port_RAM_ent
    port map (
      CLKA_in   => WCLK_in,
      CLKB_in   => RCLK_in,
      ENA_in    => '1',
      ENB_in    => enableB_s,
      WEA_in    => writeA_s,
      WEB_in    => '0',
      ADDRA_in  => ramAddressA_s,
      ADDRB_in  => ramAddressB_s,
      DIA_in    => DATA_in,
      DIB_in    => dib_s,
      DOA_out   => open,
      DOB_out   => DATA_out);

  writeA_s <= VALID_in and readyOut_s;
  enableB_s <= REQUEST_in;
  READY_out <= readyOut_s;
  VALID_out <= validOut_s;

  DBG_out <=  ramAddressB_s(5 downto 0) & ramAddressA_s(5 downto 0);
  
end Fifo_arch;

