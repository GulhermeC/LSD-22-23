library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RAM_1P_N is
	generic(	addr 	: 	integer := 8;
				data	:	integer := 4);
	port(	clk			:	in std_logic;
			writeEnable	:	in std_logic;
			address		:	in std_logic_vector(addr-1 downto 0);
			writeData	:	in std_logic_vector(data-1 downto 0);
			readData		:	out std_logic_vector(data-1 downto 0));

end RAM_1P_N;


architecture Behavioral of RAM_1P_N is

	type ram is array(0 to (2**addr-1)) of std_logic_vector(0 to (data-1));
	signal memory : ram;
begin

	process(clk)
	begin
	
		if(rising_edge(clk)) then
			if(writeEnable='1') then
				memory(to_integer(unsigned(address))) <= writeData;
			end if;
		end if;
	end process;

	readData <= memory(to_integer(unsigned(address)));
	
end Behavioral;