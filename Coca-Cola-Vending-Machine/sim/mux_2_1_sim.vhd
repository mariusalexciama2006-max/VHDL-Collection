----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 09:23:37 PM
-- Design Name: 
-- Module Name: mux_2_1_sim - Behavioral
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

entity mux_2_1_sim is
--  Port ( );
end mux_2_1_sim;

architecture Behavioral of mux_2_1_sim is

component mux_2_1
    Port ( i0 : in unsigned(7 downto 0);
           i1 : in unsigned(7 downto 0);
           sel : in STD_LOGIC;
           d_out : out unsigned(7 downto 0));
end component;

signal i0_t, i1_t:unsigned(7 downto 0):=(others=>'0');
signal d_out_t:unsigned(7 downto 0);
signal sel_t:std_logic:='0';

begin
et: mux_2_1 port map(
i0=>i0_t,
i1=>i1_t,
sel=>sel_t,
d_out=>d_out_t);

sim_proc:process
begin
i0_t<=to_unsigned(33, 8);

i1_t<=to_unsigned(100, 8);

sel_t<='1';
wait for 20 ns;


sel_t<='0';
wait;
end process;

end Behavioral;
