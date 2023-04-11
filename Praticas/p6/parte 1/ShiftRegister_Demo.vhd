library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ShiftRegister_Demo is
	port( CLOCK_50 : in std_logic;
			SW : in std_logic_vector(9 downto 0);
			KEY : in std_logic_vector(0 downto 0);
			LEDR: out std_logic_vector(7 downto 0));
end ShiftRegister_Demo;

architecture Struct of ShiftRegister_Demo is
	signal clock : std_logic;
begin	
	divider: entity work.ClkDividerN(Behavioral)
	generic map (divFactor => 50000000)
	port map(	clkIn => CLOCK_50,
					clkOut => clock);
	
	registo: entity work.ShiftRegisterN(Behavioral)
	generic map (size => 8)
	port map(
			clk	=> clock,
			loadEn => not KEY(0),
			dataIn => SW(7 downto 0),
			dirLeft => SW(8),
			sin => SW(9),
			dataOut => LEDR(7 downto 0));
	
end Struct;