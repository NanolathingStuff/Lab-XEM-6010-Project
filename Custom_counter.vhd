library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
	
--https://en.wikibooks.org/wiki/VHDL_for_FPGA_Design/4-Bit_BCD_Counter_with_Clock_Enable
--https://www.intel.com/content/www/us/en/programmable/quartushelp/13.0/mergedProjects/hdl/vhdl/vhdl_pro_counters.htm

--FAI: counter con reset, mode(yellow) e signal_input(half_red), il counter conta i signal da 1 a 3, a seconda del mode, 
-- ogni X resetta il counter e metti segnale di uscita (sia giallo che rosso?); se reset/mode cambia, conto == 0?
 	

entity Custom_counter is 
   port( Input: in std_logic; --, Reset
 	 Mode: in std_logic_vector(0 to 1);
	 --Outp: out std_logic_vector(0 to 1);
	 Y, R: out std_logic);
end Custom_counter;

architecture counter_behavior of Custom_counter is

signal temp: std_logic_vector(0 to 1):="00"; --initialize at 0 ---signal x,y,z: std_logic:='0';
--signal tempR: std_logic_vector(0 to 1);

begin   
--handle input
--Outp <= temp;
process(Input, Mode)--Reset,
begin
	--if (rising_edge(Reset)) then --event how to?
	--	temp <= "00";
	--end if;

	--if(rising_edge(Input)) then
	--if Input'event then
	if Input = '1' then
           if temp="11" then
              temp<="00";
           else
              temp <= temp + 1;
           end if;
	   --if tempR="11" then
           --   tempR<="00";
           --else
            --  tempR <= tempR + 1;
           --end if;
        end if;

--end process;

--handle output
--process(Mode)	
--begin	--temp: 0, 0.5, 1, 1.5
	--take 00 as 0.5 and 11 as 2
	--Red
	if temp = "10" or temp = "00" then
			R <= '0';
		else
			R <= '1';
	end if;
	--Yellow
	if Mode = "00" then	--Y = 1/2R
		--if temp'event then--if temp = "00" or temp = "10" then
		Y <= Input;	--Y <= '1';
		--else
		--	Y <= '0';
		--end if; 
	else if Mode = "01" then	-- R = Y
		if temp = "11" or temp = "01" then
			Y <= '1';
		else
			Y <= '0';
		end if; 
	      else		-- Y = 2R
		if temp = "01" or temp = "10" then-- double length --if temp = "00" then
			Y <= '1';
		else
			Y <= '0';
		end if;
	     end if;	
	end if;
	
end process;

end counter_behavior;
 
--entity counter is
--    generic ( Nb : integer) ;
--    port( T           :in std_logic; --enable, reset:in std_logic;
--          clk         :in std_logic; 
--          OUT_COUNT   :out std_logic_vector(Nb-1 downto 0)
--    );
--    end counter;  

--architecture counter_behavior of counter is
		
--constant ovf1: std_logic_vector(Nb-1 downto 0):=(others => '1');
   
--begin
    
 --  process(clk) --process(clk, reset)
 --  variable count: std_logic_vector(Nb-1 downto 0):=(others => '0');
 --  begin
    --if reset='1' then
             --count:=(others => '0');     
 --        if clk'event and clk='1' then 
 --           if T='1' then
         	   
 --            if count=ovf1 then 
 --                count := (others => '0');
 --               else 
--                 count := count + '1';
 --                end if;
                 
--             else count := count;
                 
 --            end if; -- T='1'
 
 --        end if; --'clk'event
       --end if; -- reset
--       out_count<=count;        
      
--      end process;
--end counter_behavior;

--entity Counter2_VHDL is 
 --  port( Clock_enable_B: in std_logic;
 --	 Clock: in std_logic;
 --	 Reset: in std_logic;
 --	 Output: out std_logic_vector(0 to 3));
--end Counter2_VHDL;
--architecture Behavioral of Counter2_VHDL is
--   signal temp: std_logic_vector(0 to 3);
--begin   process(Clock,Reset)
--   begin
--      if Reset='1' then
--         temp <= "0000";
--      elsif(rising_edge(Clock)) then
--         if Clock_enable_B='0' then
 --           if temp="1001" then
 --              temp<="0000";
--            else
--               temp <= temp + 1;
--            end if;
--         end if;
--      end if;
--   end process;
--   Output <= temp;
--end Behavioral;