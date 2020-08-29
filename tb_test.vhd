library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tb_test is
end tb_test;

architecture test_behavior of tb_test is

component test_lights is
	port(	Mode, RS, Enable, Reset: in std_logic;	-- signal from components: nominal or standby, red modulator, Enabler, reset to mod5
	Y: in std_logic_vector(0 to 1);		-- yellow modulator
	outR, outY, outG: out std_logic);	--outputs
end component;

signal mode, red_switch, enable, reset, RED, YELLOW, GREEN: std_logic; --
signal yellow_mod: std_logic_vector(0 to 1);

begin

cpt: test_lights port map (mode, red_switch, enable, reset, yellow_mod, RED, YELLOW, GREEN);--, ou 

process
begin
	
	enable <= '1'; --disabled
	red_switch <= '0';
	yellow_mod <= "01";
	reset <= '0';
	wait for 200 ns; --maintenence
	mode <= '1';
	wait for 600 ns;
	yellow_mod <= "00";
	mode <= '0';
	wait for 600 ns;
	
end process;

end test_behavior;
