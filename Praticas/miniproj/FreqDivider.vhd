library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity FreqDivider is
	generic(K : natural :=2);
	port( clkIn	: in std_logic;
			clkOut : out std_logic);
end FreqDivider;


architecture Behavioral of FreqDivider is
	signal s_counter	: unsigned(25 downto 0):= (others => '0');
	constant max_count: unsigned(25 downto 0):= to_unsigned(50000000-1, 26);
	
begin
	process(clkIn)
	begin
		if(rising_edge(clkIn)) then
			s_counter <= s_counter+1;
			if s_counter = max_count then
				s_counter <= (others => '0');
				clkOut <= '1';
			else
				clkOut <= '0';
			end if;
		end if;
	end process;

end Behavioral;