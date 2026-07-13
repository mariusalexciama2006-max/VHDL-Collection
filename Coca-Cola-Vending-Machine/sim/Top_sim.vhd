----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 09:24:43 PM
-- Design Name: 
-- Module Name: Top_sim - Behavioral
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

entity Top_sim is
--  Port ( );
end Top_sim;

architecture Behavioral of Top_sim is

component Top port(
          clk:in std_logic;
          rst:in std_logic;
          F0: in std_logic;
          F1: in std_logic;
          F2: in std_logic;
          F3: in std_logic;
          F4: in std_logic;
          FS: in std_logic;
          RM: in std_logic;
          
          AM: out std_logic;
          AT: out std_logic;
          eliberare_s: out std_logic;
          valoare_rest: out unsigned(7 downto 0)
    );
end component;

signal clk_t: std_logic :='0';
signal rst_t: std_logic :='0';
signal F0_t, F1_t, F2_t, F3_t, F4_t, FS_t, RM_t: std_logic :='0';

signal AM_t, AT_t, eliberare_s_t: std_logic;
signal valoare_rest_t: unsigned(7 downto 0);

begin

et: Top port map(
clk=>clk_t,
rst=>rst_t,
F0=>F0_t,
F1=>F1_t,
F2=>F2_t,
F3=>F3_t,
F4=>F4_t,
FS=>FS_t,
RM=>RM_t,
AM=>AM_t,
AT=>AT_t,
eliberare_s=>eliberare_s_t,
valoare_rest=>valoare_rest_t);

clk_process:process
begin
    clk_t<='0';
    wait for 10 ns;
    clk_t<='1';
    wait for 10 ns;
end process;

sim_proc: process
begin
    rst_t<='1';
    wait for 20 ns;
    rst_t<='0';
    wait for 20 ns;
    --caz1
    F2_t<='1';
    F4_t<='1';
    wait for 80 ns;
    F2_t<='0';
    F4_t<='0';
    wait for 40 ns;
    
    
    F2_t<='1';
    F4_t<='1';
    wait for 80 ns;
    F2_t<='0';
    F4_t<='0';
    wait for 80 ns;
    
    --caz2
    F2_t<='1';
    F4_t<='1';
    wait for 40 ns;
    F2_t<='0';
    F4_t<='0';
    wait for 40 ns;
    
    F1_t<='1';
    F4_t<='1';
    wait for 40 ns;
    F1_t<='0';
    F4_t<='0';
    wait for 40 ns;
    
    F2_t<='1';
    F4_t<='1';
    wait for 40 ns;
    F2_t<='0';
    F4_t<='0';
    wait for 80 ns;
    
    --caz3
    F2_t<='1';
    F4_t<='1';
    wait for 40 ns;
    F2_t<='0';
    F4_t<='0';
    wait for 40 ns;
    
    F1_t<='1';
    F4_t<='1';
    wait for 40 ns;
    F1_t<='0';
    F4_t<='0';
    wait for 40 ns;
    
    RM_t<='1';
    wait for 40 ns;
    RM_t<='0';
    wait for 80 ns;
    
    --caz4
    FS_t<='1';
    wait for 20 ns;
    
    F2_t<='1';
    F4_t<='1';
    wait for 20 ns;
    FS_t<='0';
    --caz 5
    F3_t<='1';
    wait for 80 ns;
    
    F2_t<='0';
    F4_t<='0';
    wait for 20 ns;
    F3_t<='0';
    FS_t<='0';
    wait for 40 ns;
    
    
      
    wait;
    
end process;

end Behavioral;
