----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2026 12:51:03 PM
-- Design Name: 
-- Module Name: sim_Parking - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_Parking is
--  Port ( );
end sim_Parking;

architecture Behavioral of sim_Parking is

component Parking_Structural
    Generic( locuri_maxime: integer:=50);
    
    Port( sen_1a : in STD_LOGIC;
           sen_2a : in STD_LOGIC;
           sen_1b : in STD_LOGIC;
           sen_2b : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           locuri_libere : out integer range 0 to locuri_maxime);
end component;

    signal sen_1a_t : std_logic := '0';
    signal sen_2a_t: std_logic := '0';
    signal sen_1b_t : std_logic := '0';
    signal sen_2b_t : std_logic := '0';
    signal rst_t: std_logic := '0';
    signal clk_t : std_logic := '0';
    signal locuri_libere_t : integer range 0 to 50;
    
    constant clk_period : time := 10 ns;

begin

utcn: Parking_Structural 
        generic map (
            locuri_maxime => 50
        )
        port map (
            sen_1a => sen_1a_t,
            sen_2a => sen_2a_t,
            sen_1b => sen_1b_t,
            sen_2b => sen_2b_t,
            rst    => rst_t,
            clk    => clk_t,
            locuri_libere => locuri_libere_t
        );
        
clk_process: process
    begin
        clk_t <= '0';
        wait for clk_period/2;
        clk_t <= '1';
        wait for clk_period/2;
    end process;
    
sim_proc: process
    begin
        rst_t <= '1';
        wait for 20 ns;
        rst_t <= '0';
        wait for 20 ns;
        
        sen_1a_t <= '1';
        wait for 40 ns;
        
        sen_2a_t <= '1';
        wait for 40 ns;
        
        sen_1a_t <= '0';
        wait for 40 ns;
        
        sen_2a_t <= '0'; 
        
        wait for 100 ns;
        
        
        
        
        sen_1b_t <= '1';
        wait for 40 ns;
        
        sen_2b_t <= '1';
        wait for 40 ns;
        
        sen_1b_t <= '0';
        wait for 40 ns;
        
        sen_2b_t <= '0';
        
        wait for 100 ns;
        
        
        
         sen_1a_t <= '1';
        wait for 40 ns;
        
        sen_2a_t <= '1';
        wait for 40 ns;
        
        sen_1a_t <= '0';
        wait for 40 ns;
        
        sen_2a_t <= '0'; 
        
        wait for 100 ns;
        
        
        
        
        sen_2b_t <= '1';
        wait for 40 ns;
        
        sen_1b_t <= '1';
        wait for 40 ns;
        
        sen_2b_t <= '0';
        wait for 40 ns;
        
        sen_1b_t <= '0';
        
        wait;
    end process;

end Behavioral;
