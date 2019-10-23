-- Version: v11.5 SP2 11.5.2.6

library ieee;
use ieee.std_logic_1164.all;
library proasic3e;
use proasic3e.all;

entity mux is

    port( Data0_port : in    std_logic;
          Data1_port : in    std_logic;
          Data2_port : in    std_logic;
          Data3_port : in    std_logic;
          Data4_port : in    std_logic;
          Data5_port : in    std_logic;
          Data6_port : in    std_logic;
          Data7_port : in    std_logic;
          Sel0       : in    std_logic;
          Sel1       : in    std_logic;
          Sel2       : in    std_logic;
          Result     : out   std_logic
        );

end mux;

architecture DEF_ARCH of mux is 

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal MX2_5_Y, MX2_0_Y, MX2_1_Y, MX2_4_Y, MX2_3_Y, MX2_2_Y
         : std_logic;

begin 


    MX2_0 : MX2
      port map(A => Data2_port, B => Data3_port, S => Sel0, Y => 
        MX2_0_Y);
    
    MX2_3 : MX2
      port map(A => Data4_port, B => Data5_port, S => Sel0, Y => 
        MX2_3_Y);
    
    MX2_4 : MX2
      port map(A => MX2_3_Y, B => MX2_2_Y, S => Sel1, Y => 
        MX2_4_Y);
    
    MX2_Result : MX2
      port map(A => MX2_1_Y, B => MX2_4_Y, S => Sel2, Y => Result);
    
    MX2_5 : MX2
      port map(A => Data0_port, B => Data1_port, S => Sel0, Y => 
        MX2_5_Y);
    
    MX2_2 : MX2
      port map(A => Data6_port, B => Data7_port, S => Sel0, Y => 
        MX2_2_Y);
    
    MX2_1 : MX2
      port map(A => MX2_5_Y, B => MX2_0_Y, S => Sel1, Y => 
        MX2_1_Y);
    

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
-- DESDIR:C:/Microsemi/Libero_v11.5/projects/vmed/extMEM/smartgen\mux
-- GEN_BEHV_MODULE:F
-- SMARTGEN_DIE:IT10X10M3
-- SMARTGEN_PACKAGE:pq208
-- AGENIII_IS_SUBPROJECT_LIBERO:T
-- WIDTH:1
-- SIZE:8
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

