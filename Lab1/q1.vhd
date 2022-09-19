library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity q1_circuit is
    port (sw0: in std_logic;
        sw1: in std_logic;
        sw2: in std_logic;
        sw3: in std_logic;
        led0: out std_logic);
end q1_circuit;

architecture Behavioral of q1_circuit is
    signal x :std_logic;
    signal y : std_logic;

begin
    led0 <= (sw0 xor sw1) and (sw2 nor sw3);
end Behavioral;
