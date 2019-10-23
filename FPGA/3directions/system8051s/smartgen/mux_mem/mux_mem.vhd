-- Version: v11.5 SP2 11.5.2.6

library ieee;
use ieee.std_logic_1164.all;
library proasic3e;
use proasic3e.all;

entity mux_mem is

    port( Data0_port : in    std_logic_vector(7 downto 0);
          Data1_port : in    std_logic_vector(7 downto 0);
          Sel0       : in    std_logic;
          Result     : out   std_logic_vector(7 downto 0)
        );

end mux_mem;

architecture DEF_ARCH of mux_mem is 

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component BUFF
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \SelAux_0[0]\, \SelAux_0[4]\ : std_logic;

begin 


    \MX2_Result[4]\ : MX2
      port map(A => Data0_port(4), B => Data1_port(4), S => 
        \SelAux_0[4]\, Y => Result(4));
    
    \MX2_Result[3]\ : MX2
      port map(A => Data0_port(3), B => Data1_port(3), S => 
        \SelAux_0[0]\, Y => Result(3));
    
    \MX2_Result[6]\ : MX2
      port map(A => Data0_port(6), B => Data1_port(6), S => 
        \SelAux_0[4]\, Y => Result(6));
    
    \BUFF_SelAux_0[0]\ : BUFF
      port map(A => Sel0, Y => \SelAux_0[0]\);
    
    \BUFF_SelAux_0[4]\ : BUFF
      port map(A => Sel0, Y => \SelAux_0[4]\);
    
    \MX2_Result[0]\ : MX2
      port map(A => Data0_port(0), B => Data1_port(0), S => 
        \SelAux_0[0]\, Y => Result(0));
    
    \MX2_Result[2]\ : MX2
      port map(A => Data0_port(2), B => Data1_port(2), S => 
        \SelAux_0[0]\, Y => Result(2));
    
    \MX2_Result[5]\ : MX2
      port map(A => Data0_port(5), B => Data1_port(5), S => 
        \SelAux_0[4]\, Y => Result(5));
    
    \MX2_Result[1]\ : MX2
      port map(A => Data0_port(1), B => Data1_port(1), S => 
        \SelAux_0[0]\, Y => Result(1));
    
    \MX2_Result[7]\ : MX2
      port map(A => Data0_port(7), B => Data1_port(7), S => 
        \SelAux_0[4]\, Y => Result(7));
    

end DEF_ARCH; 

-- _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


-- _GEN_File_Contents_

-- Version:11.5.2.6
-- ACTGENU_CALL:1
-- BATCH:T
-- FAM:PA3
-- OUTFORMAT:VHDL
-- LPMTYPE:LPM_MUX
-- LPM_HINT:None
-- INSERT_PAD:NO
-- INSERT_IOREG:NO
-- GEN_BHV_VHDL_VAL:F
-- GEN_BHV_VERILOG_VAL:F
-- MGNTIMER:F
-- MGNCMPL:T
-- DESDIR:C:/Microsemi/Libero_v11.5/projects/vmed/extMEM/smartgen\mux_mem
-- GEN_BEHV_MODULE:F
-- SMARTGEN_DIE:IT10X10M3
-- SMARTGEN_PACKAGE:pq208
-- AGENIII_IS_SUBPROJECT_LIBERO:T
-- WIDTH:8
-- SIZE:2
-- SEL0_FANIN:AUTO
-- SEL0_VAL:6
-- SEL0_POLARITY:1
-- SEL1_FANIN:AUTO
-- SEL1_VAL:6
-- SEL1_POLARITY:2
-- SEL2_FANIN:AUTO
-- SEL2_VAL:6
-- SEL2_POLARITY:2
-- SEL3_FANIN:AUTO
-- SEL3_VAL:6
-- SEL3_POLARITY:2
-- SEL4_FANIN:AUTO
-- SEL4_VAL:6
-- SEL4_POLARITY:2

-- _End_Comments_

