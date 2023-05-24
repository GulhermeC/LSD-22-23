library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ROM_16_8 is
	port( address : in std_logic_vector(3 downto 0); -- 16 pos => 4 bits
			dataOut : out std_logic_vector(7 downto 0)); -- 8 bits 
end ROM_16_8;

architecture Behavioral of ROM_16_8 is 

	subtype TDataWord is std_logic_vector(7 downto 0);
	type TROM is array (0 to 15) of TDataWord;
	constant c_memory : TROM := ( x"01", x"02", x"04", x"08",
											x"03", x"06", x"0C", x"18",
											x"07", x"0E", x"1C", x"38",
											x"0F", x"1E", x"3C", x"78");
											
	--constant c_memory : TROM := ("00000000", "00000001", "00000010", "00000011", "00000100", "00000101","00000110", "00000111", 
	--									"00001000", "00001001", "00001010", "00001011", "00001100", "00001101", "00001110", "00001111");
	
	begin
		dataOut <= c_memory(to_integer(unsigned(address)));
end Behavioral;

