----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 08:55:23 PM
-- Design Name: 
-- Module Name: decoder_sim - Behavioral
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

entity decoder_sim is
--  Port ( );
end decoder_sim;

architecture Behavioral of decoder_sim is

component decoder 
    Port ( F0 : in STD_LOGIC;
           F1 : in STD_LOGIC;
           F2 : in STD_LOGIC;
           valoare : out unsigned(7 downto 0));
end component;

signal F0_t, F1_t, F2_t: std_logic:='0';

signal valoare_t: unsigned(7 downto 0);
begin

et: decoder port map(
F0=>F0_t,
F1=>F1_t,
F2=>F2_t,
valoare=>valoare_t);

sim_proc:process
begin

F0_t<='1';
wait for 20 ns;
F0_t<='0';
wait for 20 ns;
F1_t<='1';
wait for 20 ns;

F1_t<='0';
wait for 20 ns;
F2_t<='1';
wait for 20 ns;

F2_t<='0';

wait;
end process;


end Behavioral;
