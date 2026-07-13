----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 09:24:14 PM
-- Design Name: 
-- Module Name: UC_sim - Behavioral
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

entity UC_sim is
--  Port ( );
end UC_sim;

architecture Behavioral of UC_sim is

component UC
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           F3 : in STD_LOGIC;
           F4 : in STD_LOGIC;
           FS : in STD_LOGIC;
           RM : in STD_LOGIC;
           suma_ok : in STD_LOGIC;
           sel : out std_logic;
           load_sum : out STD_LOGIC;
           clear_sum : out STD_LOGIC;
           AM : out STD_LOGIC;
           AT : out STD_LOGIC;
           eliberare_s : out STD_LOGIC);
end component;



signal clk_t, rst_t, F3_t, F4_t, FS_t, RM_t, suma_ok_t:std_logic:='0';

signal sel_t, load_sum_t, clear_sum_t, AM_t, AT_t, eliberare_s_t:std_logic;

begin

et: UC port map(
clk=>clk_t,
rst=>rst_t,
F3=>F3_t,
F4=>F4_t,
FS=>FS_t,
RM=>RM_t,
suma_ok=>suma_ok_t,
sel=>sel_t,
load_sum=>load_sum_t,
clear_sum=>clear_sum_t,
AM=>AM_t,
AT=>AT_t,
eliberare_s=>eliberare_s_t);

clk_sim:process
begin
    clk_t<='1';
    wait for 10 ns;
    clk_t<='0';
    wait for 10 ns;
end process;

sim_proc: process
begin
    rst_t<='1';
    wait for 20 ns;
    rst_t<='0';
    wait for 20 ns;
    
    --caz1
    F4_t<='1';
    wait for 20 ns;
    F4_t<='0';
    wait for 40 ns;
    
    --caz2
    suma_ok_t<='1';
    F4_t<='1';
    wait for 20 ns;
    F4_t<='0';
    wait for 40 ns;
    suma_ok_t<='0';
    wait for 80 ns;
    
    --caz3
    FS_t<='1';
    F4_t<='1';
    wait for 20 ns;
    F4_t<='0';
    FS_t<='0';
    wait for 40 ns;
    
    --caz4
    RM_t<='1';
    wait for 20 ns;
    RM_t<='0';
    wait for 40 ns;
    
    --caz5
    F3_t<='1';
    F4_t<='1';
    wait for 20 ns;
    F3_t<='0';
    F4_t<='0';
    wait for 40 ns;
wait;
end process;

end Behavioral;
