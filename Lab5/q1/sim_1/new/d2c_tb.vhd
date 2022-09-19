library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d2c_tb is
end d2c_tb;

architecture Behavioral of d2c_tb is
    component d2_counter
        Port(
            input: in std_logic;
            output: out std_logic_vector(0 downto 0)
        );
    end component;
    signal ext_input, ext_output: std_logic;
    signal clock_period : time := 100ns;
begin
    d2c : d2_counter 
    port map(
        input => ext_input, output(0) => ext_output
    );
    
    clock_process :process begin
        ext_input <= '0'; 
        wait for clock_period/2; 
        ext_input <= '1'; 
        wait for clock_period/2; 
    end process;
    
end Behavioral;
