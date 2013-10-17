----------------------------------------------------------------------------------------------------
-- File name: aes220_Library_V1.3.0.vhd
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Components required to interface between the slave FIFOs of the micro-controller and the pipes
-- connected to the rest of the FPGA design (user app).
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V1.0.0 Original library
-- V1.2.0 Added PAUSE_in signal to aes220_PipeIn_ent and aes220_PipeOut_ent allowing to pause the
--        data transfer.
-- V1.2.1 Corrected some comments in the aes220_PipeIn_ent entity
--        Modified ae220_PipeOut_ent (split process in two)
-- V1.2.2 Disabled the PKT_END signal in aes220_FX2_Interface_ent when the packet written to the
--        FX2 fifo (from the FPGA) is a multiple of the FX2 buffer size (512 bytes).
-- V1.2.3 Removed redundant register loop in aes220_PipeOut_ent entity
-- V1.3.0 Modifying signals names from pipes to match a Ready/Valid fifo interface.
--        Changed from using std_logic_vector type to using unsigned 
--
----------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2012-2013 Sebastien Saury, Aessent Technology Ltd
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the Lesser GNU General Public License as published by
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
-- Entities present in the library:
-- Entity name: aes220_FX2_Interface_ent
-- Entity name: aes220_PipeIn_ent
-- Entity name: aes220_PipeOut_ent

----------------------------------------------------------------------------------------------------
-- Entity name: aes220_FX2_Interface_ent
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Interfacing between the slave FIFOs of the micro-controller and the pipes
-- used by the user application.
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V1.0.0 Original library
-- V1.2.0 Minor changes to accomodate the pause signal added to the in and out pipes.
-- V1.2.2 Added a commit_s to skip the commit state if the data size is a
--        multiple of the FX2 buffer size (512 bytes)
-- V1.3.0 Major overall of the state machine to adapt to a ready/valid interface for the pipes
--
----------------------------------------------------------------------------------------------------
-- PINOUT
--
--
--                       _________________________
--                      |                         |
--                      |                         |
--                      |                         |
--               RST  > | RST_in        IFCLK_out | > APP CLOCK
--                      |                         |
--                      |                         |
--                      |                         |
--                      |                         |
--                      |                         |
--        FX2 -> INT  > | FI_in                   |
--        FX2 <- INT  < | IF_out                  |
--        FX2 <> INT <> | FI_io            IP_out | > INT -> PIPES
--                      |                   PI_in | < INT <- PIPES
--                      |                         |
--                      |         FX2_INTERFACE   |
--                      |_________________________|
--
--
----------------------------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes220_FX2_Interface_ent is
  generic(
    RESET_ACTIVE_LEVEL_c : std_logic := '1';
    FIFO_FULL_c          : std_logic := '1';
    DATA_AV_c            : std_logic := '1';
    DATA_RQ_c            : std_logic := '1';
    COMMIT_PKT_c         : std_logic := '1';
    READ_FIFO_c          : std_logic := '1';
    WRITE_FIFO_c         : std_logic := '1';
    WRITE_FLAG_c         : std_logic := '1';
    DATA_READ_c          : std_logic := '1'
    );
  Port(
    -- FX2 connections
    RST_in : in    std_logic;      -- Places the different processes into reset if setup
    FI_in  : in    unsigned(2 downto 0);  -- Input signals from the FX2
    IF_out : out   unsigned(7 downto 0);  -- Output signals to the FX2
    FI_io  : inout unsigned(7 downto 0);  -- FX2 data bus
    -- Pipe connections
    PI_in  : in  unsigned(9 downto 0);
    IP_out : out unsigned(18 downto 0);
    -- User application connections
    IFCLK_out      : out std_logic     -- User clock, same as FX2_CLKOUT
    );
end aes220_FX2_Interface_ent;

architecture aes220_FX2_Interface_arch of aes220_FX2_Interface_ent is

  -- FX2 side input signal aliases
  alias FX2_CLKOUT_in : std_logic is FI_in(2); -- Clock in from FX2
  alias FIFO_FULL_in  : std_logic is FI_in(1); -- FIFO full flag (FLAGB)
  alias DATA_AV_in    : std_logic is FI_in(0); -- DATA available flag (FLAGC)
  -- FX2 side output signal aliases
  alias FIFO_ADDR_out : unsigned(1 downto 0) is IF_out(6 downto 5); -- Selects FIFO
  alias SLCS_out      : std_logic is IF_out(4); -- Enables the FX2  pins
  alias SLOE_out      : std_logic is IF_out(3); -- Enables the FX2 IOB pins as outputs
  alias SLRD_out      : std_logic is IF_out(2); -- Enables reading from the out FIFO
  alias SLWR_out      : std_logic is IF_out(1); -- Enables writing to the input FIFO
  alias PKTEND_out    : std_logic is IF_out(0); -- Signals last byte when writing to FX2
  -- Pipe side input signal aliases
  alias DATA_in    : unsigned(7 downto 0) is PI_in(9 downto 2);  -- from user app
  alias FIFO_RD_in : std_logic is PI_in(1);  -- Pipe ready to read (used to pause transfer)
  alias FIFO_WR_in : std_logic is PI_in(0);  -- Pipe ready to write (used to pause transfer)
  -- Pipe side output signal aliases
  alias CLOCK_out   : std_logic is IP_out(18);  -- Clock to the pipes
  alias DATA_out    : unsigned(7 downto 0) is IP_out(17 downto 10);  -- to user app
  alias ADDRESS_out : unsigned(6 downto 0) is IP_out(9 downto 3); -- Pipe address
  alias DATA_AV_out : std_logic is IP_out(2);  -- Data available to user app
  alias DATA_RQ_out : std_logic is IP_out(1);  -- Data required from user app

  type StateType is (
    STATE_IDLE,
    STATE_GET_HEADER,
    STATE_GET_ADDRESS,
    STATE_GET_SIZE_MSB,
    STATE_GET_SIZE_LSB,
    STATE_READ,
    STATE_WRITE,
    STATE_COMMIT
    );

  -- Signals declarations
  signal currentState, nextState : stateType;
  signal mainClk_s         : std_logic;
  signal dataSize_s        : unsigned(15 downto 0);  -- Read/Write count
  signal commit_s          : std_logic := COMMIT_PKT_c;
  signal actionFlag_s      : std_logic;
  signal fifoControl_s     : unsigned(4 downto 0);
  signal address_s         : unsigned(6 downto 0);
  signal fx2DataIn_s       : unsigned(7 downto 0);
  signal prevDataAv_s      : std_logic;

  -- FIFO controls
  constant FIFO_OE     : unsigned(4 downto 0) := "01000";  -- assert SLOE
  constant FIFO_READ   : unsigned(4 downto 0) := "01100";  -- assert SLRD & SLOE
  constant FIFO_WRITE  : unsigned(4 downto 0) := "00010";  -- assert SLWR
  constant FIFO_COMMIT : unsigned(4 downto 0) := "00001";  -- assert PKTEND
  constant FIFO_WAIT   : unsigned(4 downto 0) := "10000";  -- assert nothing
  -- FIFO address
  constant OUT_FIFO    : unsigned(1 downto 0) := "00"; -- EP2OUT
  constant IN_FIFO     : unsigned(1 downto 0) := "10"; -- EP6IN

begin

  -- purpose: state machine register
  -- type   : sequential
  -- inputs : mainClk_s, RST_in
  -- outputs:
  state_register: process(mainClk_s, RST_in)

  begin
    if RST_in = RESET_ACTIVE_LEVEL_c then
      currentState <= STATE_IDLE;
    elsif rising_edge(mainClk_s) then
      currentState <= nextState;
    end if;
  end process state_register;

  -- Next State logic
  -- purpose: next state computation
  -- type   : combinational
  next_state_logic : process(currentState, FIFO_RD_in, FIFO_WR_in, prevDataAV_s, DATA_AV_in,
                             FIFO_FULL_in, dataSize_s, commit_s, actionFlag_s)
  begin
    nextState <= currentState;
    case currentState is
      when STATE_IDLE =>
        if (DATA_AV_in = DATA_AV_c) and (prevDataAV_s = not DATA_AV_in) then
          -- prevDataAv_s introduced to prevent the state machine starting
          -- after a board reset if the uC is in Port Mode rather than FIFO
          -- Mode and the dataAV_s signal is not set (i.e. can be of any level)
          nextState <= STATE_GET_HEADER;
        end if;
      when STATE_GET_HEADER =>
        nextState <= STATE_GET_ADDRESS;
      when STATE_GET_ADDRESS =>
        nextState <= STATE_GET_SIZE_MSB;
      when STATE_GET_SIZE_MSB =>
        nextState <= STATE_GET_SIZE_LSB;
      when STATE_GET_SIZE_LSB =>
        if actionFlag_s = WRITE_FLAG_c then
          nextState <= STATE_WRITE;
        else
          nextState <= STATE_READ;
        end if;
      when STATE_READ =>
        -- Host PC --> FPGA        
        -- This state reads from the FX2 fifo and provides the data to the FPGA
        -- application
        if (DATA_AV_in = DATA_AV_c) and (FIFO_RD_in = READ_FIFO_c) then
          if dataSize_s = 1 then
            nextState <= STATE_IDLE;
          end if;
        end if;
      when STATE_WRITE =>
        -- FPGA --> host PC
        -- This state takes data from the FPGA application and writes to the FX2 fifo
        if (FIFO_WR_in = WRITE_FIFO_c) and (FIFO_FULL_in = not FIFO_FULL_c) then
          if dataSize_s = 1 then
            if commit_s = COMMIT_PKT_c then
              nextState <= STATE_COMMIT;
            else
              nextState <= STATE_IDLE;
            end if;
          end if;
        end if;
      when STATE_COMMIT =>
        nextState <= STATE_IDLE;
      when others =>
        nextState <= STATE_IDLE;
    end case;

  end process next_state_logic;

  -- purpose: updates the state machine outputs with each clock pulse of the clock
  -- type   : sequential
  -- inputs : mainClk_s, RST_in
  -- outputs:
  output_register : process (mainClk_s, FI_in(2), RST_in)
  begin  
    if RST_in = RESET_ACTIVE_LEVEL_c then
      address_s <= (others => '1');
      dataSize_s <= (others => '0');
      actionFlag_s <= not WRITE_FLAG_c;
      prevDataAv_s <= DATA_AV_in;
    elsif rising_edge(mainClk_s) then
      prevDataAv_s <= DATA_AV_in;
      case currentState is
        when STATE_GET_HEADER =>
          commit_s <= COMMIT_PKT_c;
        when STATE_GET_ADDRESS =>
          address_s <= fx2DataIn_s(6 downto 0);
          actionFlag_s <= fx2DataIn_s(7);
        when STATE_GET_SIZE_MSB =>
          dataSize_s(15 downto 8) <= fx2DataIn_s;
        when STATE_GET_SIZE_LSB =>
          dataSize_s(7 downto 0) <= fx2DataIn_s;
          if (dataSize_s(8) & fx2DataIn_s) = 0 then
            commit_s <= not COMMIT_PKT_c;
          end if;
        when STATE_READ =>
          if (DATA_AV_in = DATA_AV_c) and (FIFO_RD_in = READ_FIFO_c) then
            dataSize_s <= dataSize_s - 1;
          end if;
        when STATE_WRITE =>
          if (FIFO_WR_in = WRITE_FIFO_c) and (FIFO_FULL_in = not FIFO_FULL_c) then
            dataSize_s <= dataSize_s - 1;
          end if;
        when others => null;
      end case;
    end if;
  end process output_register;


  -- purpose: updates the fifoControl signal (read, write, commit...) and data
  --          available or required ports
  -- type   : combinational
  output_logic: process (currentState, DATA_AV_in, FIFO_RD_in, FIFO_WR_in, FIFO_FULL_in, DATA_in,
                         FI_in, FI_io, PI_in)
  begin 
    fifoControl_s <= FIFO_WAIT;
    DATA_AV_out <= not DATA_AV_c;
    DATA_AV_out <= not DATA_AV_c;
    DATA_RQ_out <= not DATA_RQ_c   ;     -- Don't require any data unless explcitly specified
    FIFO_ADDR_out <= OUT_FIFO;           -- Out FIFO by default (reading from FX2)
    FI_io <= (others => 'Z');
    case currentState is
      when STATE_GET_ADDRESS =>
        fifoControl_s <= FIFO_READ;
      when STATE_GET_SIZE_MSB =>
        fifoControl_s <= FIFO_READ;
      when STATE_GET_SIZE_LSB =>
        fifoControl_s <= FIFO_READ;
      when STATE_READ =>
        fifoControl_s <= FIFO_OE;
        if DATA_AV_in = DATA_AV_c then
          DATA_AV_out <= DATA_AV_c;
        end if;
        if (DATA_AV_in = DATA_AV_c) and (FIFO_RD_in = READ_FIFO_c) then
          fifoControl_s <= FIFO_READ;
        end if;
      when STATE_WRITE =>
        FI_io <= DATA_in;
        FIFO_ADDR_out <= IN_FIFO;
        if FIFO_FULL_in = not FIFO_FULL_c then
          DATA_RQ_out <= DATA_RQ_c;
        end if;
        if (FIFO_WR_in = WRITE_FIFO_c) and (FIFO_FULL_in = not FIFO_FULL_c) then
          fifoControl_s <= FIFO_WRITE;
        end if;
      when STATE_COMMIT =>
        FIFO_ADDR_out <= IN_FIFO;
        fifoControl_s <= FIFO_COMMIT;
      when others => null;
    end case;
  end process output_logic;
  
  -- Breakout fifoControl_s
  SLCS_out   <= fifoControl_s(4);
  SLOE_out   <= fifoControl_s(3);
  SLRD_out   <= fifoControl_s(2);
  SLWR_out   <= fifoControl_s(1);
  PKTEND_out <= fifoControl_s(0);

  -- Clocks
  mainClk_s <= FX2_CLKOUT_in;
  IFCLK_out <= FX2_CLKOUT_in;
  CLOCK_out <= FX2_CLKOUT_in;
  IF_out(7) <= FX2_CLKOUT_in;

  IP_out(0) <= FIFO_FULL_in; -- fifo full signal goes to pipes and user application
  ADDRESS_out <= address_s;

  fx2DataIn_s <= FI_io;
  DATA_out <= FI_io;

end aes220_FX2_Interface_arch;

----------------------------------------------------------------------------------------------------
-- Entity name: aes220_PipeIn_ent
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Provides data coming from the USB to the user application.
-- Data is produced as soon as the READ_RQ signals are issued.
--
----------------------------------------------------------------------------------------------------
-- CHANGES
--
-- V1.0.0 Original library
-- V1.2.0 Added pause signal
-- V1.2.3 Removed redundant register loop
-- V1.3.0 Now using a ready/valid interface
--
----------------------------------------------------------------------------------------------------
-- PINOUT
--
--
--
--                       _________________________
--                      |                         |
--                      |                         |
--                      |                         |
--          PIPE_ADDR > | P_ADDR        VALID_out | > Data awaiting for the app
--                      |                         |
--                      |                         |
--                      |                READY_in | < Pause/OK the data transfer
--                      |                         |
--                      |                         |
--        PIPE_FX2INT < | PI                      |
--        FX2INT_PIPE > | IP                      |
--                      |                         |
--                      |                DATA_out | > app data
--                      |                         |
--                      |               PipeIn    |
--                      |_________________________|
--
--
--
--
----------------------------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes220_PipeIn_ent is
  generic(
    DATA_AV_c     : std_logic := '1';
    READ_RQ_c     : std_logic := '1');
  Port(
    -- Connections to the FX2 interface
    IP_in    : in  unsigned(18 downto 0);
    PI_out   : out unsigned(9 downto 0);
    -- User application connections
    P_ADDR_in   : in unsigned(6 downto 0);  -- The pipe address set by user app
    READY_in    : in std_logic;      -- Pause input for pausing the transfer
    VALID_out   : out std_logic;     -- Data available flag to user app
    DATA_out    : out unsigned(7 downto 0)  -- data to user app
    );
end aes220_PipeIn_ent;

architecture aes220_PipeIn_arch of aes220_PipeIn_ent is

  alias IFCLK_in    : std_logic is IP_in(18);  -- Clock in from interface
  alias DATA_in     : unsigned(7 downto 0) is IP_in(17 downto 10); -- Data from the FX2
                                                                   -- interface
  alias ADDR_in     : unsigned(6 downto 0) is IP_in(9 downto 3); -- The address accessed
                                                                 -- by the FX2 interface
  alias DATA_AV_in  : std_logic is IP_in(2);  -- Data is available to user app
  alias DATA_RQ_in  : std_logic is IP_in(1);  -- Data required from user app

  alias FIFO_RD_out : std_logic is PI_out(1);  -- Ready to read from FIFO
  alias FIFO_WR_out : std_logic is PI_out(0);  -- Ready to write to FIFO

  signal dataReg_s  : unsigned(7 downto 0);
  signal dataOut_s  : unsigned(7 downto 0);

begin
  -- purpose: passes the data from the fx2 to the rest of the design
  -- type   : combinational
  output_logic : process (IP_in(9 downto 2), ADDR_in, DATA_AV_in, P_ADDR_in, READY_in,
                                  DATA_in, dataReg_s)
  begin 
    if (ADDR_in /= P_ADDR_in) then
      PI_out(9 downto 1) <= (others => '0');
      VALID_out <= not READ_RQ_c;
      dataOut_s <= dataReg_s;
    else
      VALID_out <= not READ_RQ_c;
      PI_out(9 downto 2) <= (others => '0');
      FIFO_RD_out <= READY_in;
      dataOut_s <= dataReg_s;
      if (DATA_AV_in = DATA_AV_c) then
        VALID_out <= READ_RQ_c;
        dataOut_s <= DATA_in;
      end if;
    end if;
  end process output_logic;
  
  -- purpose: updates the output register, used to maintain the value on the
  --          pipe even when no longer selected.
  -- type   : sequential
  output_register: process (IFCLK_in, ADDR_in)
  begin  
    if rising_edge(IFCLK_in) then  -- rising clock edge
      dataReg_s <= dataOut_s;
    end if;
  end process output_register;

  FIFO_WR_out <= '0';
  DATA_out <= dataOut_s;
  
end aes220_PipeIn_arch;

----------------------------------------------------------------------------------------------------
-- Entity name: aes220_PipeOut_ent
----------------------------------------------------------------------------------------------------
-- Author: Sebastien Saury, Aessent Technology Ltd
----------------------------------------------------------------------------------------------------
-- DESCRIPTION
--
-- Allows the user application to send data to the host PC via the USB port.
-- Data is expected after the WRITE_RQ signal is issued.
--
----------------------------------------------------------------------------------------------------
--CHANGES
--
-- V1.0.0 Original library
-- V1.2.0 Added pause signal
-- V1.3.0 Now using a ready/valid interface
--
----------------------------------------------------------------------------------------------------
-- PINOUT
--
--
--
--                       _________________________
--                      |                         |
--                      |                         |
--                      |                         |
--     PIPE_  ADDRESS > | P_ADDR                  |
--                      |             REQUEST_out | > app data required
--                      |                         |
--                      |                         |
--                      |                VALID_in | < app data valid
--                      |                         |
--                      |                         |
--                 IP > | IP                      |
--                      |                         |
--                 PI < | PI              DATA_in | < APP_DATA
--                      |                         |
--                      |              PipeOut    |
--                      |_________________________|
--
--
--
--
----------------------------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes220_PipeOut_ent is
  Port(
    -- Connections to the FX2 interface
    IP_in    : in  unsigned(18 downto 0);
    PI_out   : out unsigned(9 downto 0);
    -- User application connections
    P_ADDR_in    : in  unsigned(6 downto 0);  -- The pipe address set by user app
    REQUEST_out    : out std_logic;     -- Data required from user app
    VALID_in     : in  std_logic;     -- Pause data transfer required from user app
    DATA_in      : in  unsigned(7 downto 0)  -- data from user app
    );
end aes220_PipeOut_ent;

architecture aes220_PipeOut_arch of aes220_PipeOut_ent is

  alias ADDR_in     : unsigned(6 downto 0) is IP_in(9 downto 3); -- The address accessed by
                                                                 -- the fx2 interface
  alias DATA_RQ_in  : std_logic is IP_in(1);  -- Data required from user app
  alias DATA_out    : unsigned(7 downto 0)
    is PI_out(9 downto 2);  -- Data to the FX2 interface
  alias FIFO_RD_out : std_logic is PI_out(1);  -- Ready to read from FIFO
  alias FIFO_WR_out : std_logic is PI_out(0);  -- Ready to write to FIFO

begin

  -- purpose: updates the state machine control outputs with each clock pulse of IFCLK_in
  -- type   : combinational
  output_logic : process (IP_in(9 downto 1), ADDR_in, P_ADDR_in, DATA_RQ_in, VALID_in, DATA_in)
  begin 
      if (ADDR_in = P_ADDR_in) then
        REQUEST_out <= DATA_RQ_in;        
        FIFO_WR_out <= VALID_in;
        DATA_out <= DATA_in;    
      else
        REQUEST_out <= '0';        
        FIFO_WR_out <= '0';
        DATA_out <= (others => '0');
      end if;
  end process;

  FIFO_RD_out <= '0';

end aes220_PipeOut_arch;
