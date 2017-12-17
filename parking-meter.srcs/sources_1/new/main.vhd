library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.numeric_std.all;
--use IEEE.STD_LOGIC_arith.ALL;

entity main is
 Port (  clk : in std_logic;
         LED0: out std_logic;
         LED1: out std_logic;
         LED2: out std_logic;
         LED3: out std_logic;
         LED4: out std_logic;
         LED15:out std_logic;
         led5: out std_logic;
         led6: out std_logic;
         led7: out std_logic;
         led8: out std_logic;
         
         reset : in std_logic;  --sw[0] button
         btn1: in std_logic;    --left button
         btn2: in std_logic;    --middle button
         btn3: in std_logic;    --right button
         btn4: in std_logic;    --up button
         an : out std_logic_vector (3 downto 0);        
         sseg : out std_logic_vector (6 downto 0)                 
  );
end main;

architecture Behavioral of main is

component display_controller is
    Port ( clk, reset : in std_logic;
         hex3,hex2,hex1,hex0 : in std_logic_vector (3 downto 0);
         an : out std_logic_vector (3 downto 0);
         sseg : out std_logic_vector (6 downto 0)  
         );
end component; 
constant val: std_logic_vector (15 downto 0):="0000000000000000" ;
signal num: std_logic_vector (9 downto 0):="0000000000";
signal temp_count: std_logic_vector (15 downto 0):=val;
signal slow_clk: std_logic;
signal clk_divider: std_logic_vector (25 downto 0);

begin

display_out: display_controller port map (
    clk=>clk,
    reset=>reset, 
    hex3=>temp_count (15 downto 12),
    hex2=>temp_count (11 downto 8),
    hex1=>temp_count (7 downto 4),
    hex0=>temp_count (3 downto 0),
    an=>an,
    sseg=>sseg
    );

clk_division: process (clk, clk_divider)
    begin
        if clk'event and clk='1' then
            clk_divider<=clk_divider +1;
        end if;        
        slow_clk<=clk_divider(24);
    
end process;
 
counting: process (slow_clk, temp_count, clk)
    variable  x0,x1,x2,x3,a: integer:=0; 
    variable temp_int: integer;
   
    begin
        LED0 <= '0';
        LED1 <= '0';
        LED2 <= '0';
        LED3 <= '0';
        LED4 <= '0';
        LED15<= '0';
        led5 <= '0';
        led6 <= '0';
        led7 <= '0';
        led8 <= '0';
    
        if (reset='1') then
            temp_count <= val;  --tempcount==0
            temp_int :=0;
            LED15 <= '1';
      
        elsif slow_clk'event and slow_clk='1' then
--            if temp_count>0 then
                    if temp_int=0 then  -- when display less than 1 ,  wait  0000!!! 
                         temp_count<=val;
                         temp_int:=0;
                         LED4 <= '1';
                     end if;
            
                     if (btn1='1') then        
                     temp_int := temp_int + 30;  
                     LED0 <= '1'; 
                     end if;
                       
                     if (btn2='1') then
                     temp_int := temp_int + 60;
                     LED1 <= '1';        
                     end if;
                          
                     if (btn3='1') then
                     temp_int := temp_int + 120;
                     LED2 <= '1'; 
                     end if;
                                          
                     if (btn4='1') then
                     temp_int := temp_int + 300;
                     LED3 <= '1';
                     end if;
                     
                     if (temp_int >=9999) then
                     temp_int := 0;
                     end if;
                     
                     a := temp_int;
                    
                     x0 := a mod 10;
                     a := (a - x0);
                     a := a / 10;
                     x1 := a mod 10;
                     a := (a - x1);
                     a := a / 10;
                     x2 := a mod 10;
                     a := (a - x2);
                     a := a / 10;
                     x3 := a mod 10;
                     a := (a - x3);
                     a := a / 10;
                     
                     if (x0 = 0) then
                        led5 <= '1';
                     end if;   
                     if (x1 = 0) then
                        led6 <= '1';
                     end if;
                     if (x2 = 0) then
                        led7 <= '1';
                     end if;
                     if (x3 = 0) then
                        led8 <= '1';
                     end if;                
                         
                     temp_count(3 downto 0) <= std_logic_vector(to_unsigned(x0, temp_count(3 downto 0)'length));
                     temp_count(7 downto 4) <= std_logic_vector(to_unsigned(x1, temp_count(7 downto 4)'length));
                     temp_count(11 downto 8) <= std_logic_vector(to_unsigned(x2, temp_count(11 downto 8)'length));
                     temp_count(15 downto 12) <= std_logic_vector(to_unsigned(x3, temp_count(15 downto 12)'length));
                     
                     if (temp_int > 0) then
                        temp_int := temp_int - 1;
                     end if; 
        end if;                                                     
    end process;          
end Behavioral;