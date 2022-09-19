library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ceng2010_lab3_q2 is
  Port ( 
    sw : in std_logic_vector (3 downto 0);
    led: out std_logic_vector (1 downto 0);
    btnC: in std_logic
  );
end ceng2010_lab3_q2;

architecture Behavioral of ceng2010_lab3_q2 is

begin
    process (sw, btnC)
        -- Use opt to store the output
        variable opt : std_logic_vector (1 downto 0);
        variable temp : std_logic_vector (1 downto 0);
    begin
        if sw (3 downto 2) = "11" then
                if falling_edge(btnC) then
                    case sw (1 downto 0) is 
                        when "00" => 
                            opt := opt;
                        when "11" => 
                            temp := opt;
                            opt(0) := temp(1);
                            opt(1) := temp(0);
                        when others => 
                            opt := sw (1 downto 0);
                    end case;
                end if;
                
                if btnC = '1' then
                    opt := opt;              
                end if;
        else
            opt := not sw (3 downto 2);
        end if;
        
        -- Finally assign the output to led
        led <= opt;
    end process;
    
end Behavioral;
