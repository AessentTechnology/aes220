----------------------------------------------------------------------------------------------------
-- File name: aes220_Library_V1.2.1.vhd
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
-- data transfer.
-- V1.2.1 Corrected some comments in the aes220_PipeIn_ent entity
--        Modified ae220_PipeOut_ent (split process in two)
--
----------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2012 Sebastien Saury, Aessent Technology Ltd
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
use ieee.std_logic_unsigned.all;

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
    FI_in  : in    std_logic_vector(2 downto 0);  -- Input signals from the FX2
    IF_out : out   std_logic_vector(7 downto 0);  -- Output signals to the FX2
    FI_io  : inout std_logic_vector(7 downto 0);  -- FX2 data bus
    -- Pipe connections
    PI_in  : in  std_logic_vector(9 downto 0);
    IP_out : out std_logic_vector(18 downto 0);
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
  alias FIFO_ADDR_out : std_logic_vector(1 downto 0) is IF_out(6 downto 5); -- Selects FIFO
  alias SLCS_out      : std_logic is IF_out(4); -- Enables the FX2  pins
  alias SLOE_out      : std_logic is IF_out(3); -- Enables the FX2 IOB pins as outputs
  alias SLRD_out      : std_logic is IF_out(2); -- Enables reading from the out FIFO
  alias SLWR_out      : std_logic is IF_out(1); -- Enables writing to the input FIFO
  alias PKTEND_out    : std_logic is IF_out(0); -- Signals last byte when writing to FX2
  -- Pipe side input signal aliases
  alias DATA_in    : std_logic_vector(7 downto 0) is PI_in(9 downto 2);  -- from user app
  alias FIFO_RD_in : std_logic is PI_in(1);  -- Pipe ready to read (used to pause transfer)
  alias FIFO_WR_in : std_logic is PI_in(0);  -- Pipe ready to write (used to pause transfer)
  -- Pipe side output signal aliases
  alias CLOCK_out   : std_logic is IP_out(18);  -- Clock to the pipes
  alias DATA_out    : std_logic_vector(7 downto 0) is IP_out(17 downto 10);  -- to user app
  alias ADDRESS_out : std_logic_vector(6 downto 0) is IP_out(9 downto 3); -- Pipe address
  alias DATA_AV_out : std_logic is IP_out(2);  -- Data available to user app
  alias DATA_RQ_out : std_logic is IP_out(1);  -- Data required from user app

  type StateType is (
    STATE_IDLE,
    STATE_GET_HEADER,
    STATE_GET_ADDRESS,
    STATE_GET_SIZE_MSB,
    STATE_GET_SIZE_LSB,
    STATE_READ,
    STATE_COMMIT,
    STATE_WRITE
    );

  -- Signals declarations
  signal currentState, nextState : stateType;
  signal dataSize_s        : std_logic_vector(15 downto 0);  -- Read/Write count
  signal dataLeftOver_s    : std_logic_vector(15 downto 0);  -- Read/Write count
  signal actionFlag_s      : std_logic;
  signal fifoControl_s     : std_logic_vector(4 downto 0);
  signal address_s         : std_logic_vector(6 downto 0);
  signal fx2DataIn_s       : std_logic_vector(7 downto 0);
  signal dataAv_s          : std_logic;
  signal prevDataAv_s      : std_logic;
  signal pauseSlrd_s       : std_logic;
  signal pauseRd_s         : std_logic;
  --signal pauseWr_s         : std_logic;
  signal fifoWr_s          : std_logic;

  signal mainClk_s         : std_logic;

  -- FIFO controls
  constant FIFO_READ   : std_logic_vector(4 downto 0) := "01100";  -- assert SLRD & SLOE
  constant FIFO_WRITE  : std_logic_vector(4 downto 0) := "00010";  -- assert SLWR
  constant FIFO_COMMIT : std_logic_vector(4 downto 0) := "00001";  -- assert PKTEND
  constant FIFO_WAIT   : std_logic_vector(4 downto 0) := "10000";  -- assert nothing
  -- FIFO address
  constant OUT_FIFO    : std_logic_vector(1 downto 0) := "00"; -- EP2OUT
  constant IN_FIFO     : std_logic_vector(1 downto 0) := "10"; -- EP6IN

begin

  -- purpose: state machine register
  -- type   : sequential
  -- inputs : mainClk_s, RST_in
  -- outputs:
  State_Register: process(mainClk_s, RST_in)

  begin
    if RST_in = RESET_ACTIVE_LEVEL_c then
      currentState <= STATE_IDLE;
    elsif rising_edge(mainClk_s) then
      currentState <= nextState;
    end if;
  end process State_Register;

  -- Next State logic
  -- purpose: next state computation
  -- type   : combinational
  State_Logic: process(currentState, pauseRd_s, fifoWr_s, prevDataAV_s, DATA_AV_in,
                       FIFO_FULL_in, dataSize_s, dataLeftOver_s, actionFlag_s)
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
        if dataLeftOver_s = 0 then
          nextState <= STATE_IDLE;
        end if;
      when STATE_WRITE =>
        if dataSize_s = 0 then
          nextState <= STATE_COMMIT;
        end if;
      when STATE_COMMIT =>
        nextState <= STATE_IDLE;
      when others =>
        nextState <= STATE_IDLE;
    end case;

  end process State_Logic;

  -- purpose: updates the state machine outputs with each clock pulse of the clock
  -- type   : sequential
  -- inputs : mainClk_s, RST_in
  -- outputs:
  Synchronous_Outputs: process (mainClk_s, FI_in(2), RST_in)
  begin  -- process Synchronous_Outputs
    if RST_in = RESET_ACTIVE_LEVEL_c then
      address_s <= (others => '1');
      dataSize_s <= (others => '0');
      dataLeftOver_s <= (others => '0');
      actionFlag_s <= not WRITE_FLAG_c;
      fifoControl_s <= FIFO_WAIT;
      DATA_RQ_out <= not DATA_RQ_c;
      FIFO_ADDR_out <= OUT_FIFO;
      dataAv_s <= not DATA_AV_c;
      prevDataAv_s <= DATA_AV_in;
    elsif rising_edge(mainClk_s) then
      fifoControl_s <= FIFO_WAIT;       -- FX2LP FIFO waiting by default
      DATA_RQ_out <= not DATA_RQ_c;     -- Don't require any data unless explcitly specified
      FIFO_ADDR_out <= OUT_FIFO;        -- Out FIFO by default (reading from FX2)
      dataAv_s <= not DATA_AV_c;
      prevDataAv_s <= DATA_AV_in;
      dataLeftOver_s <= dataSize_s;
      case nextState is
        when STATE_IDLE => null;
        when STATE_GET_HEADER =>
          fifoControl_s <= FIFO_READ;
        when STATE_GET_ADDRESS =>
          fifoControl_s <= FIFO_READ;
          address_s <= fx2DataIn_s(6 downto 0);
          actionFlag_s <= fx2DataIn_s(7);
        when STATE_GET_SIZE_MSB =>
          fifoControl_s <= FIFO_READ;
          dataSize_s(15 downto 8) <= fx2DataIn_s;
        when STATE_GET_SIZE_LSB =>
          dataSize_s(7 downto 0) <= fx2DataIn_s;
        when STATE_READ =>
          if (DATA_AV_in = DATA_AV_c) then
            dataAv_s <= DATA_AV_c;
            fifoControl_s <= FIFO_READ;
            if (fifoControl_s = FIFO_READ) and (pauseRd_s = '0') then
              dataSize_s <= dataSize_s - 1;
            end if;
          end if;
        when STATE_WRITE =>
          FIFO_ADDR_out <= IN_FIFO;
          DATA_RQ_out <= DATA_RQ_c;
          if (fifoWr_s = WRITE_FIFO_c) and (FIFO_FULL_in = not FIFO_FULL_c) then
            fifoControl_s <= FIFO_WRITE;
            dataSize_s <= dataSize_s - 1;
            if dataSize_s = 1 then
              DATA_RQ_out <= not DATA_RQ_c;
              --fifoControl_s <= FIFO_WRITE;
            end if;
          end if;
        when STATE_COMMIT =>
          FIFO_ADDR_out <= IN_FIFO;
          DATA_RQ_out <= not DATA_RQ_c;
          fifoControl_s <= FIFO_COMMIT;
        when others =>
          fifoControl_s <= FIFO_WAIT;
      end case;
    end if;
  end process Synchronous_Outputs;

  DATA_out <= FI_io;

  -- purpose: Write to FI_io port
  -- type   : combinational
  -- inputs : DATA_in, currentState
  -- outputs: FI_io
  Asynchronous_Outputs: process (DATA_in, PI_in, currentState, pauseRd_s)
  begin  -- process Asynchronous_Outputs
    if currentState = STATE_WRITE then
      FI_io <= DATA_in;
    else
      FI_io <= (others => 'Z');
    end if;
    if (currentState = STATE_READ) then
      pauseSlrd_s <= pauseRd_s;
    else
      pauseSlrd_s <= '0';
    end if;
  end process Asynchronous_Outputs;
  
  -- Breakout fifoControl_s
  SLCS_out   <= fifoControl_s(4);
  SLOE_out   <= fifoControl_s(3);
  SLRD_out   <= fifoControl_s(2) and DATA_AV_in and not pauseSlrd_s;
  SLWR_out   <= fifoControl_s(1);
  PKTEND_out <= fifoControl_s(0);

  -- Clocks
  mainClk_s <= FX2_CLKOUT_in;
  IFCLK_out <= FX2_CLKOUT_in;
  CLOCK_out <= FX2_CLKOUT_in;
  IF_out(7) <= FX2_CLKOUT_in;

  IP_out(0) <= FIFO_FULL_in; -- fifo full signal goes to pipes and user application
  ADDRESS_out <= address_s;

  DATA_AV_out <= dataAv_s and DATA_AV_in;
  pauseRd_s <= FIFO_RD_in;
  fifoWr_s <= FIFO_WR_in;
  fx2DataIn_s <= FI_io;

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
--          PIPE_ADDR > | P_ADDR          READ_RQ | > APP_RQD_TO_READ
--                      |                         |
--                      |                         |
--                      |                PAUSE_in | < Pause the data transfer
--                      |                         |
--                      |                         |
--        PIPE_FX2INT < | PI                      |
--        FX2INT_PIPE > | IP                      |
--                      |                         |
--                      |                DATA_out | > APP_DATA
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
use ieee.std_logic_unsigned.all;

entity aes220_PipeIn_ent is
  generic(
    DATA_AV_c     : std_logic := '1';
    READ_RQ_c     : std_logic := '1';
    RDY_TO_READ_c : std_logic := '1'
    );
  Port(
    -- Connections to the FX2 interface
    IP_in    : in  std_logic_vector(18 downto 0);
    PI_out   : out std_logic_vector(9 downto 0);
    -- User application connections
    P_ADDR_in   : in std_logic_vector(6 downto 0);  -- The pipe address set by user app
    PAUSE_in    : in std_logic;      -- Pause input for pausing the transfer
    READ_RQ_out : out std_logic;     -- Data available flag to user app
    DATA_out    : out std_logic_vector(7 downto 0)  -- data to user app
    );
end aes220_PipeIn_ent;

architecture aes220_PipeIn_arch of aes220_PipeIn_ent is

  alias IFCLK_in    : std_logic is IP_in(18);  -- Clock in from interface
  alias DATA_in     : std_logic_vector(7 downto 0) is IP_in(17 downto 10); -- Data from the FX2
                                                                           -- interface
  alias ADDR_in     : std_logic_vector(6 downto 0) is IP_in(9 downto 3); -- The address accessed
                                                                         -- by the FX2 interface
  alias DATA_AV_in  : std_logic is IP_in(2);  -- Data is available to user app
  alias DATA_RQ_in  : std_logic is IP_in(1);  -- Data required from user app
  alias FIFO_FULL_in: std_logic is IP_in(0);  -- FIFO full signal, pause transfer
  alias FIFO_RD_out : std_logic is PI_out(1);  -- Ready to read from FIFO
  alias FIFO_WR_out : std_logic is PI_out(0);  -- Ready to write to FIFO

  signal dataReg_s     : std_logic_vector(7 downto 0);
  signal nextDataReg_s : std_logic_vector(7 downto 0);
  signal dataOut_s     : std_logic_vector(7 downto 0);

begin
  -- purpose: passes the data from the fx2 to the rest of the design
  -- type   : combinational
  -- inputs : ADDR_in (IP_in(9 downto 3)), DATA_AV_in (IP_in(2)), P_ADDR_in, PAUSE_in, DATA_in,
  --          PAUSE_in, dataReg_s
  -- outputs: dataOut_s, READ_RQ_out, PI_out(9 downto 1)
  Asynchronous_Outputs : process (IP_in(9 downto 2), ADDR_in, DATA_AV_in, P_ADDR_in, PAUSE_in,
                                  DATA_in, dataReg_s)
  begin 
    if (ADDR_in /= P_ADDR_in) then
      PI_out(9 downto 1) <= (others => '0');
      READ_RQ_out <= not READ_RQ_c;
      dataOut_s <= dataReg_s;
    else
      READ_RQ_out <= not READ_RQ_c;
      PI_out(9 downto 2) <= (others => '0');
      FIFO_RD_out <= PAUSE_in;
      dataOut_s <= dataReg_s;
      if (DATA_AV_in = DATA_AV_c) then
        READ_RQ_out <= READ_RQ_c;
        dataOut_s <= DATA_in;
      end if;
    end if;
  end process Asynchronous_Outputs;
  
  -- purpose: updates the register input
  -- type   : combinational
  -- inputs : ADDR_in, P_ADDR_in, DATA_AV_in, dataOut_s, dataReg_s
  -- outputs: nextDataReg_s
  Register_Multiplexer: process (ADDR_in, P_ADDR_in, DATA_AV_in, dataOut_s, dataReg_s)
  begin  -- process Register_Multiplexer
    if (ADDR_in = P_ADDR_in) and (DATA_AV_in = DATA_AV_c) then
      nextDataReg_s <= dataOut_s;
    else
      nextDataReg_s <= dataReg_s;
    end if;
  end process Register_Multiplexer;
  
  -- purpose: updates the output register
  -- type   : sequential
  -- inputs : IFCLK_in, ADDR_in
  -- outputs: dataReg_s
  Synchronous_Register: process (IFCLK_in, ADDR_in)
  begin  -- process Synchronous_Register
    if rising_edge(IFCLK_in) then  -- rising clock edge
      dataReg_s <= nextDataReg_s;
    end if;
  end process Synchronous_Register;

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
--                      |               WRITE_RQ  | > APP_RQD_TO_WRITE
--                      |                         |
--                      |                         |
--                      |               PAUSE_in  | < Pause the data transfer
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
use ieee.std_logic_unsigned.all;

entity aes220_PipeOut_ent is
  generic(
    DATA_RQD_c       : std_logic := '1';
    FIFO_FULL_c           : std_logic := '1';
    RDY_TO_WR_c        : std_logic := '1'
    );
  Port(
    -- Connections to the FX2 interface
    IP_in    : in  std_logic_vector(18 downto 0);
    PI_out   : out std_logic_vector(9 downto 0);
    -- User application connections
    P_ADDR_in    : in  std_logic_vector(6 downto 0);  -- The pipe address set by user app
    WRITE_RQ_out : out std_logic;     -- Data required from user app
    PAUSE_in     : in  std_logic;     -- Pause data transfer required from user app
    DATA_in      : in  std_logic_vector(7 downto 0)  -- data from user app
    );
end aes220_PipeOut_ent;

architecture aes220_PipeOut_arch of aes220_PipeOut_ent is

  alias IFCLK_in   : std_logic is IP_in(18);  -- Clock in from interface
  alias ADDR_in    : std_logic_vector(6 downto 0) is IP_in(9 downto 3); -- The address accessed by
                                                                        -- the fx2 interface
  alias DATA_AV_in   : std_logic is IP_in(2);  -- Data is available to user app
  alias DATA_RQ_in   : std_logic is IP_in(1);  -- Data required from user app
  alias FIFO_FULL_in : std_logic is IP_in(0);  -- FIFO full signal, pause transfer
  alias DATA_out     : std_logic_vector(7 downto 0)
    is PI_out(9 downto 2);  -- Data to the FX2 interface
  alias FIFO_RD_out  : std_logic is PI_out(1);  -- Ready to read from FIFO
  alias FIFO_WR_out  : std_logic is PI_out(0);  -- Ready to write to FIFO

  signal fifoWr_s  : std_logic;
  signal writeRq_s : std_logic;
  signal enableDataOut_s : std_logic;
  

begin


  -- purpose: updates the state machine control outputs with each clock pulse of IFCLK_in
  -- type   : sequential
  -- inputs : IFCLK_in, ADDR_in, P_ADDR_in, DATA_in
  -- outputs: fifoWr_s, writeRq_s, enableDataOut_s
  process (IFCLK_in, ADDR_in, P_ADDR_in)
  begin 
    if (ADDR_in /= P_ADDR_in) then
      fifoWr_s <= '0';
      writeRq_s <= '0';
      enableDataOut_s <= '0';
    else
      if rising_edge(IFCLK_in) then
        enableDataOut_s <= '1';
        fifoWr_s <= '0';
        writeRq_s <= '0';
        if (DATA_RQ_in = DATA_RQD_c) then
          writeRq_s <= DATA_RQD_c;
          fifoWr_s <= RDY_TO_WR_c;              
        end if;
      end if;
    end if;
  end process;

-- purpose: Enables the data outputs if the pipe address is selected
-- type   : combinational
-- inputs : enableDataOut_s, DATA_in
-- outputs: DATA_out
  data_out_mux: process (enableDataOut_s, DATA_in)
  begin  -- process data_out_mux
    if enableDataOut_s = '0' then
      DATA_out <= (others => '0');
    else
      DATA_out <= DATA_in;    
    end if;
  end process data_out_mux;

  FIFO_WR_out <= fifoWr_s and DATA_RQ_in and not PAUSE_in;    
  FIFO_RD_out <= '0';
  WRITE_RQ_out <= writeRq_s and DATA_RQ_in and not FIFO_FULL_in;
end aes220_PipeOut_arch;
