----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 12:08:55 PM
-- Design Name: 
-- Module Name: comp_100 - Behavioral
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

entity comp_100 is
    Port ( suma : in unsigned(7 downto 0);
           suma_ok : out STD_LOGIC);
end comp_100;

architecture Behavioral of comp_100 is

begin

suma_ok<='1' when suma>=to_unsigned(100, 8) else '0';

end Behavioral;
