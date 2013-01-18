-------------------------------------------------------------------------------
-- File name: aes220_spiProgramming_tb6.vhd
-------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
-------------------------------------------------------------------------------
-- DESCRIPTION
--
-- VHDL test bench for aes220_spiProgramming_110219-01.vhd 
--
--
--
--
---------------------------------------------------------------------------------
--CHANGES
--
--           
--
---------------------------------------------------------------------------------

library  IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;
use IEEE.numeric_std.all;

entity testbench is
  
  generic (
    vector1_size_c : integer := 27);  -- sets the size of the test vector

end testbench;

architecture testbench_arch of testbench is
  -- component declaration 
  component aes220_prog_ent
    port (
      FX2_CLKOUT  : in    std_logic;           -- Oscillator
      SHFTOUT     : out   std_logic;           -- Shift register test output
      SHFTON      : out   std_logic;           -- Shift register test output
      SHFTIN      : out   std_logic;           -- Shift register test output
      CLKTST      : out   std_logic;           -- Shift register test output
      FX2_IOA     : inout std_logic_vector(7 downto 0); -- FX2 port A
      FX2_IOB     : inout std_logic_vector(7 downto 0); -- FX2 port B
      FX2_IOD     : inout std_logic_vector(3 downto 2); -- FX2 port D
      LED         : out   std_logic_vector(4 downto 1)  -- Active low LEDs
      );
  end component;

  -- declare one large signal (easier to loop through further down)
  signal ports : std_logic_vector((vector1_size_c -1)  downto 0) := (others => 'Z');

  -- declare an alias for each port for clarity
  alias FX2_CLKOUT  : std_logic is ports(26); 
  alias SHFTON      : std_logic is ports(25); 
  alias CLKTST      : std_logic is ports(24); 
  alias SHFTOUT     : std_logic is ports(23); 
  alias SHFTIN      : std_logic is ports(22); 
  alias FX2_IOD     : std_logic_vector(3 downto 2) is ports(21 downto 20);
  alias FX2_IOB     : std_logic_vector(7 downto 0) is ports(19 downto 12);
  alias FX2_IOA     : std_logic_vector(7 downto 0) is ports(11 downto 4);
  alias LED         : std_logic_vector(4 downto 1) is ports(3 downto 0);

  for uut : aes220_prog_ent
    use entity work.aes220_prog_ent(spiProgramming_arch);

begin
  uut : aes220_prog_ent
    port map (
      FX2_CLKOUT   => FX2_CLKOUT,
      SHFTOUT      => SHFTOUT,
      SHFTIN       => SHFTIN,
      SHFTON       => SHFTON,
      CLKTST       => CLKTST,
      FX2_IOA      => FX2_IOA,
      FX2_IOB      => FX2_IOB,
      FX2_IOD      => FX2_IOD,
      LED          => LED);

-- purpose: testbench using vector file as input, this part should not have to
--          be modidied, save for the file containing the test vectors
-- type   : combinational
-- inputs : 
-- outputs: 
test_proc: process

   -- file containing the test vectors
  file vector_file_f : text is in
    "/media/ssaury1/BUF/Work/Aessent/progs/aes220/RevP2/examples/fpgaProgramming/Vhdl/test_vector06.tv";

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
      vector_index_v := vector1_size_c - 1;
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

CONFIGURATION SpiProgramming_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END SpiProgramming_cfg;
