library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tb_Normal is
end tb_Normal;

architecture tb_Normal_behavior of tb_Normal is

component Normal is
port(	Mode: in std_logic;
	Red, Yellow, Green: out std_logic);
end component;

signal M, RED, YELLOW, GREEN: std_logic;

begin

signals: process --intervals switching mode
       begin
	M <= '0'; wait for 400 ns;	--nominal
	M <= '1'; wait for 400 ns;	--standby
end process;

cpt: Normal port map(M, RED, YELLOW, GREEN);
 --se servissero anche gli altri componenti?
end tb_Normal_behavior;