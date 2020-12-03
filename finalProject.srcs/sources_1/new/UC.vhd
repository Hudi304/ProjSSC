----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2019 05:59:27 PM
-- Design Name: 
-- Module Name: UC - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--------------------------------------------------------------------------------------
--Entity declaration
--------------------------------------------------------------------------------------

entity UC is
  Port ( SX : in STD_LOGIC;
         SY : in STD_LOGIC;
         Clk : in STD_LOGIC;
         DifExp : in STD_LOGIC_VECTOR(7 downto 0);
         ZComp : in STD_LOGIC_VECTOR(4 downto 0);
         SumMant : in STD_LOGIC_VECTOR(24 downto 23);    -- the sum of mantissas
         Start : in STD_LOGIC;
         ExpDec : in STD_LOGIC_VECTOR(8 downto 0);
         ExpInc : in STD_LOGIC_VECTOR(8 downto 0);
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
end UC;

--------------------------------------------------------------------------------------
--Architecture description
--------------------------------------------------------------------------------------

architecture Behavioral of UC is

-- Signal declaration
--------------------------------------------------------------------------------------

type State is (idle, load, init, dif_exp, shift_mantissa_right, add_mantissa, stop, shift_mantissa_leftR, sub_mantissa, test_norm, shift_mant_right2, rounding, shift_mantissa_left, report_res, verif_underflow, verif_overflow);
signal st : State := idle;

signal SelOp : STD_LOGIC;

begin

    SelectionOp <= SelOp;
    
    process(Clk)
    
    variable cntShiftRight : STD_LOGIC_VECTOR(7 downto 0);
    variable cntShiftLeft : STD_LOGIC_VECTOR(4 downto 0);
   
    begin
        if RISING_EDGE(Clk) then
                case st is
                    when idle => if Start = '0' then                                               -- start state
                                    st <= idle;
                                 else
                                    st <= load;
                                 end if;
                                 
                     when load =>  st <= init;                    --load numbers to operate with
                     
                     when init =>                                 -- initialization state
                                         if SX = '0' and SY = '0' then          -- addition operation
                                                        SelOp <= '0';
                                                        
                                                     elsif SX = '0' and SY ='1' then
                                                        SelOp <= '1';
                                                        
                                                     elsif SX = '1' and SY = '0' then
                                                        SelOp <= '1';
                                                        
                                                     elsif SX = '1' and SY = '1' then
                                                        SelOp <= '0';
                                                     
                                                     end if;
                                                     
                                       
                                
                                  
                                st <= dif_exp;   
                                  
                     when dif_exp => if DifExp = x"00" then              -- difference exponents state
                                        if SelOp = '0' then                                
                                            st <= add_mantissa;
                                        else 
                                            st <= sub_mantissa;
                                         end if;
                                     elsif DifExp <= x"18" then         -- diff < 24
                                        st<= shift_mantissa_right;
                                     else                              -- diff > 24                          
                                        st <= report_res;      
                                     end if;
                                     cntShiftRight := DifExp - 1;
                                     
                    when shift_mantissa_right =>                                       -- shift mantissa right state
                                                 if cntShiftRight > x"00" then
                                                    st <= shift_mantissa_right;
                                                    cntShiftRight := cntShiftRight - 1;
                                                 else
                                                    if SelOp = '0' then                             
                                                        st <= add_mantissa;
                                                     else 
                                                        st <= sub_mantissa;
                                                     end if;
                                                 end if;
                                                 
                                                 
                    when add_mantissa =>  st <= test_norm;                     -- addition of mantissas state
                    
                    when sub_mantissa => st <= test_norm;                      -- substraction of mantissas state
                                         
                    when test_norm => if SumMant(24 downto 23) = "00" then               -- test normalization state
                                         st <= shift_mantissa_left;
                                      elsif SumMant(24 downto 23) = "01" then                               
                                         st <= rounding;
                                      elsif SumMant(24 downto 23) = "10" or SumMant(24 downto 23) = "11" then        
                                         st <= shift_mant_right2;
                                      end if;
                                      cntShiftLeft := ZComp - 2;
                                      
                    when shift_mantissa_left =>                                        -- shift mantissa left state
                                                if cntShiftLeft > "00000" then
                                                    st <= shift_mantissa_left;
                                                    cntShiftLeft := cntShiftLeft - 1;
                                                else
                                                    st <= rounding;
                                                end if;
                                                
                                      
                    when rounding => st <= verif_underflow;                            -- rounding state
                                                     
                    when shift_mant_right2 =>  st <= verif_overflow;
                    
                    when verif_overflow =>      if ExpInc(8) = '1' then               -- verify overflow state
                                                    OverF <= '1';
                                                end if;
                                                st <= report_res;                                       
                    
                    when verif_underflow =>     if ExpDec = "111111111" then         -- verify underflow state
                                                    UnderF <= '1';
                                                end if;
                                                
                                                st <= report_res;                                      
                                                                    
                    
                    when report_res =>  st <= stop;              -- report result state
                    
                    when others => st <= stop;
                    
                end case;
        end if;
    end process;
    
    LD <= '1' when st = load else '0';
    SR <= '1' when st = shift_mantissa_right or st = shift_mant_right2 else '0';
    SL <= '1' when st = shift_mantissa_left else '0';
    EnableDec <= '1' when st = shift_mantissa_left else '0';
    EnableInc <= '1' when st = shift_mant_right2 else '0';
    Ldinc <= '1' when st = init else '0';
    LDRez <= '1' when st = report_res else '0';
    LDMant <= '1' when st = init else '0';
    LDMantSum <= '1' when st = test_norm else '0';
    StopSig <= '1' when st = stop else '0';
   
end Behavioral;
