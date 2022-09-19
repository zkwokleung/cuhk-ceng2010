library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divide_by_2_counter is
end divide_by_2_counter;

architecture Behavioral of divide_by_2_counter is
    component pos_edge_trg_d_flip_flop
        Port(
            sw : in std_logic_vector (0 downto 0);
            btnC: in std_logic;
            led: out std_logic_vector (1 downto 0)
        );
    end component;
    
    signal ext_input, ext_output, clock_period : std_logic;
begin
    ff: pos_edge_trg_d_flip_flop port map(
        led(1) => ext_output, sw(0) => ext_input, btnC => clock_period
    );

end Behavioral;
