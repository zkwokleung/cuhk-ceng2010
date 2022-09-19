library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ceng2010_lab3_q1 is
  Port ( 
    sw : in std_logic_vector (6 downto 0);
    seg: out std_logic_vector (6 downto 0);
    an: out std_logic_vector (3 downto 0) := "0011";
    btnC: in std_logic
  );
end ceng2010_lab3_q1;

architecture Behavioral of ceng2010_lab3_q1 is

begin
    seg <= not sw;
    process (btnC)
        variable x : std_logic := '1';
    begin
        if rising_edge(btnC) then 
            if x = '0' then
                an <= "0011";
            else
                an <= "1100";
            end if; 
            x := not x;
        end if;
    end process;


end Behavioral;
