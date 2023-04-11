library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegisterN is
	generic( size : positive := 4);
	port(	clk			: in std_logic;
			loadEn		: in std_logic;
			dataIn		: in std_logic_vector(size-1 downto 0);
			dirLeft		: in std_logic;
			sin			: in std_logic;
			dataOut		: out std_logic_vector(size-1 downto 0));
end ShiftRegisterN;

architecture Behavioral of ShiftRegisterN is
	signal s_shiftReg : std_logic_vector(size-1 downto 0);
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (loadEn = '1') then
				s_shiftReg <= dataIn;
			elsif (dirLeft = '1') then
				s_shiftReg <= s_shiftReg(size-2 downto 0) & sin;
			else
				s_shiftReg <= sin & s_shiftReg(size-1 downto 1);
			end if;
		end if;
	end process;

	dataOut <= s_shiftReg;
end Behavioral;