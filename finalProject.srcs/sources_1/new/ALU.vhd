----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2019 06:46:40 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
  Port ( MX : in STD_LOGIC_VECTOR(24 downto 0);
         MY : in STD_LOGIC_VECTOR(24 downto 0);
         AluCTRL : in STD_LOGIC;
         MS : out STD_LOGIC_VECTOR(24 downto 0)
  );
end ALU;

--------------------------------------------------------------------------------------
--Architecture description
--------------------------------------------------------------------------------------

architecture Behavioral of ALU is

signal aux : STD_LOGIC_VECTOR(24 downto 0) := "0000000000000000000000000";

begin
    
    process(AluCTRL, MX, MY)
    begin
            case AluCTRL is
                when '0' => aux <= MX + MY;                      -- add mantissas
                when others => aux <= MX - MY;                   -- sub mantissas
            end case;
    end process;

    MS <= aux;

end Behavioral;
