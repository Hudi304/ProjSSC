----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2019 03:16:27 PM
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
--  Port ( );
end test;

architecture Behavioral of test is

signal X : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
signal Y : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
signal Clk : STD_LOGIC;
signal StartOp : STD_LOGIC;
signal op : STD_LOGIC;

signal Z : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";

constant CLK_PERIOD : TIME := 10 ns;

begin
        test : entity WORK.Main port map (
        
                X => X,
                Y => Y,
                Clk => Clk,
                StartOp => StartOp,
                op => op,
                Z => Z
        );
        
         gen_clk: process
                  begin
                     Clk <= '0';
                     wait for (CLK_PERIOD/2);
                     Clk <= '1';
                     wait for (CLK_PERIOD/2);
                  end process gen_clk;
    
        gen_test : process
                   begin
                         
                        StartOp <= '1';

--                        X <= "01000000101000000000000000000000";   -- 5.0
--                        Y <= "01000000110000000000000000000000";   -- 6.0
--                        result : 41300000 => adunare
--                        result : BF800000 => scadere
                        
--                        X <= "01000010000011110000000000000000";   -- 35.75
--                        Y <= "01000001101001000000000000000000";   -- 20.5
--                                  result : 42610000 => adunare
--                                  result : 41740000 => scadere

--                        X <= "01000001100001000000000000000000";   -- 16.5    
--                        Y <= "01000000110010011001100110011010";   -- 6.3
--                                  result : 41B66666 => adunare
--                                  result : 41233334 => scadere

--                        X <= "01000000110000000000000000000000";   -- 6.0
--                        Y <= "01000000101000000000000000000000";   -- 5.0
--                                  result : 3F800000 => scadere

--                        X <= "11000000101000000000000000000000";   -- -5.0
--                        Y <= "11000000110000000000000000000000";   -- -6.0
--                                 result : C1300000 => adunare
--                                 result : 3F800000 => scadere

--                         X <= "01000001011100000000000000000000";   -- 15.0
--                         Y <= "01000001101101001100110011001101";   -- 22.6
--                                 result : 42166666 => adunare   + + +
--                                 result : C0F33334 => scadere   + - +

                         X <= "11000010111100000000000000000000";   -- -120
                         Y <= "11000001101101001100110011001101";   -- -22.6
--                                 result : C0F33334 => adunare   + + -
--                                 result : 42166666 => scadere   + - -

--                         X <= "11000001011100000000000000000000";   -- -15.0
--                         Y <= "01000001101101001100110011001101";   -- 22.6
--                                 result : 40F33334 => adunare   - + +
--                                 result : C2166666 => scadere   - - +

--                         X <= "11000001011100000000000000000000";   -- -15.0
--                         Y <= "11000001101101001100110011001101";   -- -22.6
--                                 result : C2166666 => adunare   - + -
--                                 result : 40F33334 => scadere   - - -

--                         X <= "01000010001101000111111001011101";   -- 45.1234
--                         Y <= "01000000000110111010010111100011";   -- 2.432
--                                result : 423E38BB => adunare
--                                result : 422AC3FF => scadere

--                         X <= "01000000000110111010010111100011";   -- 2.432
--                         Y <= "00000000000000000000000000000000";   -- 0.0
--                                result : 401BA5E3

                        op <= '0';
                        
                        wait;
                   end process;

end Behavioral;
