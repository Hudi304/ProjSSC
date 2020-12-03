----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2019 05:34:31 PM
-- Design Name: 
-- Module Name: MUX_2_1 - Behavioral
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

entity MUX_2_1 is
  generic ( nrBits : integer );                               -- bits of the exponent or mantissa
  Port ( X : in STD_LOGIC_VECTOR(nrBits-1 downto 0);
         Y : in STD_LOGIC_VECTOR(nrBits-1 downto 0);
         Sel : in STD_LOGIC;
         Z : out STD_LOGIC_VECTOR(nrBits-1 downto 0)
  );
end MUX_2_1;

--------------------------------------------------------------------------------------
--Architecture description
--------------------------------------------------------------------------------------

architecture Behavioral of MUX_2_1 is

begin
    process(X,Y,Sel)
    begin
        case Sel is
            when '0' => Z <= X;                          -- X is the largest / smallest number 
            when others => Z <= Y;                       -- Y is the largest / smallest number
        end case;   
    end process;
end Behavioral;
