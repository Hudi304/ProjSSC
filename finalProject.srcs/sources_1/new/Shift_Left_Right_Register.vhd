----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2019 03:55:03 PM
-- Design Name: 
-- Module Name: Shift_Left_Right_Register - Behavioral
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

entity Shift_Left_Right_Register is
    generic ( nrBits : integer);
  Port ( Clk : in STD_LOGIC;
         SL : in STD_LOGIC;
         SR : in STD_LOGIC;
         LD : in STD_LOGIC;
         Mant : in STD_LOGIC_VECTOR(nrBits - 1 downto 0);
         MantOut : out STD_LOGIC_VECTOR(nrBits - 1 downto 0)
  );
end Shift_Left_Right_Register;

--------------------------------------------------------------------------------------
--Architecture description
--------------------------------------------------------------------------------------

architecture Behavioral of Shift_Left_Right_Register is

-- Signal declaration
--------------------------------------------------------------------------------------

signal aux : STD_LOGIC_VECTOR(nrBits-1 downto 0);

begin

    process(Clk)
    begin
        
        if RISING_EDGE(Clk) then
                if LD = '1' then 
                    aux <= Mant;
                elsif SL = '1' then                                             -- shift left
                    aux <= aux(nrBits - 2 downto 0) & '0';
                elsif SR = '1' then                                          -- shift right
                    aux <= '0' & aux(nrBits - 1 downto 1);
                end if;
        end if;
    end process;
    
    MantOut <= aux;
    
end Behavioral;
