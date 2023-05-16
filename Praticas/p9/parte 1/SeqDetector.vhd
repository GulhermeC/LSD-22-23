library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SeqDetector is
	port(	CLOCK_50	:	in std_logic;
			SW			:	in std_logic_vector(1 downto 0);
			LEDR		:	out std_logic_vector(0 downto 0);
			LEDG		:	out std_logic_vector(0 downto 0));
			
end SeqDetector;

architecture Shell of SeqDetector is

	signal s_clk	:	std_logic;

begin

	LEDG(0) <= s_clk;

	clk_div: entity Work.ClkDividerN(Behavioral)
					generic map(divFactor => 200000000)
					port map(clkIn => CLOCK_50,
								clkOut=> s_clk);
								
	seqdetFSM_mealy:	entity Work.SeqDetFSM(Behav)
								port map(xin => SW(0),
											reset => SW(1),
											yout => LEDR(0),
											clk => s_clk);

end Shell;