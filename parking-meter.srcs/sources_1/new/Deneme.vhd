----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2017 14:56:23
-- Design Name: 
-- Module Name: Deneme - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Deneme is
    Port ( b1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           b3 : in STD_LOGIC;
           b4 : in STD_LOGIC;
           clk : in STD_LOGIC;
           sum : out integer;
           reset : in STD_LOGIC);
end Deneme;

architecture Behavioral of Deneme is

begin
process (clk,reset)
begin
if (reset='1') then
          sum <= 0; 
elsif clk'event and clk='1' then

    if (b1='1') then
        sum<=sum+30;
    elsif (b2='1') then
         sum<=sum+60;
    elsif (b3='1') then
         sum<=sum+120;
    elsif (b4='1') then
         sum<=sum+300;
    end if;
end if;
end process;
end Behavioral;
