------FROM DECODER 4x16 Entity and RTL 
library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity encoder4x2 is
     port (D : in std_logic_vector(1 downto 0); 
	OUT_DATA: out std_logic);
     end encoder4x2;
        
architecture encoder4x2_behav of encoder4x2 is
--signal en00, en01, en10, en11: std_logic;
     begin
	with D select
OUT_DATA <= '0' when "00",
'0' when "11",
'1' when others;

end encoder4x2_behav;