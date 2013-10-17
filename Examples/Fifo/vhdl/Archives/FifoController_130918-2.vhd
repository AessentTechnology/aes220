-------------------------------------------------------------------------------
-- File name: FifoController.vhd
-------------------------------------------------------------------------------
-- Author: Sebastien Saury, aessent Technology Ltd
-------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Controller to implement a FIFO when paired with a RAM buffer (see Fifo.vhd)
-- Supports different clocks for reading or writing
-- Not yet implemented but aim is to support data bus widths of different length
-- for the read and write sides.
--
-------------------------------------------------------------------------------
--CHANGES
--
--
-------------------------------------------------------------------------------
-- PINOUT
--
--
--
-------------------------------------------------------------------------------
--
-- Copyright (C) 2013 Sebastien Saury, Aessent Technology Ltd

--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 2.1 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library; if not, write to the Free Software
--Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
--
--
-------------------------------------------------------------------------------
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fifo_controller_ent is
  generic (
    VALID_c       : std_logic := '1';
    READY_c       : std_logic := '1';
    WADDR_WIDTH_c : integer := 11;
    RADDR_WIDTH_c : integer := 11);
  port(
    WCLK_in        : in  std_logic;
    RCLK_in        : in  std_logic;
    CLR_in         : in  std_logic; 
    REQUEST_in     : in  std_logic;
    VALID_in       : in  std_logic;
    READY_out      : out std_logic;
    VALID_out      : out std_logic;
    WADDR_out      : out unsigned(WADDR_WIDTH_c-1 downto 0);
    RADDR_out      : out unsigned(RADDR_WIDTH_c-1 downto 0));
end fifo_controller_ent;


architecture fifo_controller_arch of fifo_controller_ent is

  constant FIFO_EMPTY_c : std_logic := '1';
  constant FIFO_FULL_c  : std_logic := '1';

  --signals declaration
  --signal wptr_s      : integer range 0 to 2**(WADDR_WIDTH_c)-1 := 0;
  --signal rptr_s      : integer range 0 to 2**(RADDR_WIDTH_c)-1 := 0;
  signal wptr_s       : unsigned(WADDR_WIDTH_c-1 downto 0) := (others => '0');
  signal rptr_s       : unsigned(RADDR_WIDTH_c-1 downto 0) := (others => '0');
  signal valid_s      : std_logic := not VALID_c;
  signal fifoFull_s   : std_logic := not FIFO_FULL_c;
  signal fifoEmpty_s  : std_logic := FIFO_EMPTY_c;
  signal fifoEmptyMinus1_s : std_logic := not FIFO_EMPTY_c;
  
  
begin  

  read_prc : process (RCLK_in)
  begin
    if rising_edge(RCLK_in) then
      if (REQUEST_in = '1') and (fifoEmpty_s = not FIFO_EMPTY_c) then
        if (fifoEmptyMinus1_s = FIFO_EMPTY_c) then
          -- Last byte has been read
          fifoEmptyMinus1_s <= not FIFO_EMPTY_c;
          fifoEmpty_s <= FIFO_EMPTY_c;
          valid_s <= not VALID_c;
        else
          -- Increment memory address and validate the data
          rptr_s <= rptr_s + 1;
          valid_s <= VALID_c;
          if rptr_s = wptr_s - 1 then
            -- Read pointer is just below write pointer, only one more memory
            -- location to read
            fifoEmptyMinus1_s <= FIFO_EMPTY_c;
          else
            fifoEmptyMinus1_s <= not FIFO_EMPTY_c;
          end if;
        end if;
      elsif (rptr_s = wptr_s) and (fifoEmpty_s = FIFO_EMPTY_c) then
        -- It is necessary to check that the fifo is empty when both pointers
        -- are equal as the same condition happens when the fifo is full
        fifoEmpty_s <= FIFO_EMPTY_c;
        valid_s <= not VALID_c;
      else
        -- Pointers don't match the fifo is not emtpy
        fifoEmpty_s <= not FIFO_EMPTY_c;
      end if;
    end if;
  end process read_prc;

  write_prc : process (WCLK_in)
  begin
    if rising_edge(WCLK_in) then
      fifoFull_s <= not FIFO_FULL_c;
      if (wptr_s = rptr_s) and (fifoFull_s = FIFO_FULL_c) then
        -- Write and read pointers match and write not ready so FIFO is full
        fifoFull_s <= FIFO_FULL_c;
      elsif (VALID_in = '1') and (fifoFull_s = not FIFO_FULL_c) then
        wptr_s <= wptr_s + 1;
        if wptr_s = rptr_s - 1 then
          -- Write pointer just below read pointer nowhere to write
          -- FIFO is full
          fifoFull_s <= FIFO_FULL_c;
        end if;
      end if;
    end if;
  end process write_prc;

  READY_out <= not fifoFull_s;
  VALID_out <= valid_s;

  WADDR_out <= wptr_s;
  RADDR_out <= rptr_s;
  --WADDR_out <= to_unsigned(wptr_s, WADDR_WIDTH_c);  
  --RADDR_out <= to_unsigned(rptr_s, RADDR_WIDTH_c);
                                 
end fifo_controller_arch;
