

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RegTb is
--  Port ( );
end RegTb;

architecture Behavioral of RegTb is

    component Load_Register is
      Port ( D : in STD_LOGIC_VECTOR(31 downto 0);
             Load : in STD_LOGIC;      
             Clr : in STD_LOGIC;      
             Clk : in STD_LOGIC;    
             Q : out STD_LOGIC_VECTOR(31 downto 0) 
      );
    end component;
    
    
     signal D : STD_LOGIC_VECTOR(31 downto 0);
     signal Load : STD_LOGIC;      
     signal Clr : STD_LOGIC;    
     signal Clk : STD_LOGIC;     
     signal Q : STD_LOGIC_VECTOR(31 downto 0);
     
     
    constant CLK_PERIOD : TIME := 10 ns;

begin

    reg : Load_Register port map(
         D => D,
         Load => Load,
         Clr => Clr,
         Clk => Clk,
         Q => Q
    );

       gen_clk: process
                  begin
                     Clk <= '0';
                     wait for (CLK_PERIOD/2);
                     Clk <= '1';
                     wait for (CLK_PERIOD/2);
                  end process gen_clk;
                  
        process
        begin 
            clr <= '1';
            clr <= '0';
            wait for 10ns;
            d <= x"FFFFFFFF";
            wait for 10ns;
            wait for 10ns;
            d <= x"00000000";
            wait for 10ns;
            wait for 10ns;
            load <= '1';
            d <= x"FFFFFFFF";
            wait for 10ns;
            load <= '0';
            wait for 10ns;
            clr <= '1';
            wait for 10ns;
            clr <= '0';
            wait for 10ns;
            
        
        
        end process;







end Behavioral;
