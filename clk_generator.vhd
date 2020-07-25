library ieee;
use ieee.std_logic_1164.all;

entity clk_generator is
    port(clock_out: out std_logic);
    end clk_generator;
    
architecture clk_generator_behavior of clk_generator is
begin
	 -- clock at 100MHz    
   process
       begin
       clock_out <= '1'; wait for 10 ns;
       clock_out <= '0'; wait for 10 ns;   
   end process;
   
end clk_generator_behavior;
