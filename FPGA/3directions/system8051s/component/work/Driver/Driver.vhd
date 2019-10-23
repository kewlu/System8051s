----------------------------------------------------------------------
-- Created by SmartDesign Wed Apr 12 09:56:53 2017
-- Version: v11.5 SP2 11.5.2.6
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library proasic3e;
use proasic3e.all;
----------------------------------------------------------------------
-- Driver entity declaration
----------------------------------------------------------------------
entity Driver is
    -- Port list
    port(
        -- Inputs
        CLK     : in  std_logic;
        Impulse : in  std_logic;
        -- Outputs
        Y       : out std_logic
        );
end Driver;
----------------------------------------------------------------------
-- Driver architecture body
----------------------------------------------------------------------
architecture RTL of Driver is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- AND2
component AND2
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        -- Outputs
        Y : out std_logic
        );
end component;
-- AND2A
component AND2A
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        -- Outputs
        Y : out std_logic
        );
end component;
-- DFN1
component DFN1
    -- Port list
    port(
        -- Inputs
        CLK : in  std_logic;
        D   : in  std_logic;
        -- Outputs
        Q   : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AND2_0_Y : std_logic;
signal DFN1_0_Q : std_logic;
signal DFN1_1_Q : std_logic;
signal DFN1_2_Q : std_logic;
signal Y_net_0  : std_logic;
signal Y_net_1  : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 Y_net_1 <= Y_net_0;
 Y       <= Y_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AND2_0
AND2_0 : AND2
    port map( 
        -- Inputs
        A => DFN1_0_Q,
        B => DFN1_1_Q,
        -- Outputs
        Y => AND2_0_Y 
        );
-- AND2A_0
AND2A_0 : AND2A
    port map( 
        -- Inputs
        A => DFN1_2_Q,
        B => AND2_0_Y,
        -- Outputs
        Y => Y_net_0 
        );
-- DFN1_0
DFN1_0 : DFN1
    port map( 
        -- Inputs
        D   => Impulse,
        CLK => CLK,
        -- Outputs
        Q   => DFN1_0_Q 
        );
-- DFN1_1
DFN1_1 : DFN1
    port map( 
        -- Inputs
        D   => DFN1_0_Q,
        CLK => CLK,
        -- Outputs
        Q   => DFN1_1_Q 
        );
-- DFN1_2
DFN1_2 : DFN1
    port map( 
        -- Inputs
        D   => DFN1_1_Q,
        CLK => CLK,
        -- Outputs
        Q   => DFN1_2_Q 
        );

end RTL;
