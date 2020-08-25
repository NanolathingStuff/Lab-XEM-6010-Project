library ieee;
use ieee.std_logic_1164.all;

entity tb_Normal is
end tb_Normal;

architecture tb_Normal_behavior of tb_Normal is

component Normal is 
  port(	Mode: in std_logic;
	LR, LY, LG: out std_logic);
end component;

signal Mode, L1, L2, L3: std_logic;

begin

signals: process --intervals switching mode
       begin
	Mode <= '0'; wait for 400 ns;	--nominal
	Mode <= '1'; wait for 400 ns;	--standby
end process;

cpt: Normal port map(Mode, L1, L2, L3);
--se servissero anche gli altri componenti?
end tb_Normal_behavior;