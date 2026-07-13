----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2026 09:44:24 AM
-- Design Name: 
-- Module Name: sum_1 - Behavioral
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

entity sum_2 is
--  Port ( );
end sum_2;

architecture Behavioral of sum_2 is

component Sumator_2 is
    Port ( intrare : in integer;
           iesire  : out integer );
end component;
signal intrare_s, iesire_s:integer;
begin

    su: Sumator_2 port map(intrare=>intrare_s, iesire => iesire_s);
    sim:process
    begin
    
    intrare_s<=21;
    wait for 20 ns;
    
    wait;
    end process;


end Behavioral;
