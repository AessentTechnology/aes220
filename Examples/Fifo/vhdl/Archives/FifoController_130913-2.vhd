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
  signal wptr_s      : unsigned(WADDR_WIDTH_c-1 downto 0) := (others => '0');
  signal rptr_s      : unsigned(RADDR_WIDTH_c-1 downto 0) := (others => '0');
  signal valid_s     : std_logic := not VALID_c;
  signal incWAdd_s   : boolean := false;
  signal ready_s     : std_logic := not READY_c;
  signal fifoFull_s  : std_logic := not FIFO_FULL_c;
  signal fifoEmpty_s : std_logic := FIFO_EMPTY_c;
  
  
begin  

  read_prc : process (RCLK_in)
  begin
    if rising_edge(RCLK_in) then
      if rptr_s = wptr_s then
        fifoEmpty_s <= FIFO_EMPTY_c;
      elsif REQUEST_in = '1' then
        if fifoEmpty_s = not FIFO_EMPTY_c then
          if (rptr_s = wptr_s + 1) and (fifoFull_s = not FIFO_FULL_c) then
            valid_s <= not VALID_c;
            fifoEmpty_s <= FIFO_EMPTY_c;
          else
            rptr_s <= rptr_s + 1;
            valid_s <= VALID_c;
            fifoEmpty_s <= not FIFO_EMPTY_c;
          end if;            
        end if;
      else
        if (rptr_s /= wptr_s + 1) then
          fifoEmpty_s <= not FIFO_EMPTY_c;
        end if;
      end if;
    end if;
  end process read_prc;

  write_prc : process (WCLK_in)
  begin
    if rising_edge(WCLK_in) then
      if wptr_s = rptr_s -1 and fifoEmpty_s = not FIFO_EMPTY_c then
        -- Pointers are pointing to the same data and fifo is not empty so it must be full, hence
        -- nowhere to write
        ready_s <= not READY_c;
        fifoFull_s <= FIFO_FULL_c;
      else
        fifoFull_s <= not FIFO_FULL_c;
        if VALID_in = '1' then
          incWAdd_s <= true;
          if incWAdd_s = true then
            wptr_s <= wptr_s + 1;
          end if;
          ready_s <= READY_c;
        else
          incWAdd_s <= false;
        end if;
      end if;
    end if;
  end process write_prc;

  READY_out <= ready_s;
  VALID_out <= valid_s;

  WADDR_out <= wptr_s;
  RADDR_out <= rptr_s;
  --WADDR_out <= to_unsigned(wptr_s, WADDR_WIDTH_c);  
  --RADDR_out <= to_unsigned(rptr_s, RADDR_WIDTH_c);
                                 
end fifo_controller_arch;
