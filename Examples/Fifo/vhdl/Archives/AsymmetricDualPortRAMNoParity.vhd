
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity asymmetric_dual_port_RAM_no_parity_ent is

  generic (
    WIDTHA      : integer := 8;
    SIZEA       : integer := 2048;
    ADDRWIDTHA  : integer := 11;
    WIDTHB      : integer := 16;
    SIZEB       : integer := 1024;
    ADDRWIDTHB  : integer := 10
    );

  port (
    CLKA_in   : in  std_logic;
    CLKB_in   : in  std_logic;
    ENA_in    : in  std_logic;
    ENB_in    : in  std_logic;
    WEA_in    : in  std_logic;
    WEB_in    : in  std_logic;
    ADDRA_in  : in  std_logic_vector(ADDRWIDTHA-1 downto 0);
    ADDRB_in  : in  std_logic_vector(ADDRWIDTHB-1 downto 0);
    DIA_in    : in  std_logic_vector(WIDTHA-1 downto 0);
    DIB_in    : in  std_logic_vector(WIDTHB-1 downto 0);
    DOA_out   : out std_logic_vector(WIDTHA-1 downto 0);
    DOB_out   : out std_logic_vector(WIDTHB-1 downto 0));

end asymmetric_dual_port_RAM_no_parity_ent;

architecture behavioral of asymmetric_dual_port_RAM_no_parity_ent is

  function max(L, R: INTEGER) return INTEGER is
  begin
    if L > R then
      return L;
    else
      return R;
    end if;
  end;

  function min(L, R: INTEGER) return INTEGER is
  begin
    if L < R then
      return L;
    else
      return R;
    end if;
  end;

  -----------------------------------------------------------------------------------
  -- Xilinx log2 function so renamed after reading following discussion:
  -- http://www.edaboard.com/thread242745.html especially Kevin Jennings points
  -- roundup_log2(x) gives the minimum number of bits required to represent 'x'.
  -- roundup_log2(4) = 2, roundup_log2(5) = 3, etc.
  -----------------------------------------------------------------------------------
  function roundup_log2 (val: INTEGER) return natural is
    variable res : natural;
  begin
    for i in 0 to 31 loop
      if (val <= (2**i)) then
        res := i;
        exit;
      end if;
    end loop;
    return res;
  end function Roundup_log2;

  constant minWIDTH : integer := min(WIDTHA,WIDTHB);
  constant maxWIDTH : integer := max(WIDTHA,WIDTHB);
  constant maxSIZE  : integer := max(SIZEA,SIZEB);
  constant RATIO : integer := maxWIDTH / minWIDTH;

  constant minADDRWIDTH : integer := min(ADDRWIDTHA,ADDRWIDTHB);
  constant maxADDRWIDTH : integer := max(ADDRWIDTHA,ADDRWIDTHB);
  

  -- An asymmetric RAM is modeled in a similar way as a symmetric RAM, with an
  -- array of array object. Its aspect ratio corresponds to the port with the
  -- lower data width (larger depth)
  type ramType is array (0 to maxSIZE-1) of std_logic_vector(minWIDTH-1 downto 0);

  -- You need to declare ram_sv as a shared variable when :
  --   - the RAM has two write ports,
  --   - the RAM has only one write port whose data width is maxWIDTH
  -- In all other cases, ram_sv can be a signal.
  shared variable ram_sv : ramType := (others => (others => '0'));

 
  signal readA_s  : std_logic_vector(WIDTHA-1 downto 0):= (others => '0');
  signal readB_s  : std_logic_vector(WIDTHB-1 downto 0):= (others => '0');
  -- ss_ signal are for smaller width side while ws_ are for wider width side
  -- width being the width of the data, not the address lines
  signal ss_read_s  : std_logic_vector(minWIDTH-1 downto 0):= (others => '0');
  signal ws_read_s  : std_logic_vector(maxWIDTH-1 downto 0):= (others => '0');
  signal ss_en_s  : std_logic;
  signal ws_en_s  : std_logic;
  signal ss_we_s  : std_logic;
  signal ws_we_s  : std_logic;
  signal ss_addr_s  : std_logic_vector(maxADDRWIDTH-1 downto 0):= (others => '0');
  signal ws_addr_s  : std_logic_vector(minADDRWIDTH-1 downto 0):= (others => '0');
  signal ss_di_s  : std_logic_vector(minWIDTH-1 downto 0):= (others => '0');
  signal ws_di_s  : std_logic_vector(maxWIDTH-1 downto 0):= (others => '0');
  signal ss_clk_s  : std_logic;
  signal ws_clk_s  : std_logic;


begin

  -- The following two generate statements swap the signals in function of the
  -- BRAM ports data width
  port_B_wider_than_A: if WIDTHB >= WIDTHA generate
  begin 
  ss_clk_s <= CLKA_in;
  ss_en_s <= ENA_in;
  ss_we_s <= WEA_in;
  ss_addr_s <= ADDRA_in;
  ss_di_s <= DIA_in;
  readA_s <= ss_read_s;
  ws_clk_s <= CLKB_in;
  ws_en_s <= ENB_in;
  ws_we_s <= WEB_in;
  ws_addr_s <= ADDRB_in;
  ws_di_s <= DIB_in;
  readB_s <= ws_read_s;
  end generate port_B_wider_than_A;
  
  port_A_wider_than_B: if WIDTHA > WIDTHB generate
  ss_clk_s <= CLKB_in;
  ss_en_s <= ENB_in;
  ss_we_s <= WEB_in;
  ss_addr_s <= ADDRB_in;
  ss_di_s <= DIB_in;
  readB_s <= ss_read_s;
  ws_clk_s <= CLKA_in;
  ws_en_s <= ENA_in;
  ws_we_s <= WEA_in;
  ws_addr_s <= ADDRA_in;
  ws_di_s <= DIA_in;
  readA_s <= ws_read_s;    
  end generate port_A_wider_than_B;

  -- Side of the BRAM with the smaller data width
  process (ss_clk_s)
  begin
    if rising_edge(ss_clk_s) then
      if ss_en_s = '1' then
        ss_read_s <= ram_sv(conv_integer(ss_addr_s));
        if ss_we_s = '1' then
          ram_sv(conv_integer(ss_addr_s)) := ss_di_s;
        end if;
      end if;
      --regA_s <= ss_read_s;
    end if;
  end process;

  -- Side of the BRAM with the larger data width
  process (ws_clk_s)
  begin
    if rising_edge(ws_clk_s) then
      if ws_en_s = '1' then
        if RATIO = 1 then               -- Added in case the RAM is not asymmetric
          ws_read_s <= ram_sv(conv_integer(ws_addr_s));
          if ws_we_s = '1' then
            ram_sv(conv_integer(ws_addr_s)) := ws_di_s;
          end if;
        else
          for i in 0 to RATIO-1 loop
            -- The read statement below is placed before the write statement on purpose
            -- to ensure read-first synchronization through the variable mechanism
            ws_read_s((i+1)*minWIDTH-1 downto i*minWIDTH)
              <= ram_sv(conv_integer(ws_addr_s & conv_std_logic_vector(i,roundup_log2(RATIO))));
            if ws_we_s = '1' then
              ram_sv(conv_integer(ws_addr_s & conv_std_logic_vector(i,roundup_log2(RATIO))))
                := ws_di_s((i+1)*minWIDTH-1 downto i*minWIDTH);
            end if;
          end loop;
        end if;
      end if;
      --regB_s <= ws_read_s;
    end if;
  end process;

  -- Data
  DOA_out <= readA_s;
  DOB_out <= readB_s;
  --DOA_out <= regA_s; <- From original Xilinx template but generates register
                       --delaying the data by one clock cycle
  --DOB_out <= regB_s;
  
end behavioral;


