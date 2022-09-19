library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ceng_lab1_q2 is
    Port ( sw0 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
           sw4 : in STD_LOGIC;
           sw5 : in STD_LOGIC;
           sw6 : in STD_LOGIC;
           sw7 : in STD_LOGIC;
           led0 : out STD_LOGIC;
           led1 : out STD_LOGIC;
           led2 : out STD_LOGIC;
           led3 : out STD_LOGIC;
           led4 : out STD_LOGIC;
           led5 : out STD_LOGIC;
           led6 : out STD_LOGIC;
           led7 : out STD_LOGIC);
end ceng_lab1_q2;

architecture Behavioral of ceng_lab1_q2 is

begin
    led0 <= sw0;
    led1 <= sw1;
    led2 <= sw2 or sw3;
    led3 <= sw2 and sw4;
    led4 <= not sw4;
    led5 <= not sw5;
    led6 <= sw4 and (not sw5);
    led7 <= (sw4 and sw7) and (sw5 or sw6);

end Behavioral;
