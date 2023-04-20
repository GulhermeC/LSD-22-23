library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TimerProj is
port(		KEY		:	in std_logic_vector(1 downto 0);
			CLOCK_50	: 	in std_logic;
			LEDG		:  out std_logic_vector(0 downto 0);
			LEDR		:  out std_logic_vector(0 downto 0);
			HEX1		:	out std_logic_vector(6 downto 0);
			HEX0		:	out std_logic_vector(6 downto 0));
end TimerProj;

architecture Structural of TimerProj is

	signal s_binOut				:	unsigned(6 downto 0);
	signal decOut_1, decOut_2 	:	std_logic_vector(3 downto 0);
	signal s_clk					:  std_logic;
	signal s_key1, s_key2		:  std_logic;
	
begin

	process(CLOCK_50)
	
		begin
			if rising_edge(CLOCK_50) then
				s_key1 <= not KEY(1);
				s_key2 <= not KEY(0);
			end if;
		end process;	
				
	timer_core:					entity work.Timer(Behav)
										port map(enable 	=> s_key1,
													reset 	=>	s_key2,
													ready		=> LEDG(0),
													l_count  => LEDR(0),
													clk 		=> s_clk,
													unsigned(binOut) 	=> s_binOut);
		
													
	Pulse_core:					entity work.FreqDivider(Behavioral)
										port map(clkIn 	=> CLOCK_50,
													clkOut 	=> s_clk);
											
	Bin2BCD_core:				entity work.Bin2BCDDecoder(Behavioral)
										port map(inBin 	=> std_logic_vector(s_binOut),
													outBCD 	=> decOut_1,
													outBCD2 	=> decOut_2);
										
	Bin7Seg_core1:				entity work.bin7Seg(Behavioral)
										port map( binInput => decOut_1,
														decOut_n => HEX0);
	
	Bin7Seg_core2:				entity work.bin7Seg(Behavioral)
										port map( binInput => decOut_2,
														decOut_n => HEX1);
														

end Structural;