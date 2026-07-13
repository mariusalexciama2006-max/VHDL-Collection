----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2026 10:29:19 AM
-- Design Name: 
-- Module Name: uc - Behavioral
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

entity uc is
--  Port ( );
end uc;

architecture Behavioral of uc is
component Control_Unit is
Generic ( locuri_max : integer := 50 );
    Port ( clk, rst       : in std_logic;
           sen_1a, sen_2a : in std_logic;
           sen_1b, sen_2b : in std_logic;
           locuri_curente : in integer;    
           
           cmd_en         : out std_logic; 
           cmd_sel        : out std_logic_vector(1 downto 0)
         );
end component;

signal clk_s, rst_s       : std_logic;
    signal sen_1a_s, sen_2a_s : std_logic;
    signal sen_1b_s, sen_2b_s : std_logic;
    signal locuri_curente_s   : integer:=25;
    
    signal cmd_en_s           : std_logic;
    signal cmd_sel_s          : std_logic_vector(1 downto 0);


begin

    uut: Control_Unit
        generic map ( locuri_max => 50 )
        port map (
            clk => clk_s,
            rst => rst_s,
            sen_1a => sen_1a_s,
            sen_2a => sen_2a_s,
            sen_1b => sen_1b_s,
            sen_2b => sen_2b_s,
            locuri_curente => locuri_curente_s,
            cmd_en => cmd_en_s,
            cmd_sel => cmd_sel_s
        );

    clk_process: process
    begin
        clk_s <= '0';
        wait for 5 ns;
        clk_s <= '1';
        wait for 5 ns;
    end process;

    sim_process: process
    begin
        rst_s <= '1';
        wait for 20 ns;
        rst_s <= '0';
        wait for 20 ns;

        sen_1a_s <= '1';
        wait for 20 ns;
        sen_2a_s <= '1';
        wait for 20 ns;
        sen_1a_s <= '0';
        wait for 20 ns;
        sen_2a_s <= '0';
        
        wait for 40 ns;

        sen_2b_s <= '1';
        wait for 20 ns;
        sen_1b_s <= '1';
        wait for 20 ns;
        sen_2b_s <= '0';
        wait for 20 ns;
        sen_1b_s <= '0';
        
        wait;
    end process;


end Behavioral;
