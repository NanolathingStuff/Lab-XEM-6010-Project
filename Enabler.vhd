library ieee;
use ieee.std_logic_1164.all;

entity Enabler_generator is
    port(Reset_out: out std_logic);
end Enabler_generator;

architecture Enabler_generator_behavior of Enabler_generator is
--simulate pressig reset button every 10 seconds
begin
	--fs	femtoseconds
	--ps	picoseconds
	--ns	nanoseconds
	--us	microseconds
	--ms	milliseconds
	--sec	seconds
	--min	minutes
	--hr	hours  
   process
       begin
       Reset_out <= '0'; wait for 10 ns;
       Reset_out <= '1'; wait for 10 ns;   
   end process;
   
end Enabler_generator_behavior;