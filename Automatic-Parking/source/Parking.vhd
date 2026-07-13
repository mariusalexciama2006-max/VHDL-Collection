----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2026 06:35:31 PM
-- Design Name: 
-- Module Name: Parking - Behavioral
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



entity Parking_Structural is
    Generic( locuri_maxime: integer:= 50 );
    Port ( sen_1a, sen_2a : in STD_LOGIC;
           sen_1b, sen_2b : in STD_LOGIC;
           rst, clk       : in STD_LOGIC;
           locuri_libere  : out integer range 0 to locuri_maxime );
end Parking_Structural;

architecture Structural of Parking_Structural is

    component Sumator_1 is
        Port ( intrare : in integer; iesire : out integer );
    end component;

    component Scazator_1 is
        Port ( intrare : in integer; iesire : out integer );
    end component;
    
    component Sumator_2 is
        Port ( intrare : in integer; iesire : out integer );
    end component;

    component Scazator_2 is
        Port ( intrare : in integer; iesire : out integer );
    end component;

    component Mux4_1 is
        Port ( in_scadere1 : in integer;
           in_adunare1 : in integer;
           in_scadere2 : in integer;
           in_adunare2 : in integer;
           sel        : in std_logic_vector (1 downto 0); 
           iesire     : out integer );
    end component;

    component Registru is
        Generic ( locuri_max : integer := 50 );
        Port ( clk, rst, en : in std_logic;
               D : in integer; Q : out integer );
    end component;

    component Control_Unit is
        Generic ( locuri_max : integer := 50 );
        Port ( clk, rst : in std_logic;
               sen_1a, sen_2a, sen_1b, sen_2b : in std_logic;
               locuri_curente : in integer;
               cmd_en : out std_logic;
               cmd_sel: out std_logic_vector(1 downto 0) );
    end component;

    
    signal wire_locuri_curente : integer;
    signal wire_suma_1           : integer;
    signal wire_diferenta_1      : integer;
    signal wire_suma_2           : integer;
    signal wire_diferenta_2      : integer;
    signal wire_mux_out        : integer;
    
    signal wire_en             : std_logic;
    signal wire_sel            : std_logic_vector(1 downto 0);

begin

    
  
    locuri_libere <= wire_locuri_curente;

  
    UC: Control_Unit 
        generic map ( locuri_max => locuri_maxime )
        port map (
            clk => clk, rst => rst,
            sen_1a => sen_1a, sen_2a => sen_2a,
            sen_1b => sen_1b, sen_2b => sen_2b,
            locuri_curente => wire_locuri_curente,
            cmd_en  => wire_en,
            cmd_sel => wire_sel
        );

  
    SUM1: Sumator_1
        port map ( intrare => wire_locuri_curente, iesire => wire_suma_1 );

   
    SUB1: Scazator_1
        port map ( intrare => wire_locuri_curente, iesire => wire_diferenta_1 );
        
    SUM2: Sumator_2
        port map ( intrare => wire_locuri_curente, iesire => wire_suma_2 );

   
    SUB2: Scazator_2
        port map ( intrare => wire_locuri_curente, iesire => wire_diferenta_2 );

   
    MUX: Mux4_1 
        port map ( in_scadere1 => wire_diferenta_1,
           in_adunare1 => wire_suma_1,
           in_scadere2 => wire_diferenta_2,
           in_adunare2 => wire_suma_2,
           sel => wire_sel,
           iesire => wire_mux_out);

    
    REG: Registru 
        generic map ( locuri_max => locuri_maxime )
        port map ( clk => clk, rst => rst, en => wire_en,
                   D => wire_mux_out, 
                   Q => wire_locuri_curente );

end Structural;
