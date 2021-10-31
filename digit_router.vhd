LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- This project use FSM for each digit displaying state,
-- and the project is splited into multiple different compoents,
-- each of them has their own responsibility.
-- This is the top-level component, controlling the state of the design

ENTITY digit_router IS
  PORT (
    clk : IN STD_LOGIC; -- Clock
    btnC : IN STD_LOGIC; -- Reset
    btnL, btnR : IN STD_LOGIC;
    seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";
    an : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111"
  );
END digit_router;

ARCHITECTURE Behavioral OF digit_router IS
  COMPONENT number_board
    PORT (
      clk, btnC : IN STD_LOGIC;
      seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";
      an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111";
      BCD_in_0, BCD_in_1, BCD_in_2, BCD_in_3 : IN STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
  END COMPONENT;

  -- component ports
  SIGNAL BCD0, BCD1, BCD2, BCD3 : STD_LOGIC_VECTOR(3 DOWNTO 0);

  -- FSM signals
  TYPE state_type IS (s0, s1, s2, s3);
  -- where s0 : 8901
  --       s1 : 9018 
  --       s2 : 0189
  --       s3 : 1890
  SIGNAL state, next_state : state_type := s0;
  SIGNAL last_btnL_state, last_btnR_state : STD_LOGIC := '0'; -- To prevent keep changing state when long pressing 
BEGIN
  nb : number_board PORT MAP(
    clk => clk, btnC => btnC, seg => seg, an => an, BCD_in_0 => BCD0, BCD_in_1 => BCD1, BCD_in_2 => BCD2, BCD_in_3 => BCD3
  );

  -- Clock Process
  clk_proc : PROCESS (clk, btnC)
  BEGIN
    IF btnC = '1' THEN
      state <= s0;
    ELSIF rising_edge(clk) THEN
      state <= next_state;
    END IF;
  END PROCESS;

  -- Next state process
  next_state_proc : PROCESS (clk, state, btnL, btnR)
  BEGIN
    IF btnC = '1' THEN
      next_state <= s0;
    ELSIF rising_edge(clk) THEN
      -- Rotate Left
      IF btnL = '1' AND last_btnL_state = '0' THEN
        CASE state IS
          WHEN s0 => next_state <= s1;
          WHEN s1 => next_state <= s2;
          WHEN s2 => next_state <= s3;
          WHEN s3 => next_state <= s0;
          WHEN OTHERS => next_state <= s0;
        END CASE;
        last_btnL_state <= '1';
      ELSIF btnL = '0' THEN
        last_btnL_state <= '0';
      END IF;

      -- Rotate Right
      IF btnR = '1' AND last_btnR_state = '0' THEN
        CASE state IS
          WHEN s0 => next_state <= s3;
          WHEN s1 => next_state <= s0;
          WHEN s2 => next_state <= s1;
          WHEN s3 => next_state <= s2;
          WHEN OTHERS => next_state <= s0;
        END CASE;
        last_btnR_state <= '1';
      ELSIF btnR = '0' THEN
        last_btnR_state <= '0';
      END IF;
    END IF;
  END PROCESS;

  -- Output different BCD to each of the 4 digit according to the state
  BCD_out_proc : PROCESS (clk, state)
  BEGIN
    CASE state IS
      WHEN s0 =>
        BCD0 <= "0001";
        BCD1 <= "0000";
        BCD2 <= "1001";
        BCD3 <= "1000";
      WHEN s1 =>
        BCD0 <= "1000";
        BCD1 <= "0001";
        BCD2 <= "0000";
        BCD3 <= "1001";
      WHEN s2 =>
        BCD0 <= "1001";
        BCD1 <= "1000";
        BCD2 <= "0001";
        BCD3 <= "0000";
      WHEN s3 =>
        BCD0 <= "0000";
        BCD1 <= "1001";
        BCD2 <= "1000";
        BCD3 <= "0001";
    END CASE;
  END PROCESS;
END Behavioral;