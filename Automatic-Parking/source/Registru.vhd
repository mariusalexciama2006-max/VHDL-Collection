----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2026 11:04:45 PM
-- Design Name: 
-- Module Name: Registru - Behavioral
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

entity Registru is
    Generic ( locuri_max : integer := 50 );
    Port ( clk     : in std_logic;
           rst     : in std_logic;
           en      : in std_logic; 
           D       : in integer;   
           Q       : out integer );
end Registru;

architecture Behavioral of Registru is
    signal memorie : integer range 0 to locuri_max;
begin
    Q <= memorie;
    process(clk, rst)
    begin
        if rst = '1' then
            memorie <= locuri_max; 
        elsif rising_edge(clk) then
            if en = '1' then
                memorie <= D;
            end if;
        end if;
    end process;
end Behavioral;
