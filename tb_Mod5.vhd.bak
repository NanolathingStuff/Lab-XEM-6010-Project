library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity Mod5_Controls is
end Mod5_Controls;

architecture Mod5_Controls_behavior of Mod5_Controls is

component Mod5 is 
  port(	Red: in std_logic;
	LR, LG: out std_logic);
end  component;

signal Mode, L1, L2: std_logic;

begin 

funct: process
begin
	Mode <= '0'; wait for 200 ns;	--every 50ns
	Mode <= '1'; wait for 200 ns;	--every 600ns
end process;

cpt: Mod5 port map(Mode, L1, L2);


end Mod5_Controls_behavior;