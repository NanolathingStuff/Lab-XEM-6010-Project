-- Normal working: 
-- 	Nominal = R = 3 then off, G for 5 and Y on the last 2ns G, then agin R...
--	Standby = R,G off, Y pulsing 1 every 2ns
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;

entity Normal is 
 port(	Enabler, Mode: in std_logic;
	LR, LY, LG: out std_logic);
end Normal;

architecture Normal_behav of Normal is

component Enabler_generator is
    port(Reset_out: out std_logic);
end component;

begin

process(Enabler, Mode)
begin
	if Enabler = '1' then
		if Mode = '0' then --NOMINAL
			LG <= '0';
			LY <= '0';
			LR <= '1';
			wait 3 ns;
			LR <= '0';
			LG <= '1';
			wait 3 ns;
			LY <= '1';
			wait 2 ns;
			LY <= '0';
			LG <= '0';
		else	if Mode = '1' --STANDBY
			LG <= '1';
			LY <= '1';
			LR <= '1';
			wait 1 ns;
			LG <= '0';
			LY <= '0';
			LR <= '0';
			wait 2 ns;
		end if;
	else
		LG <= '0';
		LY <= '0';
		LR <= '0';

end process;


end Normal_behav;