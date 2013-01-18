-------------------------------------------------------------------------------
-- File name: aes220_MyFirstExampleTestBench-1.vhd
-------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
-------------------------------------------------------------------------------
-- DESCRIPTION
--
-- VHDL test bench for aes220_MyFirstExample.vhd 
--
---------------------------------------------------------------------------------
--CHANGES
--
--           
--
---------------------------------------------------------------------------------
--
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

library  IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;
use IEEE.numeric_std.all;

entity testbench is
  
  generic (
    vector_size_c : integer := 8);  -- sets the size of the test vector

end testbench;

architecture testbench_arch of testbench is
  -- component declaration 
  component aes220_MyFirstExample_ent
    port (
      RST_in  : in    std_logic;
      CLK_in  : in    std_logic;
      SW_in   : in    std_logic_vector(2 downto 1); -- rest at 0 switches
      LED_out : out   std_logic_vector(4 downto 1)  -- Active-low LEDs
      );
  end component;

  -- declare one large signal (easier to loop through further down)
  signal ports : std_logic_vector((vector_size_c -1)  downto 0) := (others => 'Z');

  -- declare an alias for each port for clarity
  alias RST_in  : std_logic is ports(7);
  alias CLK_in  : std_logic is ports(6);
  alias SW_in   : std_logic_vector(2 downto 1) is ports(5 downto 4);
  alias LED_out : std_logic_vector(4 downto 1) is ports(3 downto 0);

  for uut : aes220_MyFirstExample_ent
    use entity work.aes220_MyFirstExample_ent(RTL_arch);

begin
  -- instantiate the component
  uut : aes220_MyFirstExample_ent
    port map (
      RST_in  => RST_in,
      CLK_in  => CLK_in,
      SW_in   => SW_in,
      LED_out => LED_out);

-- purpose: testbench using vector file as input, this part should not have to
--          be modidied, save for the file containing the test vectors just below.
-- type   : combinational
test_proc: process

   -- file containing the test vectors
  file vector_file_f : text is in
    "../../../Sources/vhdl/MyFirstExample/test_vector.tv";                  

  variable ln_v           : line;         -- used to read one vector at a time
  variable vector_time_v  : time;         -- stores time reading
  variable time_as_real_v : real;         -- stores time as real number
  variable good_number_v  : boolean := false; -- flags value read as a number
  variable vector_index_v : integer;      -- index looping through ports vector

begin  -- process test_proc
  while not endfile(vector_file_f) loop
    readline (vector_file_f,ln_v);
    -- read time from beginning of line and check it is a number
    read (ln_v, time_as_real_v, good => good_number_v);
    if good_number_v then
      vector_time_v := time_as_real_v * 1ns;  -- convert real number to time
      if now < vector_time_v then
        wait for vector_time_v - now;
      end if;
      vector_index_v := vector_size_c - 1;
      for i_v in ln_v'range loop
        case ln_v(i_v) is
          when '0' => ports(vector_index_v) <= '0';
          when '1' => ports(vector_index_v) <= '1';
          when 'z'|'Z' => ports(vector_index_v) <= 'Z';
          when 'l'|'L' => assert ports(vector_index_v) = '0'
                          report "Expected 0" severity error;
          when 'h'|'H' => assert ports(vector_index_v) = '1'
                          report "Expected 1" severity error;
          when 'x'|'X' => null;
          when ' '|ht => next;
          when others => assert false
                           report " illegal character in vector file " & ln_v(i_v)
                           severity error;
                         exit;
        end case;
        vector_index_v := vector_index_v - 1;
      end loop;  -- i_v
    end if;
  end loop;
  assert false report "Test complete." severity note;
  wait;
end process test_proc;

end testbench_arch;

CONFIGURATION Switch_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END Switch_cfg;
