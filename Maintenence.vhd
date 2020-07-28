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

process(Enabler, Red, Yellow)
        variable Y: std_logic_vector(2 downto 0):=(others => '0');
begin
         
	if Enabler /= '0' then
		LR <= '1';
		--TOEND
	else
         	LG <= '0';
		LY <= '0';
		LR <= '0';
       	end if;       
      
      end process; 

-- cpt1: Enabler_generator port map(Enabler);

end Maintenence_behavior;