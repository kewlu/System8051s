-- Version: v11.5 SP2 11.5.2.6

library ieee;
use ieee.std_logic_1164.all;
library proasic3e;
use proasic3e.all;

entity code_ram_16kb is

    port( WD    : in    std_logic_vector(7 downto 0);
          RD    : out   std_logic_vector(7 downto 0);
          WEN   : in    std_logic;
          REN   : in    std_logic;
          WADDR : in    std_logic_vector(13 downto 0);
          RADDR : in    std_logic_vector(13 downto 0);
          RWCLK : in    std_logic
        );

end code_ram_16kb;

architecture DEF_ARCH of code_ram_16kb is 

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component RAM4K9
    generic (MEMORYFILE:string := "");

    port( ADDRA11 : in    std_logic := 'U';
          ADDRA10 : in    std_logic := 'U';
          ADDRA9  : in    std_logic := 'U';
          ADDRA8  : in    std_logic := 'U';
          ADDRA7  : in    std_logic := 'U';
          ADDRA6  : in    std_logic := 'U';
          ADDRA5  : in    std_logic := 'U';
          ADDRA4  : in    std_logic := 'U';
          ADDRA3  : in    std_logic := 'U';
          ADDRA2  : in    std_logic := 'U';
          ADDRA1  : in    std_logic := 'U';
          ADDRA0  : in    std_logic := 'U';
          ADDRB11 : in    std_logic := 'U';
          ADDRB10 : in    std_logic := 'U';
          ADDRB9  : in    std_logic := 'U';
          ADDRB8  : in    std_logic := 'U';
          ADDRB7  : in    std_logic := 'U';
          ADDRB6  : in    std_logic := 'U';
          ADDRB5  : in    std_logic := 'U';
          ADDRB4  : in    std_logic := 'U';
          ADDRB3  : in    std_logic := 'U';
          ADDRB2  : in    std_logic := 'U';
          ADDRB1  : in    std_logic := 'U';
          ADDRB0  : in    std_logic := 'U';
          DINA8   : in    std_logic := 'U';
          DINA7   : in    std_logic := 'U';
          DINA6   : in    std_logic := 'U';
          DINA5   : in    std_logic := 'U';
          DINA4   : in    std_logic := 'U';
          DINA3   : in    std_logic := 'U';
          DINA2   : in    std_logic := 'U';
          DINA1   : in    std_logic := 'U';
          DINA0   : in    std_logic := 'U';
          DINB8   : in    std_logic := 'U';
          DINB7   : in    std_logic := 'U';
          DINB6   : in    std_logic := 'U';
          DINB5   : in    std_logic := 'U';
          DINB4   : in    std_logic := 'U';
          DINB3   : in    std_logic := 'U';
          DINB2   : in    std_logic := 'U';
          DINB1   : in    std_logic := 'U';
          DINB0   : in    std_logic := 'U';
          WIDTHA0 : in    std_logic := 'U';
          WIDTHA1 : in    std_logic := 'U';
          WIDTHB0 : in    std_logic := 'U';
          WIDTHB1 : in    std_logic := 'U';
          PIPEA   : in    std_logic := 'U';
          PIPEB   : in    std_logic := 'U';
          WMODEA  : in    std_logic := 'U';
          WMODEB  : in    std_logic := 'U';
          BLKA    : in    std_logic := 'U';
          BLKB    : in    std_logic := 'U';
          WENA    : in    std_logic := 'U';
          WENB    : in    std_logic := 'U';
          CLKA    : in    std_logic := 'U';
          CLKB    : in    std_logic := 'U';
          RESET   : in    std_logic := 'U';
          DOUTA8  : out   std_logic;
          DOUTA7  : out   std_logic;
          DOUTA6  : out   std_logic;
          DOUTA5  : out   std_logic;
          DOUTA4  : out   std_logic;
          DOUTA3  : out   std_logic;
          DOUTA2  : out   std_logic;
          DOUTA1  : out   std_logic;
          DOUTA0  : out   std_logic;
          DOUTB8  : out   std_logic;
          DOUTB7  : out   std_logic;
          DOUTB6  : out   std_logic;
          DOUTB5  : out   std_logic;
          DOUTB4  : out   std_logic;
          DOUTB3  : out   std_logic;
          DOUTB2  : out   std_logic;
          DOUTB1  : out   std_logic;
          DOUTB0  : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component INV
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NAND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port(Y : out std_logic); 
  end component;

  component VCC
    port(Y : out std_logic); 
  end component;

    signal WEAP, WEBP, \ADDRA_FF2[0]\, \ADDRA_FF2[1]\, 
        \ADDRB_FF2[0]\, \ADDRB_FF2[1]\, \ENABLE_ADDRA[0]\, 
        \ENABLE_ADDRA[1]\, \ENABLE_ADDRA[2]\, \ENABLE_ADDRA[3]\, 
        \ENABLE_ADDRB[0]\, \ENABLE_ADDRB[1]\, \ENABLE_ADDRB[2]\, 
        \ENABLE_ADDRB[3]\, \BLKA_EN[0]\, \BLKB_EN[0]\, 
        \BLKA_EN[1]\, \BLKB_EN[1]\, \BLKA_EN[2]\, \BLKB_EN[2]\, 
        \BLKA_EN[3]\, \BLKB_EN[3]\, \READA_EN[0]\, \READB_EN[0]\, 
        \READA_EN[1]\, \READB_EN[1]\, \READA_EN[2]\, 
        \READB_EN[2]\, \READA_EN[3]\, \READB_EN[3]\, 
        \QX_TEMPR0[0]\, \QX_TEMPR1[0]\, \QX_TEMPR2[0]\, 
        \QX_TEMPR3[0]\, \QX_TEMPR0[1]\, \QX_TEMPR1[1]\, 
        \QX_TEMPR2[1]\, \QX_TEMPR3[1]\, \QX_TEMPR0[2]\, 
        \QX_TEMPR1[2]\, \QX_TEMPR2[2]\, \QX_TEMPR3[2]\, 
        \QX_TEMPR0[3]\, \QX_TEMPR1[3]\, \QX_TEMPR2[3]\, 
        \QX_TEMPR3[3]\, \QX_TEMPR0[4]\, \QX_TEMPR1[4]\, 
        \QX_TEMPR2[4]\, \QX_TEMPR3[4]\, \QX_TEMPR0[5]\, 
        \QX_TEMPR1[5]\, \QX_TEMPR2[5]\, \QX_TEMPR3[5]\, 
        \QX_TEMPR0[6]\, \QX_TEMPR1[6]\, \QX_TEMPR2[6]\, 
        \QX_TEMPR3[6]\, \QX_TEMPR0[7]\, \QX_TEMPR1[7]\, 
        \QX_TEMPR2[7]\, \QX_TEMPR3[7]\, MX2_4_Y, MX2_14_Y, 
        MX2_6_Y, MX2_0_Y, MX2_8_Y, MX2_1_Y, MX2_9_Y, MX2_2_Y, 
        MX2_12_Y, MX2_7_Y, MX2_13_Y, MX2_10_Y, MX2_11_Y, MX2_3_Y, 
        MX2_5_Y, MX2_15_Y, \VCC\, \GND\ : std_logic;
    signal GND_power_net1 : std_logic;
    signal VCC_power_net1 : std_logic;

begin 

    \GND\ <= GND_power_net1;
    \VCC\ <= VCC_power_net1;

    MX2_12 : MX2
      port map(A => \QX_TEMPR0[7]\, B => \QX_TEMPR1[7]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_12_Y);
    
    code_ram_16kb_R2C3 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(3), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[2]\, BLKB => \BLKB_EN[2]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR2[3]\);
    
    \MX2_RD[5]\ : MX2
      port map(A => MX2_5_Y, B => MX2_15_Y, S => \ADDRB_FF2[1]\, 
        Y => RD(5));
    
    MX2_10 : MX2
      port map(A => \QX_TEMPR2[0]\, B => \QX_TEMPR3[0]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_10_Y);
    
    \MX2_RD[2]\ : MX2
      port map(A => MX2_6_Y, B => MX2_0_Y, S => \ADDRB_FF2[1]\, Y
         => RD(2));
    
    MX2_7 : MX2
      port map(A => \QX_TEMPR2[7]\, B => \QX_TEMPR3[7]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_7_Y);
    
    MX2_15 : MX2
      port map(A => \QX_TEMPR2[5]\, B => \QX_TEMPR3[5]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_15_Y);
    
    \ORA_READ_EN_GATE[3]\ : OR2A
      port map(A => WEAP, B => \ENABLE_ADDRA[3]\, Y => 
        \READA_EN[3]\);
    
    \ORA_READ_EN_GATE[0]\ : OR2A
      port map(A => WEAP, B => \ENABLE_ADDRA[0]\, Y => 
        \READA_EN[0]\);
    
    code_ram_16kb_R0C2 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(2), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[0]\, BLKB => \BLKB_EN[0]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR0[2]\);
    
    \ORA_GATE[0]\ : OR2
      port map(A => \ENABLE_ADDRA[0]\, B => WEAP, Y => 
        \BLKA_EN[0]\);
    
    code_ram_16kb_R1C5 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(5), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[1]\, BLKB => \BLKB_EN[1]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR1[5]\);
    
    \AFF1[1]\ : DFN1E1C0
      port map(D => WADDR(13), CLK => RWCLK, CLR => \VCC\, E => 
        \READA_EN[1]\, Q => \ADDRA_FF2[1]\);
    
    \OR2_ENABLE_ADDRA[0]\ : OR2
      port map(A => WADDR(13), B => WADDR(12), Y => 
        \ENABLE_ADDRA[0]\);
    
    \ORA_READ_EN_GATE[2]\ : OR2A
      port map(A => WEAP, B => \ENABLE_ADDRA[2]\, Y => 
        \READA_EN[2]\);
    
    \ORB_GATE[2]\ : OR2
      port map(A => \ENABLE_ADDRB[2]\, B => WEBP, Y => 
        \BLKB_EN[2]\);
    
    code_ram_16kb_R1C1 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(1), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[1]\, BLKB => \BLKB_EN[1]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR1[1]\);
    
    \ORB_GATE[3]\ : OR2
      port map(A => \ENABLE_ADDRB[3]\, B => WEBP, Y => 
        \BLKB_EN[3]\);
    
    \MX2_RD[4]\ : MX2
      port map(A => MX2_9_Y, B => MX2_2_Y, S => \ADDRB_FF2[1]\, Y
         => RD(4));
    
    code_ram_16kb_R3C6 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(6), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[3]\, BLKB => \BLKB_EN[3]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR3[6]\);
    
    code_ram_16kb_R1C2 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(2), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[1]\, BLKB => \BLKB_EN[1]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR1[2]\);
    
    MX2_2 : MX2
      port map(A => \QX_TEMPR2[4]\, B => \QX_TEMPR3[4]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_2_Y);
    
    code_ram_16kb_R2C4 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(4), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[2]\, BLKB => \BLKB_EN[2]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR2[4]\);
    
    code_ram_16kb_R2C7 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(7), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[2]\, BLKB => \BLKB_EN[2]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR2[7]\);
    
    \ORB_GATE[1]\ : OR2
      port map(A => \ENABLE_ADDRB[1]\, B => WEBP, Y => 
        \BLKB_EN[1]\);
    
    code_ram_16kb_R2C1 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(1), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[2]\, BLKB => \BLKB_EN[2]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR2[1]\);
    
    MX2_1 : MX2
      port map(A => \QX_TEMPR2[6]\, B => \QX_TEMPR3[6]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_1_Y);
    
    \ORA_READ_EN_GATE[1]\ : OR2A
      port map(A => WEAP, B => \ENABLE_ADDRA[1]\, Y => 
        \READA_EN[1]\);
    
    WEBUBBLEA : INV
      port map(A => WEN, Y => WEAP);
    
    \ORA_GATE[2]\ : OR2
      port map(A => \ENABLE_ADDRA[2]\, B => WEAP, Y => 
        \BLKA_EN[2]\);
    
    \NAND2_ENABLE_ADDRB[3]\ : NAND2
      port map(A => RADDR(13), B => RADDR(12), Y => 
        \ENABLE_ADDRB[3]\);
    
    code_ram_16kb_R3C1 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(1), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[3]\, BLKB => \BLKB_EN[3]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR3[1]\);
    
    \ORA_GATE[3]\ : OR2
      port map(A => \ENABLE_ADDRA[3]\, B => WEAP, Y => 
        \BLKA_EN[3]\);
    
    \ORB_READ_EN_GATE[3]\ : OR2A
      port map(A => WEBP, B => \ENABLE_ADDRB[3]\, Y => 
        \READB_EN[3]\);
    
    \ORB_READ_EN_GATE[0]\ : OR2A
      port map(A => WEBP, B => \ENABLE_ADDRB[0]\, Y => 
        \READB_EN[0]\);
    
    MX2_0 : MX2
      port map(A => \QX_TEMPR2[2]\, B => \QX_TEMPR3[2]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_0_Y);
    
    code_ram_16kb_R0C4 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(4), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[0]\, BLKB => \BLKB_EN[0]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR0[4]\);
    
    code_ram_16kb_R2C0 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(0), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[2]\, BLKB => \BLKB_EN[2]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR2[0]\);
    
    \ORB_READ_EN_GATE[2]\ : OR2A
      port map(A => WEBP, B => \ENABLE_ADDRB[2]\, Y => 
        \READB_EN[2]\);
    
    \OR2_ENABLE_ADDRB[0]\ : OR2
      port map(A => RADDR(13), B => RADDR(12), Y => 
        \ENABLE_ADDRB[0]\);
    
    code_ram_16kb_R3C7 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(7), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[3]\, BLKB => \BLKB_EN[3]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR3[7]\);
    
    code_ram_16kb_R1C0 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(0), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[1]\, BLKB => \BLKB_EN[1]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR1[0]\);
    
    code_ram_16kb_R0C3 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(3), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[0]\, BLKB => \BLKB_EN[0]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR0[3]\);
    
    code_ram_16kb_R0C7 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(7), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[0]\, BLKB => \BLKB_EN[0]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR0[7]\);
    
    \MX2_RD[7]\ : MX2
      port map(A => MX2_12_Y, B => MX2_7_Y, S => \ADDRB_FF2[1]\, 
        Y => RD(7));
    
    \ORA_GATE[1]\ : OR2
      port map(A => \ENABLE_ADDRA[1]\, B => WEAP, Y => 
        \BLKA_EN[1]\);
    
    MX2_5 : MX2
      port map(A => \QX_TEMPR0[5]\, B => \QX_TEMPR1[5]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_5_Y);
    
    code_ram_16kb_R3C5 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(5), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[3]\, BLKB => \BLKB_EN[3]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR3[5]\);
    
    MX2_14 : MX2
      port map(A => \QX_TEMPR2[1]\, B => \QX_TEMPR3[1]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_14_Y);
    
    MX2_9 : MX2
      port map(A => \QX_TEMPR0[4]\, B => \QX_TEMPR1[4]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_9_Y);
    
    code_ram_16kb_R3C0 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(0), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[3]\, BLKB => \BLKB_EN[3]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR3[0]\);
    
    code_ram_16kb_R0C1 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(1), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[0]\, BLKB => \BLKB_EN[0]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR0[1]\);
    
    MX2_4 : MX2
      port map(A => \QX_TEMPR0[1]\, B => \QX_TEMPR1[1]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_4_Y);
    
    \OR2A_ENABLE_ADDRA[2]\ : OR2A
      port map(A => WADDR(13), B => WADDR(12), Y => 
        \ENABLE_ADDRA[2]\);
    
    \NAND2_ENABLE_ADDRA[3]\ : NAND2
      port map(A => WADDR(13), B => WADDR(12), Y => 
        \ENABLE_ADDRA[3]\);
    
    \MX2_RD[0]\ : MX2
      port map(A => MX2_13_Y, B => MX2_10_Y, S => \ADDRB_FF2[1]\, 
        Y => RD(0));
    
    code_ram_16kb_R2C2 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(2), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[2]\, BLKB => \BLKB_EN[2]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR2[2]\);
    
    \ORB_READ_EN_GATE[1]\ : OR2A
      port map(A => WEBP, B => \ENABLE_ADDRB[1]\, Y => 
        \READB_EN[1]\);
    
    WEBUBBLEB : INV
      port map(A => REN, Y => WEBP);
    
    \OR2A_ENABLE_ADDRB[2]\ : OR2A
      port map(A => RADDR(13), B => RADDR(12), Y => 
        \ENABLE_ADDRB[2]\);
    
    code_ram_16kb_R2C5 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(5), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[2]\, BLKB => \BLKB_EN[2]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR2[5]\);
    
    code_ram_16kb_R1C7 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(7), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[1]\, BLKB => \BLKB_EN[1]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR1[7]\);
    
    \BFF1[0]\ : DFN1E1C0
      port map(D => RADDR(12), CLK => RWCLK, CLR => \VCC\, E => 
        \READB_EN[0]\, Q => \ADDRB_FF2[0]\);
    
    code_ram_16kb_R1C3 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(3), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[1]\, BLKB => \BLKB_EN[1]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR1[3]\);
    
    \MX2_RD[6]\ : MX2
      port map(A => MX2_8_Y, B => MX2_1_Y, S => \ADDRB_FF2[1]\, Y
         => RD(6));
    
    \OR2A_ENABLE_ADDRA[1]\ : OR2A
      port map(A => WADDR(12), B => WADDR(13), Y => 
        \ENABLE_ADDRA[1]\);
    
    code_ram_16kb_R0C0 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(0), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[0]\, BLKB => \BLKB_EN[0]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR0[0]\);
    
    code_ram_16kb_R1C4 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(4), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[1]\, BLKB => \BLKB_EN[1]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR1[4]\);
    
    MX2_6 : MX2
      port map(A => \QX_TEMPR0[2]\, B => \QX_TEMPR1[2]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_6_Y);
    
    code_ram_16kb_R0C5 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(5), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[0]\, BLKB => \BLKB_EN[0]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR0[5]\);
    
    \BFF1[1]\ : DFN1E1C0
      port map(D => RADDR(13), CLK => RWCLK, CLR => \VCC\, E => 
        \READB_EN[1]\, Q => \ADDRB_FF2[1]\);
    
    code_ram_16kb_R3C3 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(3), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[3]\, BLKB => \BLKB_EN[3]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR3[3]\);
    
    code_ram_16kb_R0C6 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(6), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[0]\, BLKB => \BLKB_EN[0]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR0[6]\);
    
    code_ram_16kb_R2C6 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(6), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[2]\, BLKB => \BLKB_EN[2]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR2[6]\);
    
    \ORB_GATE[0]\ : OR2
      port map(A => \ENABLE_ADDRB[0]\, B => WEBP, Y => 
        \BLKB_EN[0]\);
    
    MX2_13 : MX2
      port map(A => \QX_TEMPR0[0]\, B => \QX_TEMPR1[0]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_13_Y);
    
    code_ram_16kb_R3C4 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(4), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[3]\, BLKB => \BLKB_EN[3]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR3[4]\);
    
    \MX2_RD[3]\ : MX2
      port map(A => MX2_11_Y, B => MX2_3_Y, S => \ADDRB_FF2[1]\, 
        Y => RD(3));
    
    code_ram_16kb_R1C6 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(6), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[1]\, BLKB => \BLKB_EN[1]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR1[6]\);
    
    \OR2A_ENABLE_ADDRB[1]\ : OR2A
      port map(A => RADDR(12), B => RADDR(13), Y => 
        \ENABLE_ADDRB[1]\);
    
    code_ram_16kb_R3C2 : RAM4K9
      port map(ADDRA11 => WADDR(11), ADDRA10 => WADDR(10), ADDRA9
         => WADDR(9), ADDRA8 => WADDR(8), ADDRA7 => WADDR(7), 
        ADDRA6 => WADDR(6), ADDRA5 => WADDR(5), ADDRA4 => 
        WADDR(4), ADDRA3 => WADDR(3), ADDRA2 => WADDR(2), ADDRA1
         => WADDR(1), ADDRA0 => WADDR(0), ADDRB11 => RADDR(11), 
        ADDRB10 => RADDR(10), ADDRB9 => RADDR(9), ADDRB8 => 
        RADDR(8), ADDRB7 => RADDR(7), ADDRB6 => RADDR(6), ADDRB5
         => RADDR(5), ADDRB4 => RADDR(4), ADDRB3 => RADDR(3), 
        ADDRB2 => RADDR(2), ADDRB1 => RADDR(1), ADDRB0 => 
        RADDR(0), DINA8 => \GND\, DINA7 => \GND\, DINA6 => \GND\, 
        DINA5 => \GND\, DINA4 => \GND\, DINA3 => \GND\, DINA2 => 
        \GND\, DINA1 => \GND\, DINA0 => WD(2), DINB8 => \GND\, 
        DINB7 => \GND\, DINB6 => \GND\, DINB5 => \GND\, DINB4 => 
        \GND\, DINB3 => \GND\, DINB2 => \GND\, DINB1 => \GND\, 
        DINB0 => \GND\, WIDTHA0 => \GND\, WIDTHA1 => \GND\, 
        WIDTHB0 => \GND\, WIDTHB1 => \GND\, PIPEA => \GND\, PIPEB
         => \GND\, WMODEA => \GND\, WMODEB => \GND\, BLKA => 
        \BLKA_EN[3]\, BLKB => \BLKB_EN[3]\, WENA => \GND\, WENB
         => \VCC\, CLKA => RWCLK, CLKB => RWCLK, RESET => \VCC\, 
        DOUTA8 => OPEN, DOUTA7 => OPEN, DOUTA6 => OPEN, DOUTA5
         => OPEN, DOUTA4 => OPEN, DOUTA3 => OPEN, DOUTA2 => OPEN, 
        DOUTA1 => OPEN, DOUTA0 => OPEN, DOUTB8 => OPEN, DOUTB7
         => OPEN, DOUTB6 => OPEN, DOUTB5 => OPEN, DOUTB4 => OPEN, 
        DOUTB3 => OPEN, DOUTB2 => OPEN, DOUTB1 => OPEN, DOUTB0
         => \QX_TEMPR3[2]\);
    
    \MX2_RD[1]\ : MX2
      port map(A => MX2_4_Y, B => MX2_14_Y, S => \ADDRB_FF2[1]\, 
        Y => RD(1));
    
    MX2_3 : MX2
      port map(A => \QX_TEMPR2[3]\, B => \QX_TEMPR3[3]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_3_Y);
    
    MX2_8 : MX2
      port map(A => \QX_TEMPR0[6]\, B => \QX_TEMPR1[6]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_8_Y);
    
    \AFF1[0]\ : DFN1E1C0
      port map(D => WADDR(12), CLK => RWCLK, CLR => \VCC\, E => 
        \READA_EN[0]\, Q => \ADDRA_FF2[0]\);
    
    MX2_11 : MX2
      port map(A => \QX_TEMPR0[3]\, B => \QX_TEMPR1[3]\, S => 
        \ADDRB_FF2[0]\, Y => MX2_11_Y);
    
    GND_power_inst1 : GND
      port map( Y => GND_power_net1);

    VCC_power_inst1 : VCC
      port map( Y => VCC_power_net1);


end DEF_ARCH; 

-- _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


-- _GEN_File_Contents_

-- Version:11.5.2.6
-- ACTGENU_CALL:1
-- BATCH:T
-- FAM:PA3
-- OUTFORMAT:VHDL
-- LPMTYPE:LPM_RAM
-- LPM_HINT:TWO
-- INSERT_PAD:NO
-- INSERT_IOREG:NO
-- GEN_BHV_VHDL_VAL:F
-- GEN_BHV_VERILOG_VAL:F
-- MGNTIMER:F
-- MGNCMPL:T
-- DESDIR:C:/Microsemi/Libero_v11.5/projects/vmed/extMEM/smartgen\code_ram_16kb
-- GEN_BEHV_MODULE:F
-- SMARTGEN_DIE:IT10X10M3
-- SMARTGEN_PACKAGE:pq208
-- AGENIII_IS_SUBPROJECT_LIBERO:T
-- WWIDTH:8
-- WDEPTH:16384
-- RWIDTH:8
-- RDEPTH:16384
-- CLKS:1
-- CLOCK_PN:RWCLK
-- RESET_POLARITY:2
-- INIT_RAM:F
-- DEFAULT_WORD:0x00
-- CASCADE:0
-- WCLK_EDGE:RISE
-- PMODE2:0
-- DATA_IN_PN:WD
-- WADDRESS_PN:WADDR
-- WE_PN:WEN
-- DATA_OUT_PN:RD
-- RADDRESS_PN:RADDR
-- RE_PN:REN
-- WE_POLARITY:1
-- RE_POLARITY:1
-- PTYPE:1

-- _End_Comments_

