library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux2_1 is
	port(	dataIn0	: in std_logic;
			dataIn1	: in std_logic;
			sel		: in std_logic;
			dataOut	: out std_logic);
end Mux2_1;

Architecture BehavProcess of Mux2_1 is
begin
--only works for sim not hardware
	process(sel,dataIn0, dataIn1)
	begin
		if(sel='0') then
			dataOut <= dataIn0;
		else
			dataOut <= dataIn1;
		end if;
	end process;
end BehavProcess;

architecture BehavMux2_1 of Mux2_1 is
begin
	dataOut <= 	dataIn0 when (sel = '0') else
					dataIn1 when (sel = '1') else
					'0';
end BehavMux2_1