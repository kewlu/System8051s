----------------------------------------------------------------------
-- Created by SmartDesign Wed Apr 05 13:41:45 2017
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
-- MajorityGate entity declaration
----------------------------------------------------------------------
entity MajorityGate is
    -- Port list
    port(
        -- Inputs
        CLK : in  std_logic;
        IMP : in  std_logic;
        -- Outputs
        Y   : out std_logic
        );
end MajorityGate;
----------------------------------------------------------------------
-- MajorityGate architecture body
----------------------------------------------------------------------
architecture RTL of MajorityGate is
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
-- OR3
component OR3
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        C : in  std_logic;
        -- Outputs
        Y : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AND2_0_Y : std_logic;
signal AND2_1_Y : std_logic;
signal AND2_2_Y : std_logic;
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
-- AND2_1
AND2_1 : AND2
    port map( 
        -- Inputs
        A => DFN1_0_Q,
        B => DFN1_2_Q,
        -- Outputs
        Y => AND2_1_Y 
        );
-- AND2_2
AND2_2 : AND2
    port map( 
        -- Inputs
        A => DFN1_1_Q,
        B => DFN1_2_Q,
        -- Outputs
        Y => AND2_2_Y 
        );
-- DFN1_0
DFN1_0 : DFN1
    port map( 
        -- Inputs
        D   => IMP,
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
-- OR3_0
OR3_0 : OR3
    port map( 
        -- Inputs
        A => AND2_0_Y,
        B => AND2_1_Y,
        C => AND2_2_Y,
        -- Outputs
        Y => Y_net_0 
        );

end RTL;
