library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test_lights is
	port(	Mode, RS, Enable, Reset: in std_logic;	-- signal from components: nominal or standby, red modulator, Enabler, reset to mod5
	Y: in std_logic_vector(0 to 1);		-- yellow modulator
	outR, outY, outG: out std_logic);	--outputs
end test_lights;

architecture test_behavior of test_lights is

signal modN, RedS, enab, res, MG, MR, MY, NR, NY, NG, mi, SR, SY, SG: std_logic;
signal yell, set: std_logic_vector(0 to 1):= "00"; --yellow modulator

component Lights is 
 port(	Mode, RS, Enable, Reset: in std_logic;	-- signal from components: nominal or standby, red modulator, Enabler, reset to mod5
	Y: in std_logic_vector(0 to 1);		-- yellow modulator
	MaiR, MaiY,MaiG, NorR, NorY, NorG, fi: out std_logic; --temp signal
	setting: out std_logic_vector(0 to 1); --debug
	outR, outY, outG: out std_logic);	--outputs
end component;

begin	
cpt1: Lights port map(modN, RedS, enab, res, yell, MG, MR, MY, NR, NY, NG, mi, set, SR, SY, SG);

modN <= Mode;
RedS <= RS;
enab <= Enable;
res <= Reset;
yell <= Y;



outR <= (MR and enab and not mi) or (NR and enab and not Mode) or  (SR and enab and Mode);
outY <= (MY and enab and not mi) or (NY and enab and not Mode) or  (SY and enab and Mode);
outG <= (MG and enab and not mi) or (NG and enab and not Mode) or  (SG and enab and Mode);


end test_behavior;

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
	