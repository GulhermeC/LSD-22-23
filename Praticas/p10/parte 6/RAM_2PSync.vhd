library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RAM_2PSync is

	port(	writeClk			:	in std_logic;
			writeEnable		:	in std_logic;
			writeAddress	:	in std_logic_vector(3 downto 0);
			writeData		:	in std_logic_vector(7 downto 0);
			readClk			:	in std_logic;
			readAddress		:	in std_logic_vector(3 downto 0);
			readData			:	out std_logic_vector(7 downto 0));

end RAM_2PSync;


architecture Behavioral of RAM_2PSync is

	type ram is array (0 to 15) of std_logic_vector(7 downto 0);
	signal memory	:	ram;
	
begin

	process(writeClk)
	begin
	
		if(rising_edge(writeClk)) then
			if(writeEnable='1') then
				memory(to_integer(unsigned(writeAddress))) <= writeData;
			end if;
		end if;
	
	end process;
	
	process(readClk)
	begin
	
		if(rising_edge(readClk)) then
			readData <= memory(to_integer(unsigned(readAddress)));
		end if;
	
	end process;

end Behavioral;