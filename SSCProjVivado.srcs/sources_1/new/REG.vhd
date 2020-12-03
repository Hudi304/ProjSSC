----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2020 12:12:32 PM
-- Design Name: 
-- Module Name: REG - Behavioral
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

entity REG is
 Port ( D : in STD_LOGIC_VECTOR(31 downto 0);
         Ld : in STD_LOGIC;       -- load/enable
         Clr : in STD_LOGIC;      -- asynchronous clear
         Clk  : in STD_LOGIC;     -- clock
         Q : out STD_LOGIC_VECTOR(31 downto 0)  -- output
  );
end REG;

architecture Behavioral of REG is

begin
 process(Clk, Clr)
    begin
        if Clr = '1' then
            Q <= x"00000000";
        elsif RISING_EDGE(Clk) then
            if Ld = '1' then
                Q <= D;
            end if;
        end if;
    end process;

end Behavioral;
