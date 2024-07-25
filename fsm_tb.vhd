library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_tb is
end entity fsm_tb;

architecture tb of fsm_tb is

    signal t     : std_logic := '0'; 
    signal j     : unsigned(1 downto 0);
    signal led   : std_logic;
    signal motor : std_logic;
    signal fan   : std_logic;

begin

    dut: entity work.fsm
        port map (
            t      => t,
            j      => j,
            led    => led,
            motor  => motor,
            fan    => fan
        );

    stimulus_process_t : process
    begin
        t <= '0';
        wait for 5 ns; 
        t <= '1';    
        wait for 5 ns; 
    end process stimulus_process_t;

    stimulus_process_j : process
    begin
        j <= "00";
        wait for 5 ns;
        j <= "01";
        wait for 5 ns;     
        j <= "10";
        wait for 5 ns;     
        j <= "11";    
        wait;
    end process stimulus_process_j;

end architecture tb;
