library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register8 is
	port(	dataIN 	:	in std_logic_vector(7 downto 0);
			wrEn		: in std_logic;
			clk		: in std_logic;
			reset		: in std_logic;
			dataOut	: out std_logic_vector(7 downto 0));
end Register8;



architecture Behavioral of Register8 is
begin
	
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset='1') then
				dataOut <= (others => '0');
			elsif(wrEn='1') then
				dataOut <= dataIn;
			end if;
		end if;
	end process;
	
end Behavioral;