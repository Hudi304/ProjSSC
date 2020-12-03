----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2019 05:47:09 PM
-- Design Name: 
-- Module Name: Rounding - Behavioral
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

entity Rounding is
  Port ( Mant : in STD_LOGIC_VECTOR(24 downto 0);
         Exp : in STD_LOGIC_VECTOR(7 downto 0);
         Clk : in STD_LOGIC; 
         OutMant : out STD_LOGIC_VECTOR(22 downto 0);
         OutExp : out STD_LOGIC_VECTOR( 7 downto 0)      
  );
end Rounding;

--------------------------------------------------------------------------------------
--Architecture description
--------------------------------------------------------------------------------------

architecture Behavioral of Rounding is

begin
    process(Clk)
    begin
        if RISING_EDGE(Clk) then
            OutMant <= Mant(22 downto 0);
            OutExp <= Exp;
        end if;
    end process;

end Behavioral;
