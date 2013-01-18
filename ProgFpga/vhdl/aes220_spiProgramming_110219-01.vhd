---------------------------------------------------------------------------------
-- File name: aes220_piProgramming_110219-01.vhd
---------------------------------------------------------------------------------
-- Author: Sebastien Saury, aessent Technology Ltd
---------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Downloads a bitstream into the flash spi memory of the fpga.
--
---------------------------------------------------------------------------------
--CHANGES
--
-- 101027-01: Renamed file to aes220_SpiProgramming
--            Redefined architecture with clock stopped once byte transmitted
--            and CS_B of flash controlled directly by uC
-- 101028-01: Changing monostable process architecture as 'event must be in top
--            most IF statement and cannot be embedded. See AR #14047 from
--            Xilinx
-- 101028-02: Introducing reading feature
-- 101029-01: Separating data bus between port B and D
-- 101101-01: Adding buffers elements to delay clock signal to shiftIn register
-- 110219-01: Adapting program to Rev P2
--
---------------------------------------------------------------------------------
--
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
--
---------------------------------------------------------------------------------
-- PINOUT
--  ____________________________________________________________________________
-- |                                                                            |
-- |                              ________________________                      |
-- |                             |                       |                      |
-- |                     IOA0  > | PA0               PB0 | >  IOB0 LED6         |
-- |                     IOA1  > | PA1               PB1 | >  IOB1              |
-- |                     IOA2  > | PA2               PB2 | >  IOB2              |
-- |                     IOA3  > | PA3               PB3 | >  IOB3              |
-- |                     IOA4  > | PA4               PB4 | >  IOB4              |
-- |                     IOA5  > | PA5               PB5 | >  IOB5              |
-- |                     IOA6  > | PA6               PB6 | >  IOB6              |
-- |                     IOA7  > | PA7               PB7 | >  IOB7              |
-- |                             |                       |                      |
-- |                     IOD0 <  | PD0                   |                      |
-- |                     IOD1  > | PD1            CLKOUT |  > CLKOUT            |
-- |                     IOD2 <  | PD2                   |                      |
-- |                     IOD3 <  | PD3                   |                      |
-- |                     IOD4 <> | PD4                   |                      |
-- |                     IOD5 <> | PD5                   |                      |
-- |                     IOD6 <> | PD6                   |                      |
-- |                     IOD7 <  | PD7            FX2    |                      |
-- |                             |_______________________|                      |
-- |                                                                            |
-- |  ___ 3v3                 _________________________________                 |
-- |   |   __       __       |                                 |                |
-- |   |--|__|LED2 |__|LED1  |                                 |                |
-- |   |    |        |_______| P13                          T9 | < CLKOUT       |
-- |   |    |________________| N11                             |                |
-- |   |   __       __       |                                 |                |
-- |   |--|__|LED4 |__|LED3  |                          PROG_B | < IOD0         |
-- |   |    |        |_______| N12                        DONE | > IOD1 LED5    |
-- |   |    |________________| P11                   CSI_B P10 | < IOD2 LOAD_B  |
-- |   |                     |                        DOUT R11 | < IOD3 CS_B    |
-- |   |     _               |                       AWAKE T11 | <>IOD4         |
-- |   |   __|__SW1          |                      INIT_B T12 | <>IOD5         |
-- |   |__|     |____________| D6                     CCLK R14 | <>IOD6         |
-- |   |     _               |                         SUSPEND | < IOD7         |
-- |   |   __|__SW2          |                                 |                |
-- |   |__|     |____________| E6                              |                |
-- |                         |                                 |                |
-- |          PORT_IN IOB0 > | T2 CSO_B                 D7  T5 | > IOA0 PORT_OUT|
-- |                  IOB1 > | R2 M2                    D6  T6 | > IOA1         |
-- |                  IOB2 > | T3 VS2                   D5  P7 | > IOA2         |
-- |                  IOB3 > | P4 M0                    D4  N8 | > IOA3         |
-- |                  IOB4 > | R3 RDWR_B                D3 P12 | > IOA4         |
-- |                  IOB5 > | N4 M1                    D2 T13 | > IOA5         |
-- |                  IOB6 > | P5 VS0                   D1 R13 | > IOA6         |
-- |                  IOB7 > | N6 VS1                   D0 T14 | > IOA7         |
-- |                         |                   XC3S200AN     |                |
-- |                         |_________________________________|                |
-- |                                                                            |
-- |                                                                aes220      |
-- |____________________________________________________________________________|
--
--
---------------------------------------------------------------------------------
--
--Sending two bytes and reading one
--(first byte is 0xD7, snd byte is dummy, read byte is status byte)
--              __                                                   ____________
--CS_B   PD3:     \_________________________________________________/
--              ____           __________       _________________________________
--LOAD_B PD2:       \_________/          \_____/
--                        ______             ____
--PORT_IN PBX:  ---------<______>-----------<____>-------------------------------
--                                                   ___
--PORT_OUT PAX: ------------------------------------<___>------------------------
--              ______________   _   _   ______   _   _   _______________________
--CLKOUT PD0                  \_/ \_/ \_/      \_/ \_/ \_/

--1               ^ pull CS_B low to reset the fpga (M[2:0] sampled at this point)
-- 2  5             ^ pull LOAD_B low     ^ pull LOAD_B low
--  3  6                 ^ provide data     ^ provide data
--   4  7                     ^ pull LOAD_B high^ pull LOAD_B high
--       8                                           ^ read data
--
---------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- defines std_logic types
use IEEE.NUMERIC_STD.all;

library UNISIM;
use UNISIM.VComponents.all;
--library NUMERIC_STD;

entity aes220_prog_ent is

  port (
    FX2_CLKOUT : in    std_logic;           -- Oscillator
    SHFTOUT    : out   std_logic;           -- Shift register test output
    SHFTIN     : out   std_logic;           -- Shift register test output
    SHFTON     : out   std_logic;           -- Shift register test output
    CLKTST     : out   std_logic;           -- Shift register test output
    FX2_IOA    : inout std_logic_vector(7 downto 0); -- FX2 port A
    FX2_IOB    : inout std_logic_vector(7 downto 0); -- FX2 port B
    FX2_IOD    : in    std_logic_vector(3 downto 2); -- FX2 port D
    LED        : out   std_logic_vector(4 downto 1)  -- Active low LEDs
    );
end aes220_prog_ent;

architecture spiProgramming_arch of aes220_prog_ent is



  -- signals declaration
  signal outReg       : std_logic_vector(7 downto 0) := "00000000";  -- shift register
  signal inReg        : std_logic_vector(7 downto 0) := "00000000";  -- shift register
  signal shiftOut_s   : std_logic := 'Z';
  signal shiftIn_s    : std_logic := 'Z';
  signal clk_s        : std_logic := '1';
  signal shiftInClk_s : std_logic := '1';
  signal interClk1_s  : std_logic := '1';
  signal interClk2_s  : std_logic := '1';
  signal interClk3_s  : std_logic := '1';
  signal shiftOn_s    : std_logic := '0';
  signal port_in_s    : std_logic_vector(7 downto 0) := "ZZZZZZZZ";  -- Port B signals
  signal port_out_s   : std_logic_vector(7 downto 0) := "ZZZZZZZZ";  -- Port D signals
  signal LED_s        : std_logic_vector(4 downto 1) := "1111"; -- LED signal (off)

  -- declare an alias for some ports for clarity
  alias LOAD_B : std_logic is FX2_IOD(2);
  alias CS_B   : std_logic is FX2_IOD(3);
  alias PORT_IN  : std_logic_vector(7 downto 0) is FX2_IOB(7 downto 0);
  alias PORT_OUT : std_logic_vector(7 downto 0) is FX2_IOA(7 downto 0);

  component BUFGCE_1
    port (
      CE : in std_logic;
      I  : in std_logic;
      O  : out std_logic
      );
  end component;

begin  -- spiProgramming


  --clock input to flash and shift register (clk_s)
  bufgce : BUFGCE_1 port map (CE => shiftOn_s, I => FX2_CLKOUT, O => Clk_s);
  bufgceDelay1 : BUFGCE_1 port map (CE => '1', I => clk_s, O => interClk1_s);
  bufgceDelay2 : BUFGCE_1 port map (CE => '1', I => interClk1_s, O => interClk2_s);
  bufgceDelay3 : BUFGCE_1 port map (CE => '1', I => interClk2_s, O => interClk3_s);
  bufgceDelay4 : BUFGCE_1 port map (CE => '1', I => interClk3_s, O => shiftInClk_s);

  -- SPI flash memory access instantiation
  SPI_ACCESS_inst: SPI_ACCESS
    generic map (
      SIM_DEVICE => "3S200AN"
      )
    port map (
      MISO => shiftIn_s,   -- 1-bit SPI output data
      MOSI => shiftOut_s,  -- 1-bit SPI input data
      CSB  => CS_B,        -- 1-bit SPI chip enable
      CLK  => clk_s        -- 1-bit SPI clock input
      );

-- purpose: Shift out serially each byte given on parallel port
-- type   : sequential
-- inputs : clk_s, LOAD_B, SHFT, PORT_IN
-- outputs: shiftOut_s
  outShiftRegister: process (clk_s, LOAD_B, PORT_IN)
    variable prevLoad_var : std_logic := '1';
  begin  -- process outShiftRegister
    if LOAD_B = '0' then
      outReg <= PORT_IN;
      LED_s <= "1100";                -- LEDs 3 and 4 On
    elsif falling_edge(clk_s) then
      shiftOut_s <= outReg(7);
      outReg(7 downto 1) <= outReg(6 downto 0);
      outReg(0) <= '1';
      LED_s(4) <= '1';                  -- LED 4 Off
    end if;
  end process outShiftRegister;

-- purpose: Shift in serially each bit coming on shiftIn signal
-- type   : sequential
-- inputs : clk_s, shiftIn_s
-- outputs: none
  inShiftRegister: process (shiftInClk_s, shiftIn_s)
    variable prevLoad_var : std_logic := '1';
  begin  -- process inShiftRegister
    if rising_edge(shiftInClk_s) then
      inReg(7 downto 1) <= inReg(6 downto 0);
      inReg(0) <= shiftIn_s;
    end if;
  end process inShiftRegister;

-- purpose: validate an output signal for 8 clock count
-- type   : sequential
-- inputs : FX2_CLKOUT, LOAD_B
-- outputs: shiftOn_s
  monostable: process (CS_B, FX2_CLKOUT, LOAD_B)
    variable cnt_var       : integer range 0 to ((2**4)-1);
    variable countOn_var   : std_logic := '0';
    variable prevLoadB_var : std_logic := '1';
  begin  -- process monostable
    if CS_B = '1' then
      shiftOut_s <= 'Z';
      shiftOn_s  <= '0';
      port_in_s    <= (others => 'Z');
      port_out_s    <= (others => 'Z');
    elsif rising_edge(FX2_CLKOUT) then
      if LOAD_B = '0' then
        prevLoadB_var := '0';
        shiftOn_s <= '0';
      elsif prevLoadB_var = '0' then  -- LOAD_B has changed from 0 to 1
        cnt_var := 0;
        prevLoadB_var := '1';
        countOn_var := '1';
        shiftOn_s <= '1';
      elsif countOn_var = '1' then      -- LOAD_B = 1 and we are counting
        cnt_var := cnt_var + 1;
        if cnt_var = 7 then
          countOn_var := '0';
        end if;
      else                              -- LOAD_B = 1 but count is over
        shiftOn_s <= '0';
      end if;
    end if;
  end process monostable;


SHFTOUT <= shiftOut_s;
SHFTIN  <= shiftIn_s;
SHFTON  <= shiftOn_s;
CLKTST  <= shiftInClk_s;
PORT_IN   <= port_in_s;
PORT_OUT   <= inReg;
LED     <= LED_s;

end spiProgramming_arch;


