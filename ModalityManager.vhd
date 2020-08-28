library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Manager is 
 port(	Reset, Mode: in std_logic;
	comp: out std_logic); --Component to activate (Maintenence or Normal)
end Manager;

architecture ConditionManager of Manager is
	--TYPE statetype IS (S_MAINTENANCE, S_NOMINAL, S_STANDBY, S_ERROR); -- States.
	--signal currentstate, nextstate: statetype;

begin
--comp <= x;

process(Reset, Mode)
begin
--variable x: std_logic:='0';
	if mode'event  then
		comp <= '1';
	end if;
	if (falling_edge(Reset)) then
		comp <= '0';
	end if;

end process;


end ConditionManager;