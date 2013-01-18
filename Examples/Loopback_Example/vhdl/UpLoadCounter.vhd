-------------------------------------------------------------------------------
-- File name: UpLoadCounter.vhd
-------------------------------------------------------------------------------
-- Author: Sebastien Saury, aessent Technology Ltd
-------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Count up to a pre loaded value
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
use IEEE.std_logic_unsigned.all;


entity UpLoadCounter_ent is
  port(
    --
    CLK_in        : in  std_logic;
    CLR_in        : in  std_logic;
    EN_in         : in  std_logic;
    LOAD_in       : in  std_logic;
    LOAD_VALUE_in : in  std_logic_vector(15 downto 0);
    Q_out         : out std_logic_vector(15 downto 0)
    );
end UpLoadCounter_ent;


architecture UpLoadCounter_arch of UpLoadCounter_ent is

  --signals declaration
  signal cnt_s: std_logic_vector(15 downto 0);
  signal max_value_s: std_logic_vector(15 downto 0);
  
begin  

  counter : process (CLK_in, CLR_in, EN_in, LOAD_in)
  begin
    if CLR_in = '1' then
      cnt_s <= (others => '0');
    elsif rising_edge(CLK_in) then
      if LOAD_in = '1' then
        max_value_s <= LOAD_VALUE_in;
      elsif EN_in = '1' then
        if cnt_s = max_value_s then
          cnt_s <= (others => '0');
        else
          cnt_s <= cnt_s + 1;
        end if;
      end if;
    end if;
  end process;

  Q_out <= cnt_s;

end UpLoadCounter_arch;
