----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 09:23:00 PM
-- Design Name: 
-- Module Name: comp_100_sim - Behavioral
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

entity comp_100_sim is
--  Port ( );
end comp_100_sim;

architecture Behavioral of comp_100_sim is

component comp_100
    Port ( suma : in unsigned(7 downto 0);
           suma_ok : out STD_LOGIC);
end component;

signal suma_t:unsigned(7 downto 0):=(others=>'0');
signal suma_ok_t:std_logic;

begin

et: comp_100 port map(
suma=>suma_t,
suma_ok=>suma_ok_t);

sim_proc:process
begin
suma_t<=to_unsigned(101, 8);
wait for 20 ns;
suma_t<=to_unsigned(98, 8);
wait for 20 ns;
suma_t<=to_unsigned(100, 8);
wait;
end process;

end Behavioral;
