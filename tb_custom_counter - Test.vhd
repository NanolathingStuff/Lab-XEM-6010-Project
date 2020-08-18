library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tb_counter is
  end tb_counter;
    
architecture tb_counter_behavior of tb_counter is

component Custom_counter is 
   port( Input, Reset: in std_logic;
 	 Mode: in std_logic_vector(0 to 1);
 	 Outp: out std_logic_vector(0 to 1));--Y, R: out std_logic );
end component;
--component Counter2_VHDL is 
--   port( Clock_enable_B: in std_logic;
--	 Clock: in std_logic;
-- 	 Reset: in std_logic;
-- 	 Output: out std_logic_vector(0 to 3));
--    end component;

component clk_generator is
    port(clock_out: out std_logic);
    end component;

--signal enable, clock, reset, Clock_out: std_logic;
--signal output: std_logic_vector(0 to 3);
signal input, reset, Clock_out: std_logic; --, yellow, red
signal mode, ou: std_logic_vector(0 to 1);

begin

--c1: Counter2_VHDL port map(enable, clock, reset, output);
c1: Custom_counter port map (input, reset, mode, ou);
c2: clk_generator port map (Clock_out);

--clock <= Clock_out;
input<= Clock_out;

process
begin
	Reset <= '0';
	mode <= "00"; wait for 100 ns;  
	--mode <= "10"; wait for 100 ns; 
	--enable <= '1'; 
	Reset <= '1'; wait for 200 ns;  
	Reset <= '0'; wait for 200 ns;
	mode <= "01"; wait for 100 ns;
--	enable <= '0'; 
--	Reset <= '0'; wait for 100 ns;  
end process;
   

end tb_counter_behavior;