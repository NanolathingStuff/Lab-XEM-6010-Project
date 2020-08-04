library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Mod5 is 
 port(	Red: in std_logic;
	LR, LG: out std_logic);
end Mod5;

architecture mod5_behaviour of Mod5 is
signal temp1, temp2: std_logic;

begin

green: process
begin
	LG <= '0';
	wait for 50 ns;
	LG <= '1';
	wait for 50 ns;	
end process;

Red1: process
begin
	temp1 <= '0';
	wait for 50 ns;
	temp1 <= '1';
	wait for 50 ns;	
end process;

Red2: process
begin
	temp2 <= '0';
	wait for 600 ns;
	temp2 <= '1';
	wait for 600 ns;	
end process;

process(Red)
begin
	if Red = '1' then
		LR <= temp2;
	else
		LR <= temp1;
	end if;
end process;
---signal temp: std_logic_vector(3 downto 0):="0000";
--begin

 -- process(clk)
--begin
--	if clk'event and clk='1' then
--		temp <= "1111";
--		B <= temp;
--	end if;
--  end process;

end mod5_behaviour;