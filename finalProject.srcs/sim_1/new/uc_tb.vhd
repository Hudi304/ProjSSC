----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2019 09:15:00 AM
-- Design Name: 
-- Module Name: uc_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uc_tb is
--  Port ( );
end uc_tb;

architecture Behavioral of uc_tb is

--intrari
signal X : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
signal Y : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
signal Clk : STD_LOGIC;
signal DifExp : STD_LOGIC_VECTOR(7 downto 0) := x"00";
signal ZComp : STD_LOGIC_VECTOR(4 downto 0) := "00000";
signal Comp : STD_LOGIC := '0';                        
signal SumMant : STD_LOGIC_VECTOR(24 downto 0) := "0000000000000000000000000";    
signal Start : STD_LOGIC := '0';
signal op : STD_LOGIC := '0';
signal ExpDec : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal ExpInc : STD_LOGIC_VECTOR(8 downto 0) := "000000000";
--signal RotMant : STD_LOGIC_VECTOR(24 downto 0) := "0000000000000000000000000";

--iesiri
signal Emax : STD_LOGIC ;                         
signal Mmin : STD_LOGIC ;                          
signal Mmax : STD_LOGIC ;                        
signal SR : STD_LOGIC ;                           
signal SL : STD_LOGIC ;
--signal SelMant : STD_LOGIC ;                      
--signal SelExp : STD_LOGIC ;                      
signal LD : STD_LOGIC ;
signal SelectionOp : STD_LOGIC ;
signal OverF : STD_LOGIC ;
signal UnderF : STD_LOGIC ;
signal EnableDec : STD_LOGIC ;
signal EnableInc : STD_LOGIC;

constant CLK_PERIOD : TIME := 10 ns;

begin

   
                 
     control : entity WORK.UC port map(
     
            X => X,
            Y => Y,
            Clk => Clk,
            DifExp => DifExp,
            ZComp => ZComp,
            Comp => Comp,
            SumMant => SumMant,
            Start => Start,
            op => op,
            ExpDec => ExpDec,
            ExpInc => ExpInc,
           -- RotMant => RotMant,
            Emax => Emax,
            Mmin => Mmin,
            Mmax => Mmax,
            SR => SR,
            SL => SL,
            --SelMant => SelMant,
            --SelExp => SelExp,
            LD => LD,
            SelectionOp => SelectionOp,
            OverF => OverF,
            UnderF => UnderF,
            EnableDec => EnableDec,
            EnableInc => EnableInc
     );
     
       gen_clk: process
                begin
                   Clk <= '0';
                   wait for (CLK_PERIOD/2);
                   Clk <= '1';
                   wait for (CLK_PERIOD/2);
                end process gen_clk;
     
     gen_test : process
                begin
                
                     X <= "00001100011100000000000000000000";
                     Y <= "00001011011110000000000000000000";
                     
                     DifExp <= "00000010";
                     
                     ZComp <= "00000";
                     
                     Comp <= '1';
                      op <= '0';
                     
                     SumMant <= "0100011000000000000000000";
                     
                     ExpDec <= "11111111";
                     
                     ExpInc <= "111111111";
                     
                     Start <= '0';
                     
                     wait for CLK_PERIOD;
                     
                     Start <= '1';
                                          
                     --RotMant <= "0100011000000000000000000";
                     
                    wait;
                end process;
     
end Behavioral;
