library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.all;
	 	 
entity Lights is 
 port(	RS, YS, GS, Enable: in std_logic;	-- signal from components
	LightR, LightG, LightV: out std_logic);
end Lights;
    
architecture Lights_behavior of Lights is
-- signal/consts
-- Components
component Maintenence is 
port(	Enabler, Red: in std_logic;
	Yellow: in std_logic_vector(0 to 1); 
	LR, LY, LG: out std_logic);
end component;

--component Normal is 

begin	--muy importante
-- behaviour

--process
--begin
--	LightR <= LR and Enable;
	--LightY <= LY and Enable;
	--LightG <= LG and Enable;
--end process;

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
	