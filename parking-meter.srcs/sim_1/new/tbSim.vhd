----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2017 15:02:49
-- Design Name: 
-- Module Name: tbSim - Behavioral
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



entity tbSim is
--  Port ( );
end tbSim;

architecture Behavioral of tbSim is

component Deneme 
    Port ( b1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           b3 : in STD_LOGIC;
           b4 : in STD_LOGIC;
           clk : in STD_LOGIC;
           sum : out integer;
           reset : in STD_LOGIC);
end component;

signal b1,b2,b3,b4,clk,reset :STD_LOGIC;
signal sum: integer;
signal clkPeriod:time:=20 ns;  
         
begin

DUT: Deneme port map (b1,b2,b3,b4,clk,sum,reset);
--clk<= not clk after clkPeriod/2; 

end Behavioral;
