----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 08:56:27 PM
-- Design Name: 
-- Module Name: sum_sim - Behavioral
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

entity sum_sim is
--  Port ( );
end sum_sim;

architecture Behavioral of sum_sim is

component sum
    Port ( a : in unsigned(7 downto 0);
           b : in unsigned(7 downto 0);
           s : out unsigned(7 downto 0));
end component;

signal a_t, b_t:unsigned(7 downto 0):=(others=>'0');
signal s_t:unsigned(7 downto 0);

begin

et: sum port map(
a=>a_t,
b=>b_t,
s=>s_t);

sim_proc:process
begin
a_t<=TO_UNSIGNED(50, 8);
b_t<=TO_UNSIGNED(50, 8);

wait for 20 ns;

a_t<=TO_UNSIGNED(70, 8);
b_t<=TO_UNSIGNED(30, 8);

wait for 20 ns;
wait;
end process;

end Behavioral;
