library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity PulseGeneratorN is
    generic (
        numberSteps  : positive := 8;
        outCompVal   : natural  := 4
    );
    port (
        clkIn       : in  std_logic;
        pulseOut    : out std_logic
    );
end PulseGeneratorN;

architecture Behavioral of PulseGeneratorN is

    subtype TCounter is natural range 0 to (numberSteps - 1);

    signal s_counter : TCounter;

begin
    count_proc : process(clkIn)
    begin
        if rising_edge(clkIn) then
            if s_counter = (numberSteps - 1) then
                s_counter <= 0;
            else
                s_counter <= s_counter + 1;
            end if;
        end if;
    end process;

    pulseOut <= '1' when s_counter < outCompVal else '0';

end Behavioral;
