----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 10:47:19 AM
-- Design Name: 
-- Module Name: Top - Structural
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

entity Top is
    Port( clk:in std_logic;
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
end Top;

architecture Structural of Top is

component decoder 
    Port ( F0 : in STD_LOGIC;
           F1 : in STD_LOGIC;
           F2 : in STD_LOGIC;
           valoare : out unsigned(7 downto 0));
end component;

component sum
    Port ( a : in unsigned(7 downto 0);
           b : in unsigned(7 downto 0);
           s : out unsigned(7 downto 0));
end component;

component sub
    Port ( suma : in unsigned(7 downto 0);
           rest : out unsigned(7 downto 0));
end component;

component comp_100
    Port ( suma : in unsigned(7 downto 0);
           suma_ok : out STD_LOGIC);
end component;

component registru
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clear_sum : in STD_LOGIC;
           D : in unsigned(7 downto 0);
           Q : out unsigned(7 downto 0));
end component;

component mux_2_1
    Port ( i0 : in unsigned(7 downto 0);
           i1 : in unsigned(7 downto 0);
           sel : in STD_LOGIC;
           d_out : out unsigned(7 downto 0));
end component;

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

signal val_moneda: unsigned(7 downto 0);
signal suma_curenta: unsigned(7 downto 0);
signal suma_viitoare: unsigned(7 downto 0);
signal rest_calculat: unsigned(7 downto 0);
signal suma_ok_sig: std_logic;
signal sel_sig: std_logic;
signal load_sum_sig: std_logic;
signal clear_sum_sig: std_logic;

begin

et_decoder: decoder port map(
F0 =>F0,
F1 =>F1,
F2 =>F2,
valoare =>val_moneda);

et_sum: sum port map(
a =>suma_curenta,
b =>val_moneda,
s =>suma_viitoare);

et_registru: registru port map(
clk =>clk,
rst =>rst,
en =>load_sum_sig,
clear_sum =>clear_sum_sig,
D =>suma_viitoare,
Q =>suma_curenta);

et_comp_100: comp_100 port map(
suma =>suma_curenta,
suma_ok =>suma_ok_sig);

et_sub: sub port map(
suma =>suma_curenta,
rest =>rest_calculat);

et_mux_2_1: mux_2_1 port map(
i0 =>suma_curenta,
i1 =>rest_calculat,
sel =>sel_sig,
d_out =>valoare_rest);

et_UC: UC port map(
clk =>clk,
rst =>rst,
F3 =>F3,
F4 =>F4,
FS =>FS,
RM =>RM,
suma_ok =>suma_ok_sig,
sel =>sel_sig,
load_sum =>load_sum_sig,
clear_sum =>clear_sum_sig,
AM =>AM,
AT =>AT,
eliberare_s =>eliberare_s);

end Structural;
