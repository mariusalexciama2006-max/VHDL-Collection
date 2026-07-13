----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2026 11:02:47 PM
-- Design Name: 
-- Module Name: Control_Unit - Behavioral
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

entity Control_Unit is
    Generic ( locuri_max : integer := 50 );
    Port ( clk, rst       : in std_logic;
           sen_1a, sen_2a : in std_logic;
           sen_1b, sen_2b : in std_logic;
           locuri_curente : in integer;    
           
           cmd_en         : out std_logic; 
           cmd_sel        : out std_logic_vector(1 downto 0)
         );
end Control_Unit;

architecture Behavioral of Control_Unit is
    signal conf_p1, conf_p2 : std_logic;
    signal sens_p1, sens_p2 : std_logic;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            conf_p1 <= '0'; conf_p2 <= '0';
            sens_p1 <= '0'; sens_p2 <= '0';
            cmd_en <= '0';  cmd_sel <= "00";
            
        elsif rising_edge(clk) then
            cmd_en <= '0'; 
            
            
            if sen_1a = '1' and sen_2a = '0' and conf_p1 = '0' then sens_p1 <= '0';
            elsif sen_1a = '0' and sen_2a = '1' and conf_p1 = '0' then sens_p1 <= '1';
            end if;
            
            
            if sen_1b = '1' and sen_2b = '0' and conf_p2 = '0' then sens_p2 <= '0';
            elsif sen_1b = '0' and sen_2b = '1' and conf_p2 = '0' then sens_p2 <= '1';
            end if;
            
            
            if sen_1a = '1' and sen_2a = '1' then conf_p1 <= '1'; end if;
            if sen_1b = '1' and sen_2b = '1' then conf_p2 <= '1'; end if;
            
            if  sen_1a = '0' and sen_2a = '0' and conf_p1 = '1' and sen_1b = '0' and sen_2b = '0' and conf_p2 = '1'
   then 
        if sens_p1 = '0' and sens_p2 = '0' then
            if locuri_curente > 1 then
                cmd_en <= '1'; cmd_sel <= "10";
            elsif locuri_curente > 0 then
                cmd_en <= '1'; cmd_sel <= "00";
            end if;
        elsif sens_p1 = '1' and sens_p2 = '1' then
            if locuri_curente < locuri_max - 1 then
                cmd_en <= '1'; cmd_sel <= "11";
            elsif locuri_curente < locuri_max then
                cmd_en <= '1'; cmd_sel <= "01";
            end if;
        end if;
        conf_p1 <= '0';
        conf_p2 <= '0';
           
            elsif sen_1a = '0' and sen_2a = '0' and conf_p1 = '1' then
                if sens_p1 = '0' and locuri_curente > 0 then
                    cmd_en <= '1'; cmd_sel <= "00"; 
                elsif sens_p1 = '1' and locuri_curente < locuri_max then
                    cmd_en <= '1'; cmd_sel <= "01"; 
                end if;
                conf_p1 <= '0'; 
                
            
            elsif sen_1b = '0' and sen_2b = '0' and conf_p2 = '1' then
                if sens_p2 = '0' and locuri_curente > 0 then
                    cmd_en <= '1'; cmd_sel <= "00";
                elsif sens_p2 = '1' and locuri_curente < locuri_max then
                    cmd_en <= '1'; cmd_sel <= "01";
                end if;
                conf_p2 <= '0'; 
            end if;
            
        end if;
    end process;
end Behavioral;
