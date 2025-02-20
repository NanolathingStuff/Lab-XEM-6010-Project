-- Maintenence/default working: 
-- 	R,G,Y blink for 0.5s every 0.5s
--	Red input = 1 --> R blink 6s every 6
--	Yellow input = 0,1,2 --> Y blink every half,1,2 times R
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;

entity Maintenence is 
 port(	Enabler, Red: in std_logic;
	Yellow: in std_logic_vector(0 to 1); -- 00, 01, 10, 11 = error
	LR, LY, LG: out std_logic);
end Maintenence;

architecture Maintenence_behavior of Maintenence is
--signals
--component Enabler_generator is
--    port(Reset_out: out std_logic);
--end component;	-- depreated
--signal Enabler: std_logic;

begin

YR: process(Enabler, Red, Yellow)
        variable Y: std_logic_vector(2 downto 0):=(others => '0');
begin 	
		--TOEND      
	if Enabler = '1' then
		--LR <= '1';
		if Red /= '0' then --Red blink 6
			if Yellow(0) = '0' then --Yellow blink twice red
			LY <= '1';
			--else
				--if Yellow = '01' then --Yellow blink with red
					
				--else	--Yellow blink half as red (count 11 == 10)
			--LY <= '0';
				--end if;
			end if;
		else	--Red blink 0.5
			LR <= '0';

			LY <= '0';
		end if;
	else	-- off
		LY <= '0';
		LR <= '0';
       	end if;       
      
      end process; 

Green: process(Enabler)
begin
	if Enabler = '1' then
		LG <= '1';
		-- wait for 500 ps;
		LG <= '0';
	else	-- off
		LG <= '0';
	end if;       
      end process; 

-- cpt1: Enabler_generator port map(Enabler);

end Maintenence_behavior;