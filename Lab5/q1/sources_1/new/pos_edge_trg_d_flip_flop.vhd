library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pos_edge_trg_d_flip_flop is
  Port ( 
    sw : in std_logic_vector (0 downto 0) := "0";
    btnC: in std_logic := '0';
    led: out std_logic_vector (1 downto 0) := "00"
  );
end pos_edge_trg_d_flip_flop;

architecture Behavioral of pos_edge_trg_d_flip_flop is
    signal q, qp : std_logic := '0';
begin
process (btnC, sw(0))
begin
    if rising_edge(btnC) then
        q <= sw(0);
        qp <= not sw(0); 
        led(0) <= sw(0);
        led(1) <= not sw(0);
    end if;
end process;

end Behavioral;
