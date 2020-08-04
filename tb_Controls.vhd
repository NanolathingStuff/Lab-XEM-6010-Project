library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tb_Controls is
end tb_Controls;

architecture tb_Controls_behavior of tb_Controls is
--simulate pressig reset button every 100 ns, Red, Yellow(2) and Mode

component Maintenence is 
 port(	Enabler, Red: in std_logic;
	Yellow: in std_logic_vector(0 to 1); -- 00, 01, 10, 11 = error
	LR, LY, LG: out std_logic);
end  component;

component Normal is 
 port(	Mode: in std_logic;
	LR, LY, LG: out std_logic);
end component;

signal Mode, Reset_out, R, L1, L2, L3: std_logic;
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
       Reset_out <= '1'; wait for 100 ns;  --fai solo segnale di discesa 
-- attack Y & R
   end process;

signals: process --intervals invented to be "as random as possible"
       begin
	Mode <= '0';
	R <= '0'; 
	Y(0) <= '0';
	Y(1) <= '0';wait for 5 ns;
	Y(0) <= '0'; Y(1) <= '1'; --Y <= '10'; 
	wait for 20 ns;
	R <= '1'; 
	Y(0) <= '1'; Y(1) <= '0';--Y <= '01';
	wait for 20 ns;  
	Y(0) <= '1'; Y(1) <= '1';--Y <= '11';
	Mode <= '1'; 
	wait for 10 ns;
-- attack Y & R
   end process;
   
cpt1: Maintenence port map(Reset_out, R, Y, L1, L2, L3);
cpt2: Normal port map(Mode, L1, L2, L3);


end tb_Controls_behavior;