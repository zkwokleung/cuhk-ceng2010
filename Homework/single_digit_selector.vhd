LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- This component is only responsible for decoding the BCD

ENTITY single_digit_selector IS
  PORT (
    output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000000";
    input : IN STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000"
  );
END single_digit_selector;

ARCHITECTURE Behavioral OF single_digit_selector IS

BEGIN
  PROCESS (input)
  BEGIN
    CASE input IS
      WHEN "0000" => output <= "1000000";
      WHEN "0001" => output <= "1111001";
      WHEN "0010" => output <= "0100100";
      WHEN "0011" => output <= "0110000";
      WHEN "0100" => output <= "0011001";
      WHEN "0101" => output <= "0010010";
      WHEN "0110" => output <= "0000010";
      WHEN "0111" => output <= "1111000";
      WHEN "1000" => output <= "0000000";
      WHEN "1001" => output <= "0010000";
      WHEN OTHERS => output <= "0000110";
    END CASE;
  END PROCESS;
END Behavioral;