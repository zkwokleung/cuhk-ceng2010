LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- This component is responsible for displaying the digit to the 7-segment digit 

ENTITY single_digit_displayer IS
  PORT (
    clk, btnC : IN STD_LOGIC;
    an_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111";
    BCD_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";
    an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111"
  );
END single_digit_displayer;

ARCHITECTURE Behavioral OF single_digit_displayer IS
  -- A component used to decode the BCD
  COMPONENT single_digit_selector
    PORT (
      output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      input : IN STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL seg_out : STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000000";
BEGIN
  sds : single_digit_selector PORT MAP(
    output => seg_out, input => BCD_in
  );

  -- Control which anode should be lighted up
  an_proc : PROCESS (clk, btnC, an_in)
  BEGIN
    IF btnC = '1' THEN
      an <= "0000";
    ELSIF rising_edge(clk) THEN
      an <= an_in;
    END IF;
  END PROCESS;

  -- Control the output for the segments
  seg_proc : PROCESS (clk, btnC, seg_out)
  BEGIN
    IF btnC = '1' THEN
      seg <= "1000000";
    ELSIF rising_edge(clk) THEN
      seg <= seg_out;
    END IF;
  END PROCESS;
END Behavioral;