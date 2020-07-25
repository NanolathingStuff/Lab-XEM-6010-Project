library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.all;

entity Manager is 
 port(	Reset, clk, Mode: in std_logic;
	comp: out std_logic); --Component to activate (Maintenence or Normal)
end Manager;

architecture ConditionManager of Manager is
	TYPE statetype IS (S_MAINTENANCE, S_NOMINAL, S_STANDBY, S_ERROR); -- States.
	signal currentstate, nextstate: statetype;
begin



end ConditionManager;