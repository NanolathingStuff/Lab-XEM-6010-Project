-- Normal working: 
-- 	Nominal = R = 3 then off, G for 5 and Y on the last 2ns G, then agin R...
--	Standby = R,G off, Y pulsing 1 every 2ns
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;

entity Standby is 
 port(LR, LY, LG: out std_logic);
end Standby;

architecture Standby_behav of Standby is

begin

	LR <= '0';
	LG <= '0';

process
begin
	LY <= '1';
	wait for 1 ns;
	LY <= '0';
	wait for 2 ns;
end process;

end Standby_behav;