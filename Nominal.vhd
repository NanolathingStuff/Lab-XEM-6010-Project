-- Normal working: 
-- 	Nominal = R = 3 then off, G for 5 and Y on the last 2ns G, then agin R...
--	Standby = R,G off, Y pulsing 1 every 2ns
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;

entity Nominal is 
 port(LR, LY, LG: out std_logic);
end Nominal;

architecture Nominal_behav of Nominal is

--component Enabler_generator is
--    port(Reset_out: out std_logic);
--end component;

begin

process
begin
	LG <= '0';
	LY <= '0';
	LR <= '1';
	wait for 3 ns;
	LR <= '0';
	LG <= '1';
	wait for 3 ns;
	LY <= '1';
	wait for 2 ns;
	LY <= '0';
	LG <= '0';
		
end process;


end Nominal_behav;