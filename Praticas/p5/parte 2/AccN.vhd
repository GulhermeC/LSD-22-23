library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity AccN is
	generic ( N		: positive := 4);
	port( dataIn	: in std_logic_vector(N-1 downto 0);
			enable	: in std_logic;
			reset		: in std_logic;
			clk		: in std_logic;
			dataOut	: out std_logic_vector(N-1 downto 0));
	
end AccN;

architecture Structural of AccN is

	signal s_adderOut, s_regOut : std_logic_vector(N-1 downto 0);

begin

	Registo: entity work.RegN(Behavioral)
	generic map (N => N)
	port map ( 	clk => clk,
					reset => reset,
					enable => enable,
					dataIn => s_adderOut,
					dataOut => s_regOut);
					
	Somador: entity work.AdderN(Behavioral)
	generic map (N => N)
	port map ( 	operand0 => dataIn,
					operand1 => s_regOut,
					res => s_adderOut);
					
	dataOut <= s_regOut;
	
	
end Structural;

--architecture Behav of AccN is
--		signal s_dataout : unsigned(N-1 downto 0)
--begin
--		dataout <= std_logic_vector(s_dataout);
--		process(clk)
--		begin
--			if(rising_edge(clk)) then
--				if(reset = '1') then
--					s_dataout <= (others => '0')
--				elsif(enable='1') then
--					s_dataout <= unsigned(datain) + s_dataout
--				end if;
--				
--			end if;
--			
--		end process;
--	end Behav
