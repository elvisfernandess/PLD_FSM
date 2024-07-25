library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port (
        t     : in  std_logic;
        j     : in  unsigned (1 downto 0);
        led   : out std_logic;
        motor : out std_logic;
        fan   : out std_logic
    );
end entity fsm;

architecture rtl of fsm is

    type state_type is (S1, S2, S3);
    signal state : state_type;

begin

    state_transition: process(t, j) is
    begin
        if t = '1' then
            --state <= S2;
			state <= S1;
        elsif j = 3 then
            state <= S3;
        elsif t = '0' then
            state <= S2;
        else
            state <= S1;
        end if;
    end process;

    moore : process(state)
    begin
        led <= '1';  
        motor <= '0';
        case state is
            when S1 =>
            when S2 =>
                motor <= '1';
            when S3 =>
                led <= '0';
        end case;
    end process;

    mealy: process(state, t)
    begin
        fan <= '0';
        case state is
            when S1 =>
                if t = '1' then
                    fan <= '1';
                end if;
            when S2 =>
            when S3 =>
        end case;
    end process;

end architecture rtl;
