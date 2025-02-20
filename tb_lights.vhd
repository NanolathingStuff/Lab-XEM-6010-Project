library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tb_lights is
end tb_lights;

architecture lights_behavior of tb_lights is

component Lights is 
 port(	Mode, RS, Enable, Reset: in std_logic;	-- signal from components: nominal or standby, red modulator, Enabler, reset to mod5
	Y: in std_logic_vector(0 to 1);		-- yellow modulator
	--MaiR, MaiY,MaiG, NorR, NorY, NorG, fi: out std_logic; --temp signal 
	--setting: out std_logic_vector(0 to 1); --debug
	outR, outY, outG: out std_logic);	--outputs

end component;

signal mode, red_switch, enable, reset, RED, YELLOW, GREEN: std_logic; --,  MR, MY, MG, NR, NY, NG, C_if, 
signal yellow_mod: std_logic_vector(0 to 1); --, set

begin

cpt_mod: Lights port map (mode, red_switch, enable, reset, yellow_mod,  RED, YELLOW, GREEN);--, ou  MR, MY, MG, NR, NY, NG, MR, MY, MG, NR, NY, NG, C_if, set,

process
begin
	
	enable <= '0'; --disabled
	red_switch <= '0';
	yellow_mod <= "00";
	reset <= '0';
	wait for 200 ns; --maintenence
	enable <= '1';
	yellow_mod <= "01";
	wait for 600 ns;
	yellow_mod <= "00";
	red_switch <= '1';
	wait for 600 ns;
	yellow_mod <= "11";
	wait for 800 ns;
	red_switch <= '0';
	mode <= '1'; --begin normal at 2200
	wait for 800 ns;
	red_switch <= '1';
	yellow_mod <= "00";
	wait for 400 ns;
	yellow_mod <= "11";
	wait for 600 ns;
	mode <= '0';	
	red_switch <= '0';
	yellow_mod <= "00";	
	wait for 1000 ns;
	reset <= '1';
	yellow_mod <= "01";
	wait for 800 ns; --return maintenence at 5800
	reset <= '0';
	wait for 2000 ns;
	enable <= '0'; --disabled again
	wait for 200 ns;
	enable <= '0';
	-- cicle end after 8000 ns
	wait for 50 ns;
	reset <= '1'; 
	wait for 100 ns;
	enable <= '1'; 
	red_switch <= '0';
	yellow_mod <= "00";
	reset <= '0';
	mode <= '1'; 
	wait for 400 ns; --Nominal
	mode <= '0'; 
	enable <= '0';
	wait for 100 ns; 
	enable <= '1';
	yellow_mod <= "01";
	wait for 200 ns;
	mode <= '1';  --Standby
	wait for 300 ns;
	enable <= '0';
	wait for 300 ns; 
	enable <= '1';
	reset <= '1';
	wait for 50 ns; --Maintenence
	reset <= '0';
	wait for 200 ns; --Nominal again
	mode <= '0';	
	wait for 100 ns;
	reset <= '1';
	mode <= '1';
	wait for 50 ns; 
	--cicle end 4400ns
	enable <= '0'; --disabled
	red_switch <= '0';
	yellow_mod <= "00";
	reset <= '0';
	wait for 200 ns; --maintenence
	enable <= '1';
	wait for 600 ns;
	yellow_mod <= "01";
	wait for 600 ns;
	yellow_mod <= "11";
	wait for 600 ns;
	yellow_mod <= "00";
	red_switch <= '1';
	reset <= '1';
	wait for 1000 ns;
	yellow_mod <= "10";
	wait for 1000 ns;
	yellow_mod <= "01";
	wait for 900 ns;
	enable <= '0'; 
	mode <= '1';
	wait for 100 ns;
	--cicle end 5000ns

end process;

end lights_behavior;