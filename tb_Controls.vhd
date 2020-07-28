library ieee;
use ieee.std_logic_1164.all;

entity tb_Controls is
end tb_Controls;

architecture tb_Controls_behavior of tb_Controls is
--simulate pressig reset button every 100 ns, Red, Yellow(2) and Mode

component Maintenence is 
 port(	Enabler, Red: in std_logic;
	Yellow: in std_logic_vector(0 to 1); -- 00, 01, 10, 11 = error
	LR, LY, LG: out std_logic);
end  component;

signal Reset_out, R, L1, L2, L3: std_logic;
signal Y:std_logic_vector(0 to 1);

begin
	--fs	femtoseconds
	--ps	picoseconds
	--ns	nanoseconds
	--us	microseconds
	--ms	milliseconds
	--sec	seconds
	--min	minutes
	--hr	hours  
enabler: process
       begin
       Reset_out <= '0'; wait for 100 ns;
       Reset_out <= '1'; wait for 100 ns;   
-- attack Y & R
   end process;
   
cpt2: Maintenence port map(Reset_out, R, Y, L1, L2, L3);


end tb_Controls_behavior;