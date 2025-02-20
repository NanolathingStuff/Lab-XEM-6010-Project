library ieee;
use ieee.std_logic_1164.all;
use work.all;


entity tb_manager is
end tb_manager;

architecture manager_behavior of tb_manager is

component Manager is 
 port(	Reset, Mode: in std_logic;
	comp: out std_logic_vector(0 to 1)); --Component to activate (Maintenence or Normal)
end component;--:= "00"

signal r, m: std_logic;--:='0';
signal output: std_logic_vector(0 to 1);

begin

cpt_mod: Manager port map (r,m, output);

process
begin
	
	r <= '0';
	wait for 100 ns;
	m <= '0';
	wait for 100 ns;
	m <= '1';
	wait for 100 ns;
	r <= '1';
	wait for 100 ns;
	m <= '0';
	wait for 100 ns;
	m <= '1';
	r <= '0';
	wait for 100 ns;
	r <= '1';
	wait for 100 ns;


end process;

end manager_behavior;

