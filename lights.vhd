library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.all;
	 	 
entity Lights is 
 port(	Mode, RS, Enable, Reset: in std_logic;	-- signal from components: nominal or standby, red modulator, Enabler, reset to mod5
	Y: in std_logic_vector(0 to 1);		-- yellow modulator
	LightR, LightG, LightV: out std_logic);	--outputs
end Lights;
    
architecture Lights_behavior of Lights is
-- signal/consts
signal RedS, Signal5R, Signal5G: std_logic;
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
cptM1: Mod5 port map(RedS, Signal5R, Signal5G);
cptM2: Custom_counter port map(INP, LR, LG);
-- behaviour
RedS <= RS; --Red signal switch modulator


LightG <= Signal5G --output green TO END
--process
--begin
--	LightR <= LR and Enable;
	--LightY <= LY and Enable;
	--LightG <= LG and Enable;
--end process;

end Lights_behavior;

-- 1 entità --> 1 arhitettura

-- CONTINUA DA LEZIONE 8.2 ore 0:00
-- Come aprire compilatore ?
	-- file -> new -> project: apre nuovo progetto
	-- add files tramite finestra di dialogo
-- simulate, in folder "Work" = entità compilate
	-- simulate -> start simulation -> seleziona entità compilata da simulare
	-- se fatto tutto bene, risulta in cartella work.
-- alcune non simulano, vedi testMyComp2 come esempio che funge
-- right click on test --> add wave to simulate
-- remi tasto di fiano ns per fare plotting

-- label : entità port map(collega segnali a entità dichiarat)e
-- ogni componente ha entità ed architettura
-- usa chiave "generic" per generalizzare (global var)
-- usa enable/reset dove possibile
-- if else permesso, usato su un fornte
-- entità: simbolo e ports; architettura: algoritmo circuito.
-- se ti servono componenti che hai definito altrove, usi component
-- Sintassi:
	-- entity NOME ENTITà is(
	-- [generics, ports, declarations]
	-- [begin STATEMENT]);
	-- end NOME ENTITÃ;
	-- architecture NOME of NOME ENTITÃ is
	-- begin ALGORITMO;
	-- end NOME;
-- 
---components: hb_halfadder, VHDL_exercise1.pdf
	