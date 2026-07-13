----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 12:02:42 PM
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
    Port ( F0 : in STD_LOGIC;
           F1 : in STD_LOGIC;
           F2 : in STD_LOGIC;
           valoare : out unsigned(7 downto 0));
end decoder;

architecture Behavioral of decoder is

begin
    process(F0, F1, F2)
    begin
    if F2='1' then
        valoare<=TO_UNSIGNED(50, 8);
    elsif F1='1' then
        valoare<=TO_UNSIGNED(10, 8);
    elsif F0='1' then
        valoare<=TO_UNSIGNED(5, 8);
    else
        valoare<=to_unsigned(0, 8);
    end if;
    end process;

end Behavioral;
