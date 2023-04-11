library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CombShiftUnit_Demo is
	port( SW 	: in std_logic_vector(10 downto 0);
			KEY 	: in std_logic_vector(2 downto 0);
			LEDR	: out std_logic_vector(7 downto 0));
end CombShiftUnit_Demo;

architecture Struct of CombShiftUnit_Demo is
begin
	combshift: entity work.CombShifter(Behavioral)
	port map(
				dataIn => SW(7 downto 0),	
				dirLeft => not KEY(1),	
				shArith => not KEY(2),		
				rotate => not KEY(0),		
				shAmount => SW(10 downto 8),		
				dataOut => LEDR(7 downto 0));
end Struct;