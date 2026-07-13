----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2026 11:04:31 PM
-- Design Name: 
-- Module Name: Mux4_1 - Behavioral
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

entity Mux4_1 is
    Port ( in_scadere1 : in integer;
           in_adunare1 : in integer;
           in_scadere2 : in integer;
           in_adunare2 : in integer;
           sel        : in std_logic_vector (1 downto 0); 
           iesire     : out integer );
end Mux4_1;

architecture Behavioral of Mux4_1 is
begin
    process(sel, in_scadere1, in_adunare1, in_scadere2, in_adunare2)
    begin
    case sel is
        when "00" => iesire <= in_scadere1;
        when "01" => iesire <= in_adunare1;
        when "10" => iesire <= in_scadere2;
        when "11" => iesire <= in_adunare2;
        when others => iesire <= 0;
    end case;
    end process;
end Behavioral;
