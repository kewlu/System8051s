----------------------------------------------------------------------
-- Created by SmartDesign Thu May 11 13:22:17 2017
-- Version: v11.5 SP2 11.5.2.6
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library proasic3e;
use proasic3e.all;
library CORE8051S_LIB;
use CORE8051S_LIB.all;
library COREAPB3_LIB;
use COREAPB3_LIB.all;
use COREAPB3_LIB.components.all;
library COREGPIO_LIB;
use COREGPIO_LIB.all;
use COREGPIO_LIB.components.all;
library CORETIMER_LIB;
use CORETIMER_LIB.all;
----------------------------------------------------------------------
-- system8051s entity declaration
----------------------------------------------------------------------
entity system8051s is
    -- Port list
    port(
        -- Inputs
        CLKA     : in  std_logic;
        SYSRESET : in  std_logic;
        TCK      : in  std_logic;
        TDI      : in  std_logic;
        TMS      : in  std_logic;
        TRSTN    : in  std_logic;
        nIMP     : in  std_logic;
        pIMP     : in  std_logic;
        -- Outputs
        GLA      : out std_logic;
        GPIO_OUT : out std_logic_vector(31 downto 0);
        Mmp      : out std_logic;
        Mpp      : out std_logic;
        TDO      : out std_logic;
        count    : out std_logic_vector(2 downto 0);
        nfilter  : out std_logic;
        pfilter  : out std_logic
        );
end system8051s;
----------------------------------------------------------------------
-- system8051s architecture body
----------------------------------------------------------------------
architecture RTL of system8051s is
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
-- CLKGEN
component CLKGEN
    -- Port list
    port(
        -- Inputs
        CLKA      : in  std_logic;
        POWERDOWN : in  std_logic;
        -- Outputs
        GLA       : out std_logic;
        GLB       : out std_logic;
        LOCK      : out std_logic
        );
end component;
-- code_ram_16kb
component code_ram_16kb
    -- Port list
    port(
        -- Inputs
        RADDR : in  std_logic_vector(13 downto 0);
        REN   : in  std_logic;
        RWCLK : in  std_logic;
        WADDR : in  std_logic_vector(13 downto 0);
        WD    : in  std_logic_vector(7 downto 0);
        WEN   : in  std_logic;
        -- Outputs
        RD    : out std_logic_vector(7 downto 0)
        );
end component;
-- CORE8051S   -   Actel:DirectCore:CORE8051S:2.4.101
component CORE8051S
    generic( 
        APB_DWIDTH            : integer := 32 ;
        DEBUG                 : integer := 2 ;
        EN_FF_OPTS            : integer := 0 ;
        FAMILY                : integer := 16 ;
        INCL_DPTR1            : integer := 0 ;
        INCL_MUL_DIV_DA       : integer := 1 ;
        INCL_TRACE            : integer := 0 ;
        INTRAM_IMPLEMENTATION : integer := 0 ;
        STRETCH_VAL           : integer := 2 ;
        TRIG_NUM              : integer := 4 ;
        VARIABLE_STRETCH      : integer := 0 ;
        VARIABLE_WAIT         : integer := 0 ;
        WAIT_VAL              : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        BREAKIN    : in  std_logic;
        CLK        : in  std_logic;
        INT0       : in  std_logic;
        INT1       : in  std_logic;
        MEMACKI    : in  std_logic;
        MEMBANK    : in  std_logic_vector(3 downto 0);
        MEMDATAI   : in  std_logic_vector(7 downto 0);
        MEMPSACKI  : in  std_logic;
        NSYSRESET  : in  std_logic;
        PRDATA     : in  std_logic_vector(31 downto 0);
        PREADY     : in  std_logic;
        PSLVERR    : in  std_logic;
        TCK        : in  std_logic;
        TDI        : in  std_logic;
        TMS        : in  std_logic;
        TRSTN      : in  std_logic;
        WDOGRES    : in  std_logic;
        -- Outputs
        AUXOUT     : out std_logic;
        BREAKOUT   : out std_logic;
        DBGMEMPSWR : out std_logic;
        MEMADDR    : out std_logic_vector(15 downto 0);
        MEMDATAO   : out std_logic_vector(7 downto 0);
        MEMPSRD    : out std_logic;
        MEMRD      : out std_logic;
        MEMWR      : out std_logic;
        MOVX       : out std_logic;
        PADDR      : out std_logic_vector(11 downto 0);
        PENABLE    : out std_logic;
        PRESETN    : out std_logic;
        PSEL       : out std_logic;
        PWDATA     : out std_logic_vector(31 downto 0);
        PWRITE     : out std_logic;
        TDO        : out std_logic;
        TRIGOUT    : out std_logic;
        WDOGRESN   : out std_logic
        );
end component;
-- CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
-- using entity instantiation for component CoreAPB3
-- CoreGPIO   -   Actel:DirectCore:CoreGPIO:3.1.101
-- using entity instantiation for component CoreGPIO
-- CoreTimer   -   Actel:DirectCore:CoreTimer:2.0.103
component CoreTimer
    generic( 
        FAMILY     : integer := 16 ;
        INTACTIVEH : integer := 1 ;
        WIDTH      : integer := 32 
        );
    -- Port list
    port(
        -- Inputs
        PADDR   : in  std_logic_vector(4 downto 2);
        PCLK    : in  std_logic;
        PENABLE : in  std_logic;
        PRESETn : in  std_logic;
        PSEL    : in  std_logic;
        PWDATA  : in  std_logic_vector(31 downto 0);
        PWRITE  : in  std_logic;
        -- Outputs
        PRDATA  : out std_logic_vector(31 downto 0);
        TIMINT  : out std_logic
        );
end component;
-- data_ram_2kb
component data_ram_2kb
    -- Port list
    port(
        -- Inputs
        RADDR : in  std_logic_vector(10 downto 0);
        REN   : in  std_logic;
        RWCLK : in  std_logic;
        WADDR : in  std_logic_vector(10 downto 0);
        WD    : in  std_logic_vector(7 downto 0);
        WEN   : in  std_logic;
        -- Outputs
        RD    : out std_logic_vector(7 downto 0)
        );
end component;
-- Driver
component Driver
    -- Port list
    port(
        -- Inputs
        CLK     : in  std_logic;
        Impulse : in  std_logic;
        -- Outputs
        Y       : out std_logic
        );
end component;
-- fdev_1KHz
component fdev_1KHz
    -- Port list
    port(
        -- Inputs
        clk     : in  std_logic;
        nreset  : in  std_logic;
        -- Outputs
        clk_out : out std_logic
        );
end component;
-- MajorityGate
component MajorityGate
    -- Port list
    port(
        -- Inputs
        CLK : in  std_logic;
        IMP : in  std_logic;
        -- Outputs
        Y   : out std_logic
        );
end component;
-- mux_mem
component mux_mem
    -- Port list
    port(
        -- Inputs
        Data0_port : in  std_logic_vector(7 downto 0);
        Data1_port : in  std_logic_vector(7 downto 0);
        Sel0       : in  std_logic;
        -- Outputs
        Result     : out std_logic_vector(7 downto 0)
        );
end component;
-- myRevCount
component myRevCount
    -- Port list
    port(
        -- Inputs
        clk     : in  std_logic;
        nEnable : in  std_logic;
        nreset  : in  std_logic;
        pEnable : in  std_logic;
        -- Outputs
        count   : out std_logic_vector(10 downto 0)
        );
end component;
-- PWM
component PWM
    -- Port list
    port(
        -- Inputs
        clk    : in  std_logic;
        enable : in  std_logic;
        input  : in  std_logic_vector(7 downto 0);
        nreset : in  std_logic;
        -- Outputs
        M      : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AND2A_0_Y                      : std_logic;
signal CLKGEN_0_GLB                   : std_logic;
signal CLKGEN_0_LOCK                  : std_logic;
signal code_ram_16kb_0_RD             : std_logic_vector(7 downto 0);
signal CORE8051S_0_APB3master_PENABLE : std_logic;
signal CORE8051S_0_APB3master_PRDATA  : std_logic_vector(31 downto 0);
signal CORE8051S_0_APB3master_PREADY  : std_logic;
signal CORE8051S_0_APB3master_PSELx   : std_logic;
signal CORE8051S_0_APB3master_PSLVERR : std_logic;
signal CORE8051S_0_APB3master_PWDATA  : std_logic_vector(31 downto 0);
signal CORE8051S_0_APB3master_PWRITE  : std_logic;
signal CORE8051S_0_DBGMEMPSWR         : std_logic;
signal CORE8051S_0_MEMADDR10to0       : std_logic_vector(10 downto 0);
signal CORE8051S_0_MEMADDR13to0       : std_logic_vector(13 downto 0);
signal CORE8051S_0_MEMDATAO           : std_logic_vector(7 downto 0);
signal CORE8051S_0_MEMPSRD            : std_logic;
signal CORE8051S_0_MEMRD              : std_logic;
signal CORE8051S_0_MEMWR              : std_logic;
signal CORE8051S_0_PRESETN            : std_logic;
signal CoreAPB3_0_APBmslave0_PENABLE  : std_logic;
signal CoreAPB3_0_APBmslave0_PRDATA   : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PREADY   : std_logic;
signal CoreAPB3_0_APBmslave0_PSELx    : std_logic;
signal CoreAPB3_0_APBmslave0_PSLVERR  : std_logic;
signal CoreAPB3_0_APBmslave0_PWDATA   : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PWRITE   : std_logic;
signal CoreAPB3_0_APBmslave1_PRDATA   : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave1_PSELx    : std_logic;
signal CoreAPB3_0_APBmslave2_PRDATA   : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave2_PREADY   : std_logic;
signal CoreAPB3_0_APBmslave2_PSELx    : std_logic;
signal CoreAPB3_0_APBmslave2_PSLVERR  : std_logic;
signal CoreGPIO_1_GPIO_OUT7to0        : std_logic_vector(7 downto 0);
signal CoreGPIO_1_GPIO_OUT8to8        : std_logic_vector(8 to 8);
signal CoreGPIO_1_GPIO_OUT9to9        : std_logic_vector(9 to 9);
signal CoreTimer_1_TIMINT             : std_logic;
signal count_net_0                    : std_logic_vector(2 downto 0);
signal data_ram_2kb_0_RD              : std_logic_vector(7 downto 0);
signal Driver_0_Y                     : std_logic;
signal Driver_N_Y                     : std_logic;
signal Driver_P_Y                     : std_logic;
signal fdev_1KHz_0_clk_out            : std_logic;
signal GLA_net_0                      : std_logic;
signal GPIO_OUT_net_0                 : std_logic_vector(31 downto 0);
signal MEMADDR                        : std_logic_vector(15 downto 0);
signal Mmp_net_0                      : std_logic;
signal Mpp_net_0                      : std_logic;
signal mux_mem_0_Result               : std_logic_vector(7 downto 0);
signal myRevCount_0_count             : std_logic_vector(10 downto 0);
signal net_11                         : std_logic;
signal nfilter_net_0                  : std_logic;
signal pfilter_net_0                  : std_logic;
signal PWM_0_M                        : std_logic;
signal TDO_net_0                      : std_logic;
signal TDO_net_1                      : std_logic;
signal GLA_net_1                      : std_logic;
signal pfilter_net_1                  : std_logic;
signal nfilter_net_1                  : std_logic;
signal count_net_1                    : std_logic_vector(2 downto 0);
signal GPIO_OUT_net_1                 : std_logic_vector(31 downto 0);
signal Mmp_net_1                      : std_logic;
signal Mpp_net_1                      : std_logic;
signal MEMADDR_slice_0                : std_logic_vector(15 downto 14);
signal GPIO_IN_net_0                  : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net                        : std_logic;
signal GPIO_IN_const_net_0            : std_logic_vector(31 downto 11);
signal GPIO_IN_const_net_1            : std_logic_vector(31 downto 0);
signal GND_net                        : std_logic;
signal MEMBANK_const_net_0            : std_logic_vector(3 downto 0);
signal IADDR_const_net_0              : std_logic_vector(31 downto 0);
signal PRDATAS3_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS4_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS5_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS6_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS7_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS8_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS9_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS10_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS11_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS12_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS13_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS14_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS15_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS16_const_net_0          : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal CORE8051S_0_APB3master_PADDR   : std_logic_vector(11 downto 0);
signal CORE8051S_0_APB3master_PADDR_0_31to12: std_logic_vector(31 downto 12);
signal CORE8051S_0_APB3master_PADDR_0_11to0: std_logic_vector(11 downto 0);
signal CORE8051S_0_APB3master_PADDR_0 : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave0_PADDR_1_4to2: std_logic_vector(4 downto 2);
signal CoreAPB3_0_APBmslave0_PADDR_1  : std_logic_vector(4 downto 2);
signal CoreAPB3_0_APBmslave0_PADDR_0_7to0: std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_0  : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR    : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_2_7to0: std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_2  : std_logic_vector(7 downto 0);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net               <= '1';
 GPIO_IN_const_net_0   <= B"000000000000000000000";
 GPIO_IN_const_net_1   <= B"00000000000000000000000000000000";
 GND_net               <= '0';
 MEMBANK_const_net_0   <= B"0000";
 IADDR_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS3_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS4_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS5_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS6_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS7_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS8_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS9_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS10_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS11_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS12_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS13_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS14_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS15_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS16_const_net_0 <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 TDO_net_1             <= TDO_net_0;
 TDO                   <= TDO_net_1;
 GLA_net_1             <= GLA_net_0;
 GLA                   <= GLA_net_1;
 pfilter_net_1         <= pfilter_net_0;
 pfilter               <= pfilter_net_1;
 nfilter_net_1         <= nfilter_net_0;
 nfilter               <= nfilter_net_1;
 count_net_1           <= count_net_0;
 count(2 downto 0)     <= count_net_1;
 GPIO_OUT_net_1        <= GPIO_OUT_net_0;
 GPIO_OUT(31 downto 0) <= GPIO_OUT_net_1;
 Mmp_net_1             <= Mmp_net_0;
 Mmp                   <= Mmp_net_1;
 Mpp_net_1             <= Mpp_net_0;
 Mpp                   <= Mpp_net_1;
----------------------------------------------------------------------
-- Slices assignments
----------------------------------------------------------------------
 CORE8051S_0_MEMADDR10to0   <= MEMADDR(10 downto 0);
 CORE8051S_0_MEMADDR13to0   <= MEMADDR(13 downto 0);
 CoreGPIO_1_GPIO_OUT7to0    <= GPIO_OUT_net_0(7 downto 0);
 CoreGPIO_1_GPIO_OUT8to8(8) <= GPIO_OUT_net_0(8);
 CoreGPIO_1_GPIO_OUT9to9(9) <= GPIO_OUT_net_0(9);
 count_net_0                <= myRevCount_0_count(2 downto 0);
 MEMADDR_slice_0            <= MEMADDR(15 downto 14);
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 GPIO_IN_net_0 <= ( B"000000000000000000000" & myRevCount_0_count );
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 CORE8051S_0_APB3master_PADDR_0_31to12(31 downto 12) <= B"00000000000000000000";
 CORE8051S_0_APB3master_PADDR_0_11to0(11 downto 0) <= CORE8051S_0_APB3master_PADDR(11 downto 0);
 CORE8051S_0_APB3master_PADDR_0 <= ( CORE8051S_0_APB3master_PADDR_0_31to12(31 downto 12) & CORE8051S_0_APB3master_PADDR_0_11to0(11 downto 0) );

 CoreAPB3_0_APBmslave0_PADDR_1_4to2(4 downto 2) <= CoreAPB3_0_APBmslave0_PADDR(4 downto 2);
 CoreAPB3_0_APBmslave0_PADDR_1 <= ( CoreAPB3_0_APBmslave0_PADDR_1_4to2(4 downto 2) );
 CoreAPB3_0_APBmslave0_PADDR_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(7 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_0 <= ( CoreAPB3_0_APBmslave0_PADDR_0_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_2_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(7 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_2 <= ( CoreAPB3_0_APBmslave0_PADDR_2_7to0(7 downto 0) );

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AND2_0
AND2_0 : AND2
    port map( 
        -- Inputs
        A => CoreGPIO_1_GPIO_OUT8to8(8),
        B => PWM_0_M,
        -- Outputs
        Y => Mpp_net_0 
        );
-- AND2A_0
AND2A_0 : AND2A
    port map( 
        -- Inputs
        A => SYSRESET,
        B => CLKGEN_0_LOCK,
        -- Outputs
        Y => AND2A_0_Y 
        );
-- AND2A_1
AND2A_1 : AND2A
    port map( 
        -- Inputs
        A => CoreGPIO_1_GPIO_OUT8to8(8),
        B => PWM_0_M,
        -- Outputs
        Y => Mmp_net_0 
        );
-- CLKGEN_0
CLKGEN_0 : CLKGEN
    port map( 
        -- Inputs
        POWERDOWN => VCC_net,
        CLKA      => CLKA,
        -- Outputs
        LOCK      => CLKGEN_0_LOCK,
        GLA       => GLA_net_0,
        GLB       => CLKGEN_0_GLB 
        );
-- code_ram_16kb_0
code_ram_16kb_0 : code_ram_16kb
    port map( 
        -- Inputs
        WEN   => CORE8051S_0_DBGMEMPSWR,
        REN   => CORE8051S_0_MEMPSRD,
        RWCLK => GLA_net_0,
        WD    => CORE8051S_0_MEMDATAO,
        WADDR => CORE8051S_0_MEMADDR13to0,
        RADDR => CORE8051S_0_MEMADDR13to0,
        -- Outputs
        RD    => code_ram_16kb_0_RD 
        );
-- CORE8051S_0   -   Actel:DirectCore:CORE8051S:2.4.101
CORE8051S_0 : CORE8051S
    generic map( 
        APB_DWIDTH            => ( 32 ),
        DEBUG                 => ( 2 ),
        EN_FF_OPTS            => ( 0 ),
        FAMILY                => ( 16 ),
        INCL_DPTR1            => ( 0 ),
        INCL_MUL_DIV_DA       => ( 1 ),
        INCL_TRACE            => ( 0 ),
        INTRAM_IMPLEMENTATION => ( 0 ),
        STRETCH_VAL           => ( 2 ),
        TRIG_NUM              => ( 4 ),
        VARIABLE_STRETCH      => ( 0 ),
        VARIABLE_WAIT         => ( 0 ),
        WAIT_VAL              => ( 1 )
        )
    port map( 
        -- Inputs
        CLK        => GLA_net_0,
        NSYSRESET  => AND2A_0_Y,
        WDOGRES    => GND_net, -- tied to '0' from definition
        INT0       => net_11,
        INT1       => CoreTimer_1_TIMINT,
        PREADY     => CORE8051S_0_APB3master_PREADY,
        PSLVERR    => CORE8051S_0_APB3master_PSLVERR,
        MEMPSACKI  => VCC_net, -- tied to '1' from definition
        MEMACKI    => VCC_net, -- tied to '1' from definition
        TCK        => TCK,
        TMS        => TMS,
        TDI        => TDI,
        TRSTN      => TRSTN,
        BREAKIN    => GND_net, -- tied to '0' from definition
        PRDATA     => CORE8051S_0_APB3master_PRDATA,
        MEMDATAI   => mux_mem_0_Result,
        MEMBANK    => MEMBANK_const_net_0, -- tied to X"0" from definition
        -- Outputs
        PRESETN    => CORE8051S_0_PRESETN,
        WDOGRESN   => OPEN,
        MOVX       => OPEN,
        PWRITE     => CORE8051S_0_APB3master_PWRITE,
        PENABLE    => CORE8051S_0_APB3master_PENABLE,
        PSEL       => CORE8051S_0_APB3master_PSELx,
        MEMPSRD    => CORE8051S_0_MEMPSRD,
        MEMWR      => CORE8051S_0_MEMWR,
        MEMRD      => CORE8051S_0_MEMRD,
        TDO        => TDO_net_0,
        BREAKOUT   => OPEN,
        DBGMEMPSWR => CORE8051S_0_DBGMEMPSWR,
        TRIGOUT    => OPEN,
        AUXOUT     => OPEN,
        PADDR      => CORE8051S_0_APB3master_PADDR,
        PWDATA     => CORE8051S_0_APB3master_PWDATA,
        MEMDATAO   => CORE8051S_0_MEMDATAO,
        MEMADDR    => MEMADDR 
        );
-- CoreAPB3_0   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3_0 : entity COREAPB3_LIB.CoreAPB3
    generic map( 
        APB_DWIDTH      => ( 32 ),
        APBSLOT0ENABLE  => ( 1 ),
        APBSLOT1ENABLE  => ( 1 ),
        APBSLOT2ENABLE  => ( 1 ),
        APBSLOT3ENABLE  => ( 0 ),
        APBSLOT4ENABLE  => ( 0 ),
        APBSLOT5ENABLE  => ( 0 ),
        APBSLOT6ENABLE  => ( 0 ),
        APBSLOT7ENABLE  => ( 0 ),
        APBSLOT8ENABLE  => ( 0 ),
        APBSLOT9ENABLE  => ( 0 ),
        APBSLOT10ENABLE => ( 0 ),
        APBSLOT11ENABLE => ( 0 ),
        APBSLOT12ENABLE => ( 0 ),
        APBSLOT13ENABLE => ( 0 ),
        APBSLOT14ENABLE => ( 0 ),
        APBSLOT15ENABLE => ( 0 ),
        FAMILY          => ( 16 ),
        IADDR_OPTION    => ( 0 ),
        MADDR_BITS      => ( 12 ),
        SC_0            => ( 0 ),
        SC_1            => ( 0 ),
        SC_2            => ( 0 ),
        SC_3            => ( 0 ),
        SC_4            => ( 0 ),
        SC_5            => ( 0 ),
        SC_6            => ( 0 ),
        SC_7            => ( 0 ),
        SC_8            => ( 0 ),
        SC_9            => ( 0 ),
        SC_10           => ( 0 ),
        SC_11           => ( 0 ),
        SC_12           => ( 0 ),
        SC_13           => ( 0 ),
        SC_14           => ( 0 ),
        SC_15           => ( 0 ),
        UPR_NIBBLE_POSN => ( 2 )
        )
    port map( 
        -- Inputs
        PRESETN    => GND_net, -- tied to '0' from definition
        PCLK       => GND_net, -- tied to '0' from definition
        PWRITE     => CORE8051S_0_APB3master_PWRITE,
        PENABLE    => CORE8051S_0_APB3master_PENABLE,
        PSEL       => CORE8051S_0_APB3master_PSELx,
        PREADYS0   => CoreAPB3_0_APBmslave0_PREADY,
        PSLVERRS0  => CoreAPB3_0_APBmslave0_PSLVERR,
        PREADYS1   => VCC_net, -- tied to '1' from definition
        PSLVERRS1  => GND_net, -- tied to '0' from definition
        PREADYS2   => CoreAPB3_0_APBmslave2_PREADY,
        PSLVERRS2  => CoreAPB3_0_APBmslave2_PSLVERR,
        PREADYS3   => VCC_net, -- tied to '1' from definition
        PSLVERRS3  => GND_net, -- tied to '0' from definition
        PREADYS4   => VCC_net, -- tied to '1' from definition
        PSLVERRS4  => GND_net, -- tied to '0' from definition
        PREADYS5   => VCC_net, -- tied to '1' from definition
        PSLVERRS5  => GND_net, -- tied to '0' from definition
        PREADYS6   => VCC_net, -- tied to '1' from definition
        PSLVERRS6  => GND_net, -- tied to '0' from definition
        PREADYS7   => VCC_net, -- tied to '1' from definition
        PSLVERRS7  => GND_net, -- tied to '0' from definition
        PREADYS8   => VCC_net, -- tied to '1' from definition
        PSLVERRS8  => GND_net, -- tied to '0' from definition
        PREADYS9   => VCC_net, -- tied to '1' from definition
        PSLVERRS9  => GND_net, -- tied to '0' from definition
        PREADYS10  => VCC_net, -- tied to '1' from definition
        PSLVERRS10 => GND_net, -- tied to '0' from definition
        PREADYS11  => VCC_net, -- tied to '1' from definition
        PSLVERRS11 => GND_net, -- tied to '0' from definition
        PREADYS12  => VCC_net, -- tied to '1' from definition
        PSLVERRS12 => GND_net, -- tied to '0' from definition
        PREADYS13  => VCC_net, -- tied to '1' from definition
        PSLVERRS13 => GND_net, -- tied to '0' from definition
        PREADYS14  => VCC_net, -- tied to '1' from definition
        PSLVERRS14 => GND_net, -- tied to '0' from definition
        PREADYS15  => VCC_net, -- tied to '1' from definition
        PSLVERRS15 => GND_net, -- tied to '0' from definition
        PREADYS16  => VCC_net, -- tied to '1' from definition
        PSLVERRS16 => GND_net, -- tied to '0' from definition
        PADDR      => CORE8051S_0_APB3master_PADDR_0,
        PWDATA     => CORE8051S_0_APB3master_PWDATA,
        PRDATAS0   => CoreAPB3_0_APBmslave0_PRDATA,
        PRDATAS1   => CoreAPB3_0_APBmslave1_PRDATA,
        PRDATAS2   => CoreAPB3_0_APBmslave2_PRDATA,
        PRDATAS3   => PRDATAS3_const_net_0, -- tied to X"0" from definition
        PRDATAS4   => PRDATAS4_const_net_0, -- tied to X"0" from definition
        PRDATAS5   => PRDATAS5_const_net_0, -- tied to X"0" from definition
        PRDATAS6   => PRDATAS6_const_net_0, -- tied to X"0" from definition
        PRDATAS7   => PRDATAS7_const_net_0, -- tied to X"0" from definition
        PRDATAS8   => PRDATAS8_const_net_0, -- tied to X"0" from definition
        PRDATAS9   => PRDATAS9_const_net_0, -- tied to X"0" from definition
        PRDATAS10  => PRDATAS10_const_net_0, -- tied to X"0" from definition
        PRDATAS11  => PRDATAS11_const_net_0, -- tied to X"0" from definition
        PRDATAS12  => PRDATAS12_const_net_0, -- tied to X"0" from definition
        PRDATAS13  => PRDATAS13_const_net_0, -- tied to X"0" from definition
        PRDATAS14  => PRDATAS14_const_net_0, -- tied to X"0" from definition
        PRDATAS15  => PRDATAS15_const_net_0, -- tied to X"0" from definition
        PRDATAS16  => PRDATAS16_const_net_0, -- tied to X"0" from definition
        IADDR      => IADDR_const_net_0, -- tied to X"0" from definition
        -- Outputs
        PREADY     => CORE8051S_0_APB3master_PREADY,
        PSLVERR    => CORE8051S_0_APB3master_PSLVERR,
        PWRITES    => CoreAPB3_0_APBmslave0_PWRITE,
        PENABLES   => CoreAPB3_0_APBmslave0_PENABLE,
        PSELS0     => CoreAPB3_0_APBmslave0_PSELx,
        PSELS1     => CoreAPB3_0_APBmslave1_PSELx,
        PSELS2     => CoreAPB3_0_APBmslave2_PSELx,
        PSELS3     => OPEN,
        PSELS4     => OPEN,
        PSELS5     => OPEN,
        PSELS6     => OPEN,
        PSELS7     => OPEN,
        PSELS8     => OPEN,
        PSELS9     => OPEN,
        PSELS10    => OPEN,
        PSELS11    => OPEN,
        PSELS12    => OPEN,
        PSELS13    => OPEN,
        PSELS14    => OPEN,
        PSELS15    => OPEN,
        PSELS16    => OPEN,
        PRDATA     => CORE8051S_0_APB3master_PRDATA,
        PADDRS     => CoreAPB3_0_APBmslave0_PADDR,
        PWDATAS    => CoreAPB3_0_APBmslave0_PWDATA 
        );
-- CoreGPIO_0   -   Actel:DirectCore:CoreGPIO:3.1.101
CoreGPIO_0 : entity COREGPIO_LIB.CoreGPIO
    generic map( 
        APB_WIDTH       => ( 32 ),
        FAMILY          => ( 16 ),
        FIXED_CONFIG_0  => ( 0 ),
        FIXED_CONFIG_1  => ( 0 ),
        FIXED_CONFIG_2  => ( 0 ),
        FIXED_CONFIG_3  => ( 0 ),
        FIXED_CONFIG_4  => ( 0 ),
        FIXED_CONFIG_5  => ( 0 ),
        FIXED_CONFIG_6  => ( 0 ),
        FIXED_CONFIG_7  => ( 0 ),
        FIXED_CONFIG_8  => ( 0 ),
        FIXED_CONFIG_9  => ( 0 ),
        FIXED_CONFIG_10 => ( 0 ),
        FIXED_CONFIG_11 => ( 0 ),
        FIXED_CONFIG_12 => ( 0 ),
        FIXED_CONFIG_13 => ( 0 ),
        FIXED_CONFIG_14 => ( 0 ),
        FIXED_CONFIG_15 => ( 0 ),
        FIXED_CONFIG_16 => ( 0 ),
        FIXED_CONFIG_17 => ( 0 ),
        FIXED_CONFIG_18 => ( 0 ),
        FIXED_CONFIG_19 => ( 0 ),
        FIXED_CONFIG_20 => ( 0 ),
        FIXED_CONFIG_21 => ( 0 ),
        FIXED_CONFIG_22 => ( 0 ),
        FIXED_CONFIG_23 => ( 0 ),
        FIXED_CONFIG_24 => ( 0 ),
        FIXED_CONFIG_25 => ( 0 ),
        FIXED_CONFIG_26 => ( 0 ),
        FIXED_CONFIG_27 => ( 0 ),
        FIXED_CONFIG_28 => ( 0 ),
        FIXED_CONFIG_29 => ( 0 ),
        FIXED_CONFIG_30 => ( 0 ),
        FIXED_CONFIG_31 => ( 0 ),
        INT_BUS         => ( 0 ),
        IO_INT_TYPE_0   => ( 7 ),
        IO_INT_TYPE_1   => ( 7 ),
        IO_INT_TYPE_2   => ( 7 ),
        IO_INT_TYPE_3   => ( 7 ),
        IO_INT_TYPE_4   => ( 7 ),
        IO_INT_TYPE_5   => ( 7 ),
        IO_INT_TYPE_6   => ( 7 ),
        IO_INT_TYPE_7   => ( 7 ),
        IO_INT_TYPE_8   => ( 7 ),
        IO_INT_TYPE_9   => ( 7 ),
        IO_INT_TYPE_10  => ( 7 ),
        IO_INT_TYPE_11  => ( 7 ),
        IO_INT_TYPE_12  => ( 7 ),
        IO_INT_TYPE_13  => ( 7 ),
        IO_INT_TYPE_14  => ( 7 ),
        IO_INT_TYPE_15  => ( 7 ),
        IO_INT_TYPE_16  => ( 7 ),
        IO_INT_TYPE_17  => ( 7 ),
        IO_INT_TYPE_18  => ( 7 ),
        IO_INT_TYPE_19  => ( 7 ),
        IO_INT_TYPE_20  => ( 7 ),
        IO_INT_TYPE_21  => ( 7 ),
        IO_INT_TYPE_22  => ( 7 ),
        IO_INT_TYPE_23  => ( 7 ),
        IO_INT_TYPE_24  => ( 7 ),
        IO_INT_TYPE_25  => ( 7 ),
        IO_INT_TYPE_26  => ( 7 ),
        IO_INT_TYPE_27  => ( 7 ),
        IO_INT_TYPE_28  => ( 7 ),
        IO_INT_TYPE_29  => ( 7 ),
        IO_INT_TYPE_30  => ( 7 ),
        IO_INT_TYPE_31  => ( 7 ),
        IO_NUM          => ( 32 ),
        IO_TYPE_0       => ( 2 ),
        IO_TYPE_1       => ( 2 ),
        IO_TYPE_2       => ( 2 ),
        IO_TYPE_3       => ( 0 ),
        IO_TYPE_4       => ( 0 ),
        IO_TYPE_5       => ( 0 ),
        IO_TYPE_6       => ( 0 ),
        IO_TYPE_7       => ( 0 ),
        IO_TYPE_8       => ( 0 ),
        IO_TYPE_9       => ( 0 ),
        IO_TYPE_10      => ( 0 ),
        IO_TYPE_11      => ( 0 ),
        IO_TYPE_12      => ( 0 ),
        IO_TYPE_13      => ( 0 ),
        IO_TYPE_14      => ( 0 ),
        IO_TYPE_15      => ( 0 ),
        IO_TYPE_16      => ( 0 ),
        IO_TYPE_17      => ( 0 ),
        IO_TYPE_18      => ( 0 ),
        IO_TYPE_19      => ( 0 ),
        IO_TYPE_20      => ( 0 ),
        IO_TYPE_21      => ( 0 ),
        IO_TYPE_22      => ( 0 ),
        IO_TYPE_23      => ( 0 ),
        IO_TYPE_24      => ( 0 ),
        IO_TYPE_25      => ( 0 ),
        IO_TYPE_26      => ( 0 ),
        IO_TYPE_27      => ( 0 ),
        IO_TYPE_28      => ( 0 ),
        IO_TYPE_29      => ( 0 ),
        IO_TYPE_30      => ( 0 ),
        IO_TYPE_31      => ( 0 ),
        IO_VAL_0        => ( 0 ),
        IO_VAL_1        => ( 0 ),
        IO_VAL_2        => ( 0 ),
        IO_VAL_3        => ( 0 ),
        IO_VAL_4        => ( 0 ),
        IO_VAL_5        => ( 0 ),
        IO_VAL_6        => ( 0 ),
        IO_VAL_7        => ( 0 ),
        IO_VAL_8        => ( 0 ),
        IO_VAL_9        => ( 0 ),
        IO_VAL_10       => ( 0 ),
        IO_VAL_11       => ( 0 ),
        IO_VAL_12       => ( 0 ),
        IO_VAL_13       => ( 0 ),
        IO_VAL_14       => ( 0 ),
        IO_VAL_15       => ( 0 ),
        IO_VAL_16       => ( 0 ),
        IO_VAL_17       => ( 0 ),
        IO_VAL_18       => ( 0 ),
        IO_VAL_19       => ( 0 ),
        IO_VAL_20       => ( 0 ),
        IO_VAL_21       => ( 0 ),
        IO_VAL_22       => ( 0 ),
        IO_VAL_23       => ( 0 ),
        IO_VAL_24       => ( 0 ),
        IO_VAL_25       => ( 0 ),
        IO_VAL_26       => ( 0 ),
        IO_VAL_27       => ( 0 ),
        IO_VAL_28       => ( 0 ),
        IO_VAL_29       => ( 0 ),
        IO_VAL_30       => ( 0 ),
        IO_VAL_31       => ( 0 ),
        OE_TYPE         => ( 0 )
        )
    port map( 
        -- Inputs
        PRESETN  => CORE8051S_0_PRESETN,
        PCLK     => GLA_net_0,
        PSEL     => CoreAPB3_0_APBmslave0_PSELx,
        PENABLE  => CoreAPB3_0_APBmslave0_PENABLE,
        PWRITE   => CoreAPB3_0_APBmslave0_PWRITE,
        PADDR    => CoreAPB3_0_APBmslave0_PADDR_0,
        PWDATA   => CoreAPB3_0_APBmslave0_PWDATA,
        GPIO_IN  => GPIO_IN_net_0,
        -- Outputs
        PSLVERR  => CoreAPB3_0_APBmslave0_PSLVERR,
        PREADY   => CoreAPB3_0_APBmslave0_PREADY,
        INT_OR   => OPEN,
        PRDATA   => CoreAPB3_0_APBmslave0_PRDATA,
        INT      => OPEN,
        GPIO_OUT => OPEN,
        GPIO_OE  => OPEN 
        );
-- CoreGPIO_1   -   Actel:DirectCore:CoreGPIO:3.1.101
CoreGPIO_1 : entity COREGPIO_LIB.CoreGPIO
    generic map( 
        APB_WIDTH       => ( 32 ),
        FAMILY          => ( 16 ),
        FIXED_CONFIG_0  => ( 1 ),
        FIXED_CONFIG_1  => ( 1 ),
        FIXED_CONFIG_2  => ( 1 ),
        FIXED_CONFIG_3  => ( 1 ),
        FIXED_CONFIG_4  => ( 1 ),
        FIXED_CONFIG_5  => ( 1 ),
        FIXED_CONFIG_6  => ( 1 ),
        FIXED_CONFIG_7  => ( 1 ),
        FIXED_CONFIG_8  => ( 1 ),
        FIXED_CONFIG_9  => ( 1 ),
        FIXED_CONFIG_10 => ( 0 ),
        FIXED_CONFIG_11 => ( 0 ),
        FIXED_CONFIG_12 => ( 0 ),
        FIXED_CONFIG_13 => ( 0 ),
        FIXED_CONFIG_14 => ( 0 ),
        FIXED_CONFIG_15 => ( 0 ),
        FIXED_CONFIG_16 => ( 0 ),
        FIXED_CONFIG_17 => ( 0 ),
        FIXED_CONFIG_18 => ( 0 ),
        FIXED_CONFIG_19 => ( 0 ),
        FIXED_CONFIG_20 => ( 0 ),
        FIXED_CONFIG_21 => ( 0 ),
        FIXED_CONFIG_22 => ( 0 ),
        FIXED_CONFIG_23 => ( 0 ),
        FIXED_CONFIG_24 => ( 0 ),
        FIXED_CONFIG_25 => ( 0 ),
        FIXED_CONFIG_26 => ( 0 ),
        FIXED_CONFIG_27 => ( 0 ),
        FIXED_CONFIG_28 => ( 0 ),
        FIXED_CONFIG_29 => ( 0 ),
        FIXED_CONFIG_30 => ( 0 ),
        FIXED_CONFIG_31 => ( 0 ),
        INT_BUS         => ( 0 ),
        IO_INT_TYPE_0   => ( 7 ),
        IO_INT_TYPE_1   => ( 7 ),
        IO_INT_TYPE_2   => ( 7 ),
        IO_INT_TYPE_3   => ( 7 ),
        IO_INT_TYPE_4   => ( 7 ),
        IO_INT_TYPE_5   => ( 7 ),
        IO_INT_TYPE_6   => ( 7 ),
        IO_INT_TYPE_7   => ( 7 ),
        IO_INT_TYPE_8   => ( 7 ),
        IO_INT_TYPE_9   => ( 7 ),
        IO_INT_TYPE_10  => ( 7 ),
        IO_INT_TYPE_11  => ( 7 ),
        IO_INT_TYPE_12  => ( 7 ),
        IO_INT_TYPE_13  => ( 7 ),
        IO_INT_TYPE_14  => ( 7 ),
        IO_INT_TYPE_15  => ( 7 ),
        IO_INT_TYPE_16  => ( 7 ),
        IO_INT_TYPE_17  => ( 7 ),
        IO_INT_TYPE_18  => ( 7 ),
        IO_INT_TYPE_19  => ( 7 ),
        IO_INT_TYPE_20  => ( 7 ),
        IO_INT_TYPE_21  => ( 7 ),
        IO_INT_TYPE_22  => ( 7 ),
        IO_INT_TYPE_23  => ( 7 ),
        IO_INT_TYPE_24  => ( 7 ),
        IO_INT_TYPE_25  => ( 7 ),
        IO_INT_TYPE_26  => ( 7 ),
        IO_INT_TYPE_27  => ( 7 ),
        IO_INT_TYPE_28  => ( 7 ),
        IO_INT_TYPE_29  => ( 7 ),
        IO_INT_TYPE_30  => ( 7 ),
        IO_INT_TYPE_31  => ( 7 ),
        IO_NUM          => ( 32 ),
        IO_TYPE_0       => ( 1 ),
        IO_TYPE_1       => ( 1 ),
        IO_TYPE_2       => ( 1 ),
        IO_TYPE_3       => ( 1 ),
        IO_TYPE_4       => ( 1 ),
        IO_TYPE_5       => ( 1 ),
        IO_TYPE_6       => ( 1 ),
        IO_TYPE_7       => ( 1 ),
        IO_TYPE_8       => ( 1 ),
        IO_TYPE_9       => ( 1 ),
        IO_TYPE_10      => ( 0 ),
        IO_TYPE_11      => ( 0 ),
        IO_TYPE_12      => ( 0 ),
        IO_TYPE_13      => ( 0 ),
        IO_TYPE_14      => ( 0 ),
        IO_TYPE_15      => ( 0 ),
        IO_TYPE_16      => ( 0 ),
        IO_TYPE_17      => ( 0 ),
        IO_TYPE_18      => ( 0 ),
        IO_TYPE_19      => ( 0 ),
        IO_TYPE_20      => ( 0 ),
        IO_TYPE_21      => ( 0 ),
        IO_TYPE_22      => ( 0 ),
        IO_TYPE_23      => ( 0 ),
        IO_TYPE_24      => ( 0 ),
        IO_TYPE_25      => ( 0 ),
        IO_TYPE_26      => ( 0 ),
        IO_TYPE_27      => ( 0 ),
        IO_TYPE_28      => ( 0 ),
        IO_TYPE_29      => ( 0 ),
        IO_TYPE_30      => ( 0 ),
        IO_TYPE_31      => ( 0 ),
        IO_VAL_0        => ( 0 ),
        IO_VAL_1        => ( 0 ),
        IO_VAL_2        => ( 0 ),
        IO_VAL_3        => ( 0 ),
        IO_VAL_4        => ( 0 ),
        IO_VAL_5        => ( 0 ),
        IO_VAL_6        => ( 0 ),
        IO_VAL_7        => ( 0 ),
        IO_VAL_8        => ( 0 ),
        IO_VAL_9        => ( 0 ),
        IO_VAL_10       => ( 0 ),
        IO_VAL_11       => ( 0 ),
        IO_VAL_12       => ( 0 ),
        IO_VAL_13       => ( 0 ),
        IO_VAL_14       => ( 0 ),
        IO_VAL_15       => ( 0 ),
        IO_VAL_16       => ( 0 ),
        IO_VAL_17       => ( 0 ),
        IO_VAL_18       => ( 0 ),
        IO_VAL_19       => ( 0 ),
        IO_VAL_20       => ( 0 ),
        IO_VAL_21       => ( 0 ),
        IO_VAL_22       => ( 0 ),
        IO_VAL_23       => ( 0 ),
        IO_VAL_24       => ( 0 ),
        IO_VAL_25       => ( 0 ),
        IO_VAL_26       => ( 0 ),
        IO_VAL_27       => ( 0 ),
        IO_VAL_28       => ( 0 ),
        IO_VAL_29       => ( 0 ),
        IO_VAL_30       => ( 0 ),
        IO_VAL_31       => ( 0 ),
        OE_TYPE         => ( 0 )
        )
    port map( 
        -- Inputs
        PRESETN  => CORE8051S_0_PRESETN,
        PCLK     => GLA_net_0,
        PSEL     => CoreAPB3_0_APBmslave2_PSELx,
        PENABLE  => CoreAPB3_0_APBmslave0_PENABLE,
        PWRITE   => CoreAPB3_0_APBmslave0_PWRITE,
        PADDR    => CoreAPB3_0_APBmslave0_PADDR_2,
        PWDATA   => CoreAPB3_0_APBmslave0_PWDATA,
        GPIO_IN  => GPIO_IN_const_net_1,
        -- Outputs
        PSLVERR  => CoreAPB3_0_APBmslave2_PSLVERR,
        PREADY   => CoreAPB3_0_APBmslave2_PREADY,
        PRDATA   => CoreAPB3_0_APBmslave2_PRDATA,
        INT      => OPEN,
        INT_OR   => OPEN,
        GPIO_OUT => GPIO_OUT_net_0,
        GPIO_OE  => OPEN 
        );
-- CoreTimer_1   -   Actel:DirectCore:CoreTimer:2.0.103
CoreTimer_1 : CoreTimer
    generic map( 
        FAMILY     => ( 16 ),
        INTACTIVEH => ( 1 ),
        WIDTH      => ( 32 )
        )
    port map( 
        -- Inputs
        PCLK    => GLA_net_0,
        PRESETn => CORE8051S_0_PRESETN,
        PSEL    => CoreAPB3_0_APBmslave1_PSELx,
        PWRITE  => CoreAPB3_0_APBmslave0_PWRITE,
        PENABLE => CoreAPB3_0_APBmslave0_PENABLE,
        PADDR   => CoreAPB3_0_APBmslave0_PADDR_1,
        PWDATA  => CoreAPB3_0_APBmslave0_PWDATA,
        -- Outputs
        TIMINT  => CoreTimer_1_TIMINT,
        PRDATA  => CoreAPB3_0_APBmslave1_PRDATA 
        );
-- data_ram_2kb_0
data_ram_2kb_0 : data_ram_2kb
    port map( 
        -- Inputs
        WEN   => CORE8051S_0_MEMWR,
        REN   => CORE8051S_0_MEMRD,
        RWCLK => GLA_net_0,
        WD    => CORE8051S_0_MEMDATAO,
        WADDR => CORE8051S_0_MEMADDR10to0,
        RADDR => CORE8051S_0_MEMADDR10to0,
        -- Outputs
        RD    => data_ram_2kb_0_RD 
        );
-- Driver_0
Driver_0 : Driver
    port map( 
        -- Inputs
        Impulse => CoreGPIO_1_GPIO_OUT9to9(9),
        CLK     => fdev_1KHz_0_clk_out,
        -- Outputs
        Y       => Driver_0_Y 
        );
-- Driver_N
Driver_N : Driver
    port map( 
        -- Inputs
        Impulse => nfilter_net_0,
        CLK     => CLKGEN_0_GLB,
        -- Outputs
        Y       => Driver_N_Y 
        );
-- Driver_P
Driver_P : Driver
    port map( 
        -- Inputs
        Impulse => pfilter_net_0,
        CLK     => CLKGEN_0_GLB,
        -- Outputs
        Y       => Driver_P_Y 
        );
-- fdev_1KHz_0
fdev_1KHz_0 : fdev_1KHz
    port map( 
        -- Inputs
        clk     => CLKGEN_0_GLB,
        nreset  => AND2A_0_Y,
        -- Outputs
        clk_out => fdev_1KHz_0_clk_out 
        );
-- MajorityGate_0
MajorityGate_0 : MajorityGate
    port map( 
        -- Inputs
        IMP => pIMP,
        CLK => CLKGEN_0_GLB,
        -- Outputs
        Y   => pfilter_net_0 
        );
-- MajorityGate_1
MajorityGate_1 : MajorityGate
    port map( 
        -- Inputs
        IMP => nIMP,
        CLK => CLKGEN_0_GLB,
        -- Outputs
        Y   => nfilter_net_0 
        );
-- mux_mem_0
mux_mem_0 : mux_mem
    port map( 
        -- Inputs
        Sel0       => CORE8051S_0_MEMPSRD,
        Data0_port => data_ram_2kb_0_RD,
        Data1_port => code_ram_16kb_0_RD,
        -- Outputs
        Result     => mux_mem_0_Result 
        );
-- myRevCount_0
myRevCount_0 : myRevCount
    port map( 
        -- Inputs
        clk     => CLKGEN_0_GLB,
        pEnable => Driver_P_Y,
        nEnable => Driver_N_Y,
        nreset  => AND2A_0_Y,
        -- Outputs
        count   => myRevCount_0_count 
        );
-- PWM_0
PWM_0 : PWM
    port map( 
        -- Inputs
        input  => CoreGPIO_1_GPIO_OUT7to0,
        clk    => fdev_1KHz_0_clk_out,
        nreset => AND2A_0_Y,
        enable => Driver_0_Y,
        -- Outputs
        M      => PWM_0_M 
        );

end RTL;
