library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegTB is
--  Port ( );
end ShiftRegTB;

architecture Behavioral of ShiftRegTB is

component Shift_Left_Right_Register is
      generic ( nrBits : integer);
      Port ( Clk : in STD_LOGIC;
             SL : in STD_LOGIC;
             SR : in STD_LOGIC;
             LD : in STD_LOGIC;
             Mant : in STD_LOGIC_VECTOR(nrBits - 1 downto 0);
             MantOut : out STD_LOGIC_VECTOR(nrBits - 1 downto 0)
      );
    end component;


        signal Clk :  STD_LOGIC;
        signal SL :  STD_LOGIC;
        signal SR :  STD_LOGIC;
        signal LD :  STD_LOGIC;
        signal Mant :  STD_LOGIC_VECTOR(23 downto 0);
        signal MantOut :  STD_LOGIC_VECTOR(23 downto 0);
        
        constant CLK_PERIOD : TIME := 10 ns;

begin
 
     gen_clk: process
            begin
               Clk <= '0';
               wait for (CLK_PERIOD/2);
               Clk <= '1';
               wait for (CLK_PERIOD/2);
            end process gen_clk;
 
 ShiftMantissaRight : Shift_Left_Right_Register
        generic map (nrBits => 24)
        port map (Clk => Clk,
                  SL => SL,   
                  SR => SR,
                  LD => LD,
                  Mant => Mant,
                  MantOut => MantOut
                ); 
                
                
                
        process 
        begin
        mant <= B"1111_1111_1111_1111_1111_1111";
        LD <= '1';
        sl <= '1';
        sr <= '0';
        wait for 10ns;
        LD <= '0';
        wait for 10ns;
        wait for 10ns;
        wait for 10ns;
        wait for 10ns;
        wait for 10ns;
        wait for 10ns;
        sr <= '1';
        sl <= '0';
        wait for 10ns;
        wait for 10ns;
        wait for 10ns;
        wait for 10ns;
        wait for 10ns;
        wait for 10ns;
        wait for 10ns;
        
        
        
        
        end process;
                
                




end Behavioral;
