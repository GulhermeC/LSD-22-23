library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity AdderN is
	generic(N 	: positive := 4);
	port(	operand0 	: in std_logic_vector(N-1 downto 0);
			operand1		: in std_logic_vector(N-1 downto 0);
			res			: out std_logic_vector(N-1 downto 0));
end AdderN;

architecture Behavioral of AdderN is
begin
	res <=std_logic_Vector(unsigned(operand0)+unsigned(operand1));
end Behavioral;