-------------------------------------------------------------------------------
-- File name: aes220_MyFirstExample.vhd
-------------------------------------------------------------------------------
-- Author: Sebastien Saury, aessent Technology Ltd
-------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Simple Example using the switches and LED onboard the aes220 mini-module
--
-------------------------------------------------------------------------------
--CHANGES
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


entity aes220_MyFirstExample_ent is
  generic (
    ACTIVE_RESET_LEVEL_c : std_logic := '1');
  port(
    RST_in  : in    std_logic;
    CLK_in  : in    std_logic;
    LED_out : out   std_logic_vector(4 downto 1); -- Active-low LEDs
    SW_in   : in    std_logic_vector(2 downto 1)  -- rest at 0 switches
    );
end aes220_MyFirstExample_ent;


architecture RTL_arch of aes220_MyFirstExample_ent is

  --signals declaration
  signal LED_s : std_logic_vector(4 downto 1);

begin

  LED_and_switches: process(RST_in, CLK_in)
    variable count_v : integer := 0;
    variable direction_flag_v : std_logic := '0';
  begin
    if RST_in = ACTIVE_RESET_LEVEL_c then
      LED_s <= "1110";     -- set LED 1 ON by default
      direction_flag_v := '0';
    else
      if rising_edge(CLK_in) then
        count_v := count_v + 1;
        if count_v = 2 then             -- use this value for simulation
        --if count_v = 16777215 then      -- use this value for implementation
          if direction_flag_v = '0' then
            -- counter clock wise LED pattern
            LED_s(1) <= LED_s(3);
            LED_s(2) <= LED_s(1);
            LED_s(4) <= LED_s(2);
            LED_s(3) <= LED_s(4);
            count_v := 0;
          else
            -- clock wise LED pattern
            LED_s(1) <= LED_s(2);
            LED_s(2) <= LED_s(4);
            LED_s(4) <= LED_s(3);
            LED_s(3) <= LED_s(1);
            count_v := 0;            
          end if;
        end if;
        if SW_in(1) = '0' then
          if SW_in(2) = '1' then
            direction_flag_v := '0';
          end if;
        else
          direction_flag_v := '1';
        end if;
      end if;
    end if;
  end process LED_and_switches;

  -- link signals to ports
  LED_out <= LED_s;
  
end RTL_arch;
