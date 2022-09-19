library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d2_counter is
    Port(
        input: in std_logic := '0';
        output: out std_logic_vector(0 downto 0):= "0"
    );
end d2_counter;

architecture Behavioral of d2_counter is
    component pos_edge_trg_d_flip_flop
        Port(
            sw : in std_logic_vector (0 downto 0);
            btnC: in std_logic;
            led: out std_logic_vector (1 downto 0)
        );
    end component;
    
    signal d : std_logic := '0';
begin
    ff: pos_edge_trg_d_flip_flop 
    port map(
       sw(0) => d, btnC => input, led(0) => output(0), led(1) => d
    );
end Behavioral;
