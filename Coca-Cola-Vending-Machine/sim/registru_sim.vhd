----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 09:23:18 PM
-- Design Name: 
-- Module Name: registru_sim - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registru_sim is
--  Port ( );
end registru_sim;

architecture Behavioral of registru_sim is

component registru
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clear_sum : in STD_LOGIC;
           D : in unsigned(7 downto 0);
           Q : out unsigned(7 downto 0));
end component;

signal clk_t, rst_t, en_t, clear_sum_t:std_logic:='0';
signal D_t: unsigned(7 downto 0):=(others=>'0');
signal Q_t:unsigned(7 downto 0);

begin

et: registru port map(
clk=>clk_t,
rst=>rst_t,
en=>en_t,
clear_sum=>clear_sum_t,
D=>D_t,
Q=>Q_t);

clk_sim:process
begin
    clk_t<='1';
    wait for 10 ns;
    clk_t<='0';
    wait for 10 ns;
end process;

sim_proc:process
begin
    rst_t<='1';
    wait for 20 ns;
    rst_t<='0';
    wait for 20 ns;
    
    en_t<='1';
    wait for 20 ns;
    
    D_t<=to_unsigned(98, 8);
    wait for 40 ns;
    
    en_t<='0';
    wait for 20 ns;
    
    D_t<=to_unsigned(100, 8);
    wait for 40 ns;
    
    en_t<='1';
    wait for 20 ns;
    
    D_t<=to_unsigned(100, 8);
    wait for 40 ns;
    
    clear_sum_t<='1'; 
    wait for 40 ns;
wait;
end process;

end Behavioral;
