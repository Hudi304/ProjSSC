library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

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

architecture Behavioral of Shift_Left_Right_Register is

signal aux : STD_LOGIC_VECTOR(nrBits-1 downto 0);

begin

    process(Clk)
    begin
        
        if RISING_EDGE(Clk) then
                if LD = '1' then 
                    aux <= Mant;
                elsif SL = '1' then                                             -- shift left
                    aux <= aux(nrBits - 2 downto 0) & '0';
                elsif SR = '1' then                                             -- shift right
                    aux <= '0' & aux(nrBits - 1 downto 1);
                end if;
        end if;
    end process;
    
    MantOut <= aux;
    
end Behavioral;
