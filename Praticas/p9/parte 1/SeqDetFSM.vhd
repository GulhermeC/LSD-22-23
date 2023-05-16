--Xin: 	0010001001000110100100100010011001000100100100100
--Yout: 0000000001000000000100100000010001000000100100100 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SeqDetFSM is
	port(	reset 	: 	in std_logic;
			clk 		: 	in std_logic;
			xIn 		: 	in std_logic;
			yOut 		: 	out std_logic);

end SeqDetFSM;

architecture Behav of SeqDetFSM is
	type state is (A, B, C, D);
	signal PS, NS : state;

begin
	sync_proc: process(clk)
begin

	if (rising_edge(clk)) then
		if (reset = '1') then
			PS <= A;
		else
			PS <= NS;
		end if;
	end if;

end process;

	comb_proc : process(PS, xIn)
begin

	yOut <= '0'; 	-- Frequent output value, could appear
						-- in all “when” statements, but would require more code
	case PS is
		when A =>
			if (xIn = '1') then NS <= B;
			else NS <= A;
			end if;

		when B =>
			if (xIn = '0') then NS <= C;
			else NS <= B;
			end if;

		when C =>
			if (xIn = '0') then NS <= D;
			else NS <= B;
			end if;

		when D =>
			if (xIn = '1') then
				NS <= B;
				yOut <= '1'; -- Mealy output
			else NS <= A;
			end if;

		when others => -- Catch all condition
			NS <= A;
	end case;

end process;

end Behav;