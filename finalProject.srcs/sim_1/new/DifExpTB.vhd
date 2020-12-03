library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DifExpTB is
end DifExpTB;

architecture Behavioral of DifExpTB is
    
    component Difference_Exponents is
      Port ( X : in STD_LOGIC_VECTOR(31 downto 0);
             Y : in STD_LOGIC_VECTOR(31 downto 0);
             DifExp : out STD_LOGIC_VECTOR(7 downto 0);
             Swap_enable : out STD_LOGIC      
      );
    end component;
    
    signal X : STD_LOGIC_VECTOR(31 downto 0);
    signal Y : STD_LOGIC_VECTOR(31 downto 0);
    signal DifExp : STD_LOGIC_VECTOR(7 downto 0);
    signal Swap_enable : STD_LOGIC;
    
   
begin

    dut : Difference_Exponents port map(
        x => x, 
        y => y,
        DifExp => DifExp,
        Swap_enable => Swap_enable
    );
    
    
    
    process 
    begin 
     x <= '0' &  x"01" & b"000_0000_0000_0000_0000_1111"; 
     y <= '0' &  x"01" & b"000_0000_0000_0000_0000_1111";  
     wait for 10ns; 
     
     x <= '0' &  x"F1" & b"000_0000_0000_0000_0000_1111"; 
     y <= '0' &  x"01" & b"000_0000_0000_0000_0000_1111";  
     wait for 10ns; 
     
     x <= '0' &  x"01" & b"000_0000_0000_0000_0000_1111"; 
     y <= '0' &  x"0B" & b"000_0000_0000_0000_0000_1111";  
     wait for 10ns; 
 
    end process;





end Behavioral;
