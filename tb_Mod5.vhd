library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tb_Mod5 is
end tb_Mod5;

architecture Mod5_Controls_behavior of tb_Mod5 is

component Mod5 is 
  port(	Red: in std_logic;
	LR, LG: out std_logic);
end  component;

signal Mode, LR, LG: std_logic;

begin 

funct: process
begin
	Mode <= '0'; wait for 1 us;	--every 50ns
	Mode <= '1'; wait for 2 us;	--every 600ns
end process;

cpt: Mod5 port map(Mode, LR, LG);


end Mod5_Controls_behavior;