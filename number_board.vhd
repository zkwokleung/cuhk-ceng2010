LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

-- This component is responsible for controlling the display of different digit for each 7-segment digit.

ENTITY number_board IS
    PORT (
        clk, btnC : IN STD_LOGIC;
        seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";
        an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111";
        BCD_in_0, BCD_in_1, BCD_in_2, BCD_in_3 : IN STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END number_board;

ARCHITECTURE Behavioral OF number_board IS
    COMPONENT single_digit_displayer
        PORT (
            clk, btnC : IN STD_LOGIC;
            an_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111";
            BCD_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
            seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";
            an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111"
        );
    END COMPONENT;
    -- Component Map Signals
    SIGNAL an_active : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL BCD_active : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";

    -- Signals for the refresh mechanism
    SIGNAL one_second_counter : STD_LOGIC_VECTOR (27 DOWNTO 0);
    SIGNAL refresh_counter : STD_LOGIC_VECTOR (19 DOWNTO 0);
    SIGNAL LED_activating_counter : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    sdd : single_digit_displayer PORT MAP(
        clk => clk, btnC => btnC, seg => seg, an => an, an_in => an_active, BCD_in => BCD_active
    );

    -- Clock process
    PROCESS (clk, btnC)
    BEGIN
        IF (btnC = '1') THEN
            refresh_counter <= (OTHERS => '0');
        ELSIF (rising_edge(clk)) THEN
            refresh_counter <= refresh_counter + 1;
        END IF;
    END PROCESS;

    LED_activating_counter <= refresh_counter(19 DOWNTO 18);

    -- Which anode to light up and what digit to display 
    LED_disp_proc : PROCESS (LED_activating_counter, BCD_in_0, BCD_in_1, BCD_in_2, BCD_in_3)
    BEGIN
        CASE LED_activating_counter IS
            WHEN "00" =>
                -- Right most digit
                an_active <= "1110";
                BCD_active <= BCD_in_0;
            WHEN "01" =>
                -- 2nd right digit
                an_active <= "1101";
                BCD_active <= BCD_in_1;
            WHEN "10" =>
                -- 2nd left digit
                an_active <= "1011";
                BCD_active <= BCD_in_2;
            WHEN "11" =>
                -- Left most digit
                an_active <= "0111";
                BCD_active <= BCD_in_3;
        END CASE;
    END PROCESS;
END Behavioral;