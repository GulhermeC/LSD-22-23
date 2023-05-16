library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DrinksFSM is
	port( C 			: in std_logic;
			v 			: in std_logic;
			reset 	: in std_logic;
			clk 		: in std_logic;
			drink 	: out std_logic);

end DrinksFSM;

architecture Behavioral of DrinksFSM is

	type TState is (st0, st1, st2, st3, st4, st5);
	signal pState, nState : TState;
	
begin
	clk_proc: process(clk, reset)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				pState <= st0;
			else
				pState <= nState;
			end if;
		end if;
	end process;
	
	comb_process: process(pState, C, V)
	begin
		drink <= '0';
		case pState is
		
			when st0 =>
				if(C='1') then
					nState <= st3;
				elsif(V='1') then
					nState <= st1;
				else
					nState <= st0;
				end if;
			
			when st1 =>
				if(C='1') then
					nState <= st4;
				elsif(V='1') then
					nState <= st2;
				else
					nState <= st1;
				end if;
			
			when st2 =>
				if(C='1') then
					nState <= st5;
				elsif(V='1') then
					nState <= st3;
				else
					nState <= st2;
				end if;
			
			when st3 =>
				if(C='1') then
					nState <= st5;
				elsif(V='1') then
					nState <= st4;
				else
					nState <= st3;
				end if;
				
			when st4 =>
				if(C='1' or V='1') then
					nState <= st5;
				else
					nState <= st4;
				end if;
				
			when st5 =>
				drink <= '1';
			
			when others =>
				nState <= st0;
			
			end case;
		end process;
	

end Behavioral;