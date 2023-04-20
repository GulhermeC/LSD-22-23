library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity Timer is
generic( N : positive := 1000000); -- frequencia = 50 Mhz 
port( reset 	: in std_logic;
		clk		: in std_logic;
		enable 	: in std_logic;
		ready		: out std_logic;
		l_count  : out std_logic; 
		binOut	: out std_logic_vector(6 downto 0));
		
end Timer;

architecture Behav of Timer is
	
	signal s_count : unsigned(6 downto 0) := "0111011";
	signal s_status : std_logic := '0';

begin

	assert( N >= 2);
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				s_count <= "0111011";
				ready <= '1';
				l_count <= '0';
			elsif(s_status='1') then
				if(s_count = "0000000") then
					s_count <= "0111011";
					ready <= '1';
					s_status <= '0';
					l_count <= '0';
				else
					s_count <= s_count - 1;
					l_count <= '1';
					ready <= '0';
				end if;
			end if;
			if(enable='1') then
				if(s_status='0') then
					s_status<='1';
					ready <= '0';
					l_count <= '1';
				else
					s_status<='0';
					l_count <= '0';
					ready <= '0';
				end if;
			end if;
		end if;
		
		binOut <= std_logic_vector(s_count);
	end process;

end Behav;