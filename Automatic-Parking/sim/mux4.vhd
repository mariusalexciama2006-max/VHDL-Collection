----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2026 10:08:38 AM
-- Design Name: 
-- Module Name: mux4 - Behavioral
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

entity mux4 is
--  Port ( );
end mux4;

architecture Behavioral of mux4 is

component Mux4_1 is
    Port ( in_scadere1 : in integer;
           in_adunare1 : in integer;
           in_scadere2 : in integer;
           in_adunare2 : in integer;
           sel        : in std_logic_vector (1 downto 0); 
           iesire     : out integer );
end component;

signal iesire_s, in_scadere1_s, in_scadere2_s, in_adunare1_s, in_adunare2_s:integer;
signal sel_s: std_logic_vector(1 downto 0);


begin

mu: Mux4_1 port map (
        in_scadere1 => in_scadere1_s,
        in_adunare1 => in_adunare1_s,
        in_scadere2 => in_scadere2_s,
        in_adunare2 => in_adunare2_s,
        sel         => sel_s,
        iesire      => iesire_s
    );

sim: process
    begin
    in_scadere1_s<=47;
    in_adunare1_s<=49;
    in_scadere2_s<=46;
    in_adunare2_s<=50;
    sel_s<="00";
    wait for 20 ns;
    sel_s<="01";
    wait for 20 ns;
    sel_s<="10";
    wait for 20 ns;
    sel_s<="11";
    wait for 20 ns;
    
    wait;
    end process;


end Behavioral;
