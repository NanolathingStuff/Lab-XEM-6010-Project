library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tb_lights is
end tb_lights;

architecture lights_behavior of tb_lights is

component Lights is 
 port(	Mode, RS, Enable, Reset: in std_logic;	-- signal from components: nominal or standby, red modulator, Enabler, reset to mod5
	Y: in std_logic_vector(0 to 1);		-- yellow modulator
	MaiR, MaiY,MaiG, NorR, NorY, NorG: out std_logic; --temp signal
	outR, outY, outG: out std_logic);	--outputs
end component;

signal mode, red_switch, enable, reset, GREEN, YELLOW, RED, MR, MY, MG, NR, NY, NG: std_logic;
signal yellow_mod: std_logic_vector(0 to 1);

begin

cpt_mod: Lights port map (mode, red_switch, enable, reset, yellow_mod, MR, MY, MG, NR, NY, NG, RED, YELLOW, GREEN);--, ou

process
begin
	
	enable <= '0'; --disabled
	red_switch <= '0';
	yellow_mod <= "00";
	reset <= '0';
	wait for 100 ns; --maintenence
	enable <= '1';
	yellow_mod <= "01";
	wait for 300 ns;
	yellow_mod <= "00";
	red_switch <= '1';
	wait for 400 ns;
	yellow_mod <= "11";
	wait for 600 ns;
	red_switch <= '0';
	mode <= '1'; --begin normal at 1200
	wait for 300 ns;
	red_switch <= '1';
	yellow_mod <= "00";
	wait for 300 ns;
	yellow_mod <= "11";
	wait for 300 ns;
	mode <= '0';	
	red_switch <= '0';
	yellow_mod <= "00";	
	wait for 300 ns;
	reset <= '1';
	yellow_mod <= "01";
	wait for 300 ns; --return maintenence at 2400
	reset <= '0';
	wait for 300 ns;
	enable <= '0'; --disabled again
	wait for 100 ns;
	-- cicle end after 2800 ns
end process;

end lights_behavior;