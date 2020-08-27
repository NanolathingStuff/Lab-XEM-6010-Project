library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.all;
	 	 
entity Lights is 
 port(	Mode, RS, Enable, Reset: in std_logic;	-- signal from components: nominal or standby, red modulator, Enabler, reset to mod5
	Y: in std_logic_vector(0 to 1);		-- yellow modulator
	MaiR, MaiY,MaiG, NorR, NorY, NorG: out std_logic; --temp signal
	outR, outY, outG: out std_logic);	--outputs
end Lights;
    
architecture Lights_behavior of Lights is
-- signal/consts
signal RedS, Signal5R, MG, INP, MR, MY, mod_n, NR, NY, NG: std_logic;
signal yell: std_logic_vector(0 to 1); --yellow modulator
-- Components
--component Normal is 

component Custom_counter is 
   port( Input: in std_logic;
 	 Mode: in std_logic_vector(0 to 1);
	 Y, R: out std_logic);
end component;

component Mod5 is 
  port(	Red: in std_logic;
	LR, LG: out std_logic);
end component;

component Normal is
port(	Mode: in std_logic;
	Red, Yellow, Green: out std_logic);
end component;

begin	--muy importante
cptM1: Mod5 port map(RedS, Signal5R, MG);
cptM2: Custom_counter port map(INP, yell, MY, MR);
cprN: Normal port map(mod_n, NR, NY, NG);
-- behaviour
RedS <= RS; --Red signal switch modulator
INP <= Signal5R; --half-red signal
yell <= Y; --Yellow signal switch modulator
mod_n <= Mode;

--process
--begin
--	LightR <= LR and Enable;
	--outY <= LY and Enable;
	--outG <= LG and Enable;
--end process;
	MaiR <= MR and Enable; 
	MaiY <= MY and Enable;
	MaiG <= MG and Enable; 
	NorR <= NR and Enable; 
	NorY <= NY and Enable;	
	NorG <= NG and Enable; 

process(Mode, Reset)
	--default = Maintenence, if Mode'event --> normal
begin
	if (falling_edge(Reset)) and (not mode'event)  then -- maintenence
--	if reset = '0' then
		outR <= MR and Enable; 
		outY <= MY and Enable;
		outG <= MG and Enable; 
	--end if;  
	else
		if mode'event then --normal	
			outR <= NR and Enable; 
			outY <= NY and Enable;	
			outG <= NG and Enable; 		
		else	--start as maintenence
			outG <= MG and Enable; 
			outR <= MR and Enable; 
			outY <= MY and Enable;
		end if;
	end if;

end process;


end Lights_behavior;

-- 1 entit� --> 1 arhitettura

-- CONTINUA DA LEZIONE 8.2 ore 0:00
-- Come aprire compilatore ?
	-- file -> new -> project: apre nuovo progetto
	-- add files tramite finestra di dialogo
-- simulate, in folder "Work" = entit� compilate
	-- simulate -> start simulation -> seleziona entit� compilata da simulare
	-- se fatto tutto bene, risulta in cartella work.
-- alcune non simulano, vedi testMyComp2 come esempio che funge
-- right click on test --> add wave to simulate
-- remi tasto di fiano ns per fare plotting

-- label : entit� port map(collega segnali a entit� dichiarat)e
-- ogni componente ha entit� ed architettura
-- usa chiave "generic" per generalizzare (global var)
-- usa enable/reset dove possibile
-- if else permesso, usato su un fornte
-- entit�: simbolo e ports; architettura: algoritmo circuito.
-- se ti servono componenti che hai definito altrove, usi component
-- Sintassi:
	-- entity NOME ENTIT� is(
	-- [generics, ports, declarations]
	-- [begin STATEMENT]);
	-- end NOME ENTIT�;
	-- architecture NOME of NOME ENTIT� is
	-- begin ALGORITMO;
	-- end NOME;
-- 
---components: hb_halfadder, VHDL_exercise1.pdf
	