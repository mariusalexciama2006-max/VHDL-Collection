----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2026 10:20:05 AM
-- Design Name: 
-- Module Name: reg - Behavioral
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

entity reg is
--  Port ( );
end reg;

architecture Behavioral of reg is

component Registru is
Generic ( locuri_max : integer := 50 );
    Port ( clk     : in std_logic;
           rst     : in std_logic;
           en      : in std_logic; 
           D       : in integer;   
           Q       : out integer );
end component;

signal clk_s : std_logic;
signal rst_s : std_logic;
signal en_s  : std_logic;
signal D_s   : integer;
signal Q_s   : integer;

begin

    rg: Registru port map (
        clk => clk_s,
        rst => rst_s,
        en  => en_s,
        D   => D_s,
        Q   => Q_s
    );

    clk_process :process
    begin
        clk_s <= '0';
        wait for 5 ns;
        clk_s <= '1';
        wait for 5 ns;
    end process;

    sim: process
    begin
        rst_s <= '1';
        wait for 20 ns;
        
        rst_s <= '0';
        en_s <= '1';
        D_s <= 15;
        wait for 20 ns;
        
        D_s <= 30;
        wait for 20 ns;
        
        en_s <= '0';
        D_s <= 45;
        wait for 20 ns;
        
        en_s <= '1';
        wait for 20 ns;
        
        wait;
    end process;
end Behavioral;
