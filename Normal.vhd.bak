-- Normal working: 
-- 	Nominal = R = 3 then off, G for 5 and Y on the last 2ns G, then agin R...
--	Standby = R,G off, Y pulsing 1 every 2ns
library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity Normal is
port(	Mode: in std_logic;
	Red, Yellow, Green: out std_logic);
end Normal;

architecture Normal_behavior of Normal is

component Standby is 
 	port(LR, LY, LG: out std_logic);
end component;

component Nominal is 
 	port(LR, LY, LG: out std_logic);
end component;

signal NR, NY, NG, SR, SY, SG: std_logic; --ComponentLight

begin

process(Mode)
begin
	if Mode = '1' then --Standby
		Red <= SR;
		Yellow <= SY;
		Green <= SG;
	else	--Nominal
		Red <= NR;
		Yellow <= NY;
		Green <= NG;
	end if;
--	Red <= (SR and Mode) or (NR and not Mode);
--	Yellow <= (SY and Mode) or (NY and not Mode);
--	Green <= (SG and Mode) or (NG and not Mode);		
end process;

cptS: Standby port map(SR, SY, SG);
cptN: Nominal port map(NR, NY, NG);

end Normal_behavior;