----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2026 03:14:46 PM
-- Design Name: 
-- Module Name: UC - Behavioral
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

entity UC is
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
end UC;

architecture Behavioral of UC is

type stare is (idle, returneaza_moneda, adauga_moneda, verifica_suma, distribuie_monedele, elibereaza_registrul);
signal starea_curenta, starea_urmatoare: stare;
begin
    
    process(clk, rst)
    begin
        if rst = '1' then
            starea_curenta<=idle;
        elsif rising_edge(clk) then
            starea_curenta<=starea_urmatoare;
        end if;
    end process;
    
    process(starea_curenta, F3, F4, FS, RM, suma_ok)
    begin
    load_sum<='0';
    clear_sum<='0';
    AM<='0';
    AT<='0';
    eliberare_s<='0';
    sel<='0';
    starea_urmatoare<=starea_curenta;
    
    case starea_curenta is
     when idle =>
        if RM='1' then 
            starea_urmatoare<=returneaza_moneda;
        elsif F4='1' then
            if FS='1' or F3='1' then
                starea_urmatoare<=idle;
            else
                starea_urmatoare<=adauga_moneda;
            end if;
        end if;
        
     when returneaza_moneda=>
        sel<='0';
        starea_urmatoare<=elibereaza_registrul;
     
     when adauga_moneda =>
        AM<='1';
        load_sum<='1'; 
        starea_urmatoare<=verifica_suma;
     
     when verifica_suma =>
        if suma_ok='1' then
            starea_urmatoare<=distribuie_monedele;
        else
            starea_urmatoare<=idle;
        end if;
    
    when distribuie_monedele =>
        sel<='1';
        AT<='1';
        eliberare_s<='1';
        starea_urmatoare<=elibereaza_registrul;
        
   when elibereaza_registrul=>
        clear_sum<='1'; sel<='1';
        starea_urmatoare<=idle;
   
   when others=>
        starea_urmatoare<=idle;
    end case;
    end process;

end Behavioral;
