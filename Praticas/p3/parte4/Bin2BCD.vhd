library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Bin2BCD is
	port( inBin	:	in std_logic_vector(3 downto 0);
			outBCD:	out std_logic_Vector(3 downto 0);
			outBCD2: out std_logic_Vector(3 downto 0));

end Bin2BCD;

architecture Behavioral of Bin2BCD is

signal n : unsigned(3 downto 0);

begin

n <= unsigned(inBin);

	process(inBin, n)
	begin
	if(n<="1010") then
		outBCD <= inBin;
		outBCD2 <= "0000";
	else
		if(n="1010") then
			outBCD <= "0000";
			outBCD2 <= "0001";
		elsif(n="1011") then
			outBCD <= "0001";
			outBCD2 <= "0001";
		elsif(n="1100") then
			outBCD <= "0010";
			outBCD2 <= "0001";
		elsif(n="1101") then
			outBCD <= "0011";
			outBCD2 <= "0001";
		elsif(n="1110") then
			outBCD <= "0100";
			outBCD2 <= "0001";
		else
			outBCD <= "0101";
			outBCD2 <= "0001";
		end if;
	end if;
	end process;
	
-- hex to decimal (12/10 = 1 rest 2 => 0010 0001)
-- to unsigned(10 = decimal , 4 = n bits)
-- s_dez <= to_unsigned(10,4)
-- s_int <= unsigned(bindata)/s_dez;
-- s_rem <= unsigned(bindata) rem s_dez;
-- dec_out_l <= std_logic_Vector (s_rem);
-- dec_out_h <= std_logic_vector (s_int);

end Behavioral;
			