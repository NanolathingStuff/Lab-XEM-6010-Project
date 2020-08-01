-- Can't put wait statements in IF 
--> do an Enabler for everypossible combination
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;

entity Enabler is 
 port(LR, LY, LG: out std_logic);
end Enabler;
