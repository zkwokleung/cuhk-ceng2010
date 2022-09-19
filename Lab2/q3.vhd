library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ceng2010_lab2_q3 is
  Port ( sw : in STD_LOGIC_VECTOR (1 downto 0);
         led : buffer STD_LOGIC_VECTOR (1 downto 0));
end ceng2010_lab2_q3;

architecture Behavioral of ceng2010_lab2_q3 is

begin
    led(1) <= led(0) nand sw(1);
    led(0) <= led(1) nand sw(0);

end Behavioral;
