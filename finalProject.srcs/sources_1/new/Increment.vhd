----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2019 05:00:54 PM
-- Design Name: 
-- Module Name: Increment - Behavioral
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

entity Increment is
  Port ( 
        Exp : in STD_LOGIC_VECTOR(7 downto 0);
        EnableInc : in STD_LOGIC;
        EnableDec : in STD_LOGIC;
        LDinc : in STD_LOGIC;
        Clk : in STD_LOGIC;
        OutExp : out STD_LOGIC_VECTOR(8 downto 0)
  );
end Increment;

--------------------------------------------------------------------------------------
--Architecture description
--------------------------------------------------------------------------------------

architecture Behavioral of Increment is

-- Signal declaration
--------------------------------------------------------------------------------------

signal aux : STD_LOGIC_VECTOR(8 downto 0);
signal temp : STD_LOGIC_VECTOR(8 downto 0);

begin

    aux <= '0' & Exp;
            
    process(Clk)
    begin
        if RISING_EDGE(Clk) then
            if LDinc = '1' then
                temp <= aux;
            elsif EnableInc = '1' then
                temp <= temp + 1;
            elsif EnableDec = '1' then
                temp <= temp - 1;
            end if;
       end if;
    end process;
    
    OutExp <= temp;
    
end Behavioral;
