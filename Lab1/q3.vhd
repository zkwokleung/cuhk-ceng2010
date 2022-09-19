library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ceng2010_lab1_q3 is
    Port ( sw0 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
           sw4 : in STD_LOGIC;
           sw5 : in STD_LOGIC;
           sw6 : in STD_LOGIC;
           sw7 : in STD_LOGIC;
           seg0 : out STD_LOGIC;
           seg1 : out STD_LOGIC;
           seg2 : out STD_LOGIC;
           seg3 : out STD_LOGIC;
           seg4 : out STD_LOGIC;
           seg5 : out STD_LOGIC;
           seg6 : out STD_LOGIC;
           dp : out STD_LOGIC;
           an0 : out STD_LOGIC;
           an1 : out STD_LOGIC;
           an2 : out STD_LOGIC;
           an3 : out STD_LOGIC);
end ceng2010_lab1_q3;

architecture Behavioral of ceng2010_lab1_q3 is

begin
    an0 <= '0';
    an1 <= '1';
    an2 <= '1';
    an3 <= '1';

    seg0 <= not sw0;
    seg1 <= not sw1;
    seg2 <= not sw2;
    seg3 <= not sw3;
    seg4 <= not sw4;
    seg5 <= not sw5;
    seg6 <= not sw6;
    dp <= not sw7;
end Behavioral;
