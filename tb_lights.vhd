library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tb_lights is
end tb_lights;

architecture lights_behavior of tb_lights is

component Lights is 
 port(	Mode, RS, Enable, Reset: in std_logic;	-- signal from components: nominal or standby, red modulator, Enabler, reset to mod5
	Y: in std_logic_vector(0 to 1);		-- yellow modulator
	LightR, LightG, LightV: out std_logic);	--outputs
end component;

signal mode, red_switch, enable, reset, GREEN, YELLOW, RED: std_logic;
signal yellow_mod: std_logic_vector(0 to 1);

begin

cpt_mod: Lights port map (mode, red_switch, enable, reset, yellow_mod, GREEN, YELLOW, RED );--, ou

process
begin
	mode <= '0';
	enable <= '0';
	red_switch <= '0';
	yellow_mod <= "00";
	reset <= '0';

	wait for 300ns;
	enable <= '1';
	yellow_mod <= "01";
	wait for 300ns;
	mode <= '1';
	wait for 300ns;
	red_switch <= '1';
	yellow_mod <= "00";
	---.....
end process;

end lights_behavior;