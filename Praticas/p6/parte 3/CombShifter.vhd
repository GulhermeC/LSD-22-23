library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CombShifter is
	port(	dataIn		: in std_logic_vector(7 downto 0);
			dirLeft		: in std_logic;
			shArith		: in std_logic;
			rotate		: in std_logic;
			shAmount		: in std_logic_vector(2 downto 0);
			dataOut		: out std_logic_vector(7 downto 0));
end CombShifter;

architecture Behavioral of CombShifter is
	signal s_shAmount : integer;
begin
	s_shAmount <= to_integer(unsigned(shAmount));
	
	process(dataIn, dirLeft, s_shAmount)
	begin
		if(shArith = '1') then
			if (dirLeft = '1') then
				dataOut <= std_logic_vector(shift_left(signed(dataIn), s_shAmount));
			else
				dataOut <= std_logic_vector(shift_right(signed(dataIn), s_shAmount));
			end if;
		elsif(rotate = '1') then
			if (dirLeft = '1') then
				dataOut <= std_logic_vector(rotate_left(unsigned(dataIn), s_shAmount));
			else
				dataOut <= std_logic_vector(rotate_right(unsigned(dataIn), s_shAmount));
			end if;
		else
			if (dirLeft = '1') then
				dataOut <= std_logic_vector(shift_left(unsigned(dataIn), s_shAmount));
			else
				dataOut <= std_logic_vector(shift_right(unsigned(dataIn), s_shAmount));
			end if;
		end if;
	end process;
end Behavioral;