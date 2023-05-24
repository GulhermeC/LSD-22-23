library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RAM_2P_N is
	
	generic(	addr 	: 	natural := 4;
				data	:	natural := 8);
	port(	clk			:	in std_logic;
			writeEnable	:	in std_logic;
			writeData	:	in std_logic_vector(data-1 downto 0);
			readAddress	:	in std_logic_vector(addr-1 downto 0);
			writeAddress:	in std_logic_vector(addr-1 downto 0);
			dataOut		:	out std_logic_vector(data-1 downto 0));

end RAM_2P_N;

architecture Behavioral of RAM_2P_N is

	type ram is array(0 to (2**addr-1)) of std_logic_vector(data-1 downto 0);
	signal memory	:	ram;

begin

	process(clk)
	begin
	
		if(rising_edge(clk)) then
			memory(to_integer(unsigned(writeAddress))) <= writeData;
		end if;
	
	end process;
	
	dataOut <= memory(to_integer(unsigned(readAddress)));

end Behavioral;