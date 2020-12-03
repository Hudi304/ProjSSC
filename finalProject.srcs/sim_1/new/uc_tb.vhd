library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uc_tb is
--  Port ( );
end uc_tb;

architecture Behavioral of uc_tb is

    constant CLK_PERIOD : TIME := 10 ns;
    
        signal SX :   STD_LOGIC;
        signal SY :   STD_LOGIC;
        signal Clk :   STD_LOGIC;
        signal DifExp :   STD_LOGIC_VECTOR(7 downto 0);
        signal ZComp :   STD_LOGIC_VECTOR(4 downto 0);
        signal SumMant :   STD_LOGIC_VECTOR(24 downto 23);   
        signal Start :   STD_LOGIC;
        signal op :   STD_LOGIC;
        signal ExpDec :   STD_LOGIC_VECTOR(8 downto 0);
        signal ExpInc :   STD_LOGIC_VECTOR(8 downto 0);
        ----------------------------------------
        signal SR :   STD_LOGIC ;                            
        signal SL :   STD_LOGIC ;
        signal LD :   STD_LOGIC ;
        signal LDRez :   STD_LOGIC;
        signal LDMant :   STD_LOGIC;
        signal LDMantSum :   STD_LOGIC;
        signal SelectionOp :   STD_LOGIC ;
        signal OverF :   STD_LOGIC ;
        signal UnderF :   STD_LOGIC ;
        signal EnableDec :   STD_LOGIC;
        signal EnableInc :   STD_LOGIC;
        signal LDinc :   STD_LOGIC;
        signal StopSig :   STD_LOGIC;
    
    component UC is
      Port ( SX : in STD_LOGIC;
             SY : in STD_LOGIC;
             Clk : in STD_LOGIC;
             DifExp : in STD_LOGIC_VECTOR(7 downto 0);
             ZComp : in STD_LOGIC_VECTOR(4 downto 0);
             SumMant : in STD_LOGIC_VECTOR(24 downto 23);   
             Start : in STD_LOGIC;
             op : in STD_LOGIC;
             ExpDec : in STD_LOGIC_VECTOR(8 downto 0);
             ExpInc : in STD_LOGIC_VECTOR(8 downto 0);
             ----------------------------------------
             SR : out STD_LOGIC ;                            
             SL : out STD_LOGIC ;
             LD : out STD_LOGIC ;
             LDRez : out STD_LOGIC;
             LDMant : out STD_LOGIC;
             LDMantSum : out STD_LOGIC;
             SelectionOp : out STD_LOGIC ;
             OverF : out STD_LOGIC ;
             UnderF : out STD_LOGIC ;
             EnableDec : out STD_LOGIC;
             EnableInc : out STD_LOGIC;
             LDinc : out STD_LOGIC;
             StopSig : out STD_LOGIC
      );
    end component;


begin

       DUT : UC port map(
         SX => SX,
         SY => SY,
         Clk => Clk,
         DifExp => DifExp,
         ZComp => ZComp,
         SumMant => SumMant,   
         Start => Start,
         op => op,
         ExpDec => ExpDec,
         ExpInc => ExpInc,
         ----------------------------------------
         SR => SR,                            
         SL => SL,
         LD => LD,
         LDRez => LDRez,
         LDMant => LDMant,
         LDMantSum => LDMantSum,
         SelectionOp => SelectionOp,
         OverF => OverF,
         UnderF => UnderF,
         EnableDec => EnableDec,
         EnableInc => EnableInc,
         LDinc => LDinc,
         StopSig => StopSig 
   );
                 
  
       gen_clk : process
                begin
                   Clk <= '0';
                   wait for (CLK_PERIOD/2);
                   Clk <= '1';
                   wait for (CLK_PERIOD/2);
                end process gen_clk;
     
     gen_test : process
                begin 
                
                     
                    
                end process;
     
end Behavioral;
