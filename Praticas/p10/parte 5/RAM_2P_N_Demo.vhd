library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RAM_2P_N_Demo is

	port(	KEY	:	in std_logic_vector(0 downto 0);
			SW		:	in std_logic_vector(17 downto 0);
			LEDG	:	out std_logic_vector(3 downto 0));

end RAM_2P_N_Demo;


architecture Structural of RAM_2P_N_Demo is

begin

	ram:	entity work.RAM_2P_N(Behavioral)
				generic map(data => 4,
								addr => 2)
				port map(clk => KEY(0),
							writeEnable => SW(0),
							writeData => SW(17 downto 14),
							writeAddress => SW(2 downto 1),
							readAddress => SW(4 downto 3),
							dataOut => LEDG(3 downto 0));

end Structural;