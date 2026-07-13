----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 09:22:46 PM
-- Design Name: 
-- Module Name: sub_sim - Behavioral
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

entity sub_sim is
--  Port ( );
end sub_sim;

architecture Behavioral of sub_sim is

component sub
    Port ( suma : in unsigned(7 downto 0);
           rest : out unsigned(7 downto 0));
end component;

signal suma_t:unsigned(7 downto 0):=(others=>'0');
signal rest_t:unsigned(7 downto 0);

begin

et: sub port map(
suma=>suma_t,
rest=>rest_t);

sim_proc:process
begin

suma_t<=to_unsigned(101, 8); 
wait for 20 ns;

suma_t<=to_unsigned(50, 8);
wait for 20 ns;

suma_t<=to_unsigned(150, 8);
wait for 20 ns;
wait;
end process;

end Behavioral;
