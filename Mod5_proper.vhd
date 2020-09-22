library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Clock_counter is 
   port( Mode: in std_logic;
	 G, R: out std_logic);
end Clock_counter;

architecture counter_behavior of Clock_counter is

signal clk: std_logic;
signal temp: std_logic_vector(0 to 4):="00000";

component clk_generator is
    port(clock_out: out std_logic);
end component;

begin

process(clk)--Reset,
	begin
	if clk = '1' then --30 = 300ns
           if temp= "11110" then
              temp <= "00000";
           else
              temp <= temp + 1;
           end if;
        end if;

	if temp = "00101" or temp = "01010" or temp = "01101" or temp = "10010" or temp = "11001" or temp = "11110" then --every 5 green
			R <= '0';
		else
			R <= '1';
	end if;
	--Red
	if Mode = '0' then	--25ns
		R <= '0';	 --TOEND
	else	-- 300
		if temp= "11110" then
			R <= '1';
		else
			R <= '0';
		end if; 
	end if;
	
end process;


end counter_behavior;