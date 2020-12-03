----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2019 06:59:29 PM
-- Design Name: 
-- Module Name: test_mux - Behavioral
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

entity test_mux is
--  Port ( );
end test_mux;

architecture Behavioral of test_mux is

signal nrBits : integer := 3;

signal X : STD_LOGIC_VECTOR(nrBits - 1 downto 0);
signal Y : STD_LOGIC_VECTOR(nrBits - 1 downto 0);
signal Sel : STD_LOGIC;

signal Z : STD_LOGIC_VECTOR(nrBits - 1 downto 0);

begin
    
    comp : entity WORK.MUX_2_1 
            generic map(nrBits => nrBits)
            port map (X => X,
                      Y => Y,
                      Sel => Sel,
                      Z => Z
            );
            
            
    process
    begin
        X <= "001";
        Y <= "010";
        Sel <= '0';
        
        wait;
    end process;


end Behavioral;
