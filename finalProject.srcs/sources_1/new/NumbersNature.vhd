library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NumbersNature is
  Port ( X : in STD_LOGIC_VECTOR(31 downto 0);
         Y : in STD_LOGIC_VECTOR(31 downto 0);
         op : in std_logic;
         enable : out STD_LOGIC;
         Z : out STD_LOGIC_VECTOR(31 downto 0) 
        );
end NumbersNature;

architecture Behavioral of NumbersNature is

signal natureX : STD_LOGIC_VECTOR(2 downto 0);
signal natureY : STD_LOGIC_VECTOR(2 downto 0);

signal SignX, SignY, SignZ : STD_LOGIC;
signal ExpX, ExpY, ExpZ : STD_LOGIC_VECTOR(7 downto 0);
signal ManX, ManY, ManZ : STD_LOGIC_VECTOR(22 downto 0);

begin

    SignX <= X(31);
    SignY <= Y(31) xor op;  -- integrate operation sign into Y's sign bit
    
    ExpX <= X(30 downto 23);
    ExpY <= Y(30 downto 23);

    ManX <= X(22 downto 0);
    ManY <= Y(22 downto 0);
    
    natureX <= "000" when ExpX = x"00" and ManX = "00000000000000000000000" else                       -- Zero
               "001" when ExpX = x"00" and ManX > "00000000000000000000000" else                       -- Subnormal
               "011" when (ExpX > x"00" and ExpX < x"FF")                   else                       -- Normal
               "100" when ExpX = x"FF" and ManX = "00000000000000000000000" else                       -- Infinity
               "110" when ExpX = x"FF" and ManX > "00000000000000000000000" else                       -- nan
               "000"; 
            
    natureY <= "000" when ExpY = x"00" and ManY = "00000000000000000000000" else                       -- Zero
               "001" when ExpY = x"00" and ManY > "00000000000000000000000" else                       -- Subnormal
               "011" when (ExpY > x"00" and ExpY < x"FF")                   else                       -- Normal
               "100" when ExpY = x"FF" and ManY = "00000000000000000000000" else                       -- Infinity
               "110" when ExpY = x"FF" and ManY > "00000000000000000000000" else                       -- nan
               "000"; 
                    
    process(SignX, SignY, natureX, natureY)
    begin
        
        --zero--
        --zero and anything
        if natureX = "000" then 
            SignZ <= SignY;
            ExpZ <= ExpY;
            ManZ <= ManY;
        --anything and zero            
        elsif natureY = "000" then
            SignZ <= SignX;
            ExpZ <= ExpX;
            ManZ <= ManX;
        end if;
        
        --infinity--
        --nr and inf
        if natureX(0) = '1' and natureY = "100" then
            SignZ <= SignY;
            ExpZ <= ExpY;
            ManZ <= ManY;
        --inf and nr
        elsif natureX = "100" and natureY(0) = '1' then
            SignZ <= SignX;
            ExpZ <= ExpX;
            ManZ <= ManX;
        end if;
        
        --inf and inf with same signs gives inf
        if natureX = "100" and natureY = "100" and SignX = SignY then
            SignZ <= SignX;
            ExpZ <= ExpX;
            ManZ <= ManX;
        --inf and inf with diff signs gives nan
        elsif natureX = "100" and natureY = "100" and SignX /= SignY then
            SignZ <= '0';
            ExpZ <= x"FF";
            ManZ <= "00000000000000000000001";
        end if;
        
        --nan--
        --anything with at least a nan gives nan
        if natureX = "110" or natureY = "110" then
            SignZ <= '0';
            ExpZ <= x"FF";
            ManZ <= "00000000000000000000001";
        end if;
    end process;
   
    enable <= '1' when (natureX(0) = '1' and natureY(0) = '1') else '0';
    
    Z(31) <= SignZ;
    Z(30 downto 23) <= ExpZ;
    Z(22 downto 0) <= ManZ;  
    
end Behavioral;
