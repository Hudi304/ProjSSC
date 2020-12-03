----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2019 09:59:28 PM
-- Design Name: 
-- Module Name: Zero_Mantissa - Behavioral
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

--------------------------------------------------------------------------------------
--Entity declaration
--------------------------------------------------------------------------------------

entity Zero_Mantissa is
  Port ( Mant : in STD_LOGIC_VECTOR(24 downto 0);
         ZeroCount : out STD_LOGIC_VECTOR(4 downto 0)
  );
end Zero_Mantissa;

--------------------------------------------------------------------------------------
--Architecture description
--------------------------------------------------------------------------------------

architecture Behavioral of Zero_Mantissa is

-- Signal declaration
--------------------------------------------------------------------------------------

signal ZeroVector : STD_LOGIC_VECTOR(24 downto 0);
signal aux : STD_LOGIC_VECTOR(7 downto 0);

begin
    ZeroVector <= "0000000000000000000000000";
    
    aux <= "--------" when Mant(24 downto 24) = "-" else
           X"19" when Mant(24 downto 0) = ZeroVector(24 downto 0) else
           X"18" when Mant(24 downto 1) = ZeroVector(24 downto 1) else
           X"17" when Mant(24 downto 2) = ZeroVector(24 downto 2) else
           X"16" when Mant(24 downto 3) = ZeroVector(24 downto 3) else
           X"15" when Mant(24 downto 4) = ZeroVector(24 downto 4) else
           X"14" when Mant(24 downto 5) = ZeroVector(24 downto 5) else
           X"13" when Mant(24 downto 6) = ZeroVector(24 downto 6) else
           X"12" when Mant(24 downto 7) = ZeroVector(24 downto 7) else
           X"11" when Mant(24 downto 8) = ZeroVector(24 downto 8) else
           X"10" when Mant(24 downto 9) = ZeroVector(24 downto 9) else
           X"0F" when Mant(24 downto 10) = ZeroVector(24 downto 10) else
           X"0E" when Mant(24 downto 11) = ZeroVector(24 downto 11) else
           X"0D" when Mant(24 downto 12) = ZeroVector(24 downto 12) else
           X"0C" when Mant(24 downto 13) = ZeroVector(24 downto 13) else
           X"0B" when Mant(24 downto 14) = ZeroVector(24 downto 14) else
           X"0A" when Mant(24 downto 15) = ZeroVector(24 downto 15) else
           X"09" when Mant(24 downto 16) = ZeroVector(24 downto 16) else
           X"08" when Mant(24 downto 17) = ZeroVector(24 downto 17) else
           X"07" when Mant(24 downto 18) = ZeroVector(24 downto 18) else
           X"06" when Mant(24 downto 19) = ZeroVector(24 downto 19) else
           X"05" when Mant(24 downto 20) = ZeroVector(24 downto 20) else
           X"04" when Mant(24 downto 21) = ZeroVector(24 downto 21) else
           X"03" when Mant(24 downto 22) = ZeroVector(24 downto 22) else
           X"02" when Mant(24 downto 23) = ZeroVector(24 downto 23) else
           X"01" when Mant(24 downto 24) = ZeroVector(24 downto 24) else
           X"00";
           
    ZeroCount <= aux(4 downto 0);  

end Behavioral;
