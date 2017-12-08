library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity main is
 Port (  clk : in std_logic;
         reset : in std_logic;  --down button
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
constant valup: std_logic_vector (15 downto 0):="0000000000100000";  	--load 20 := 0010 0000 
signal temp_count: std_logic_vector (15 downto 0):=val;
signal slow_clk: std_logic;
signal clk_divider: std_logic_vector (24 downto 0);

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
        slow_clk<=clk_divider(23);
    
end process;
 
counting: process (slow_clk, temp_count)
    begin
        if (reset='1') then
            temp_count <= val;  --tempcount==0
        
        elsif slow_clk'event and slow_clk='1' then
--            if temp_count>0 then

               if temp_count(3 downto 0)=0 then
                    temp_count(3 downto 0)<="1001";
                if temp_count(7 downto 4)=0 then
                    temp_count(7 downto 4)<="1001";
                if temp_count(11 downto 8)=0 then
                    temp_count(11 downto 8)<="1001";
                if temp_count(15 downto 12)=0 then
                    temp_count(15 downto 12)<="1001";
                        else
                        temp_count(15 downto 12) <= temp_count(15 downto 12) - 1;
                        end if;
                        else
                        temp_count(11 downto 8) <= temp_count(11 downto 8) - 1;
                        end if;
                        else
                        temp_count(7 downto 4) <= temp_count(7 downto 4) - 1;
                        end if;    
                        else
                        temp_count(3 downto 0) <= temp_count(3 downto 0) - 1;
                        end if;
            
                if temp_count<val+1 then  -- when display less than 1 ,  wait  0000!!! 
                    temp_count<=val;
                 end if;
              
              
                if (btn1='1') then
--                    temp_count <= temp_count + "0000000000110000";  --add 30

                         if temp_count(7 downto 4)="0111" then  --7 ise
                                temp_count(7 downto 4)<="0000"; --0 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                         
                         elsif temp_count(7 downto 4)="1000" then  --8 ise
                                temp_count(7 downto 4)<="0001"; --1 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                                                          
                         elsif temp_count(7 downto 4)="0111" then  --9 ise
                                temp_count(7 downto 4)<="0010"; --2 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                                
                         elsif temp_count(11 downto 8)="1001" then  --9 ise
                                temp_count(11 downto 8)<="0000"; --0 yap
                                temp_count(15 downto 12) <= temp_count(15 downto 12) + 1; --1 ekle
                               
                         else
                                temp_count(7 downto 4) <= temp_count(7 downto 4) + 3;   --3 ekle       
                         end if;      
                    
                 end if;
                 
                 if (btn2='1') then
--                    temp_count <= temp_count + "0000000001100000";  --add 60

                    temp_count(7 downto 4) <= temp_count(7 downto 4) + 6;
                         if temp_count(7 downto 4)="0100" then  --4 ise
                                temp_count(7 downto 4)<="0000"; --0 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                         end if;
                         if temp_count(7 downto 4)="0101" then  --5 ise
                                temp_count(7 downto 4)<="0001"; --1 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                         end if;      
                         if temp_count(7 downto 4)="0110" then  --6 ise
                                temp_count(7 downto 4)<="0010"; --2 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                         end if;      
                         if temp_count(7 downto 4)="0111" then  --7 ise
                                temp_count(7 downto 4)<="0011"; --3 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                         end if;      
                         if temp_count(7 downto 4)="1000" then  --8 ise
                                temp_count(7 downto 4)<="0100"; --4 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                         end if;      
                         if temp_count(7 downto 4)="1001" then  --9 ise
                                temp_count(7 downto 4)<="0101"; --5 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                         end if;     
                         if temp_count(11 downto 8)="1001" then  --9 ise
                                temp_count(11 downto 8)<="0000"; --0 yap
                                temp_count(15 downto 12) <= temp_count(15 downto 12) + 1; --1 ekle
                         end if; 
                     
                 end if;
                 
                 if (btn3='1') then
--                    temp_count <= temp_count + "0000000100100000";  --add 120
                    
                    temp_count(7 downto 4) <= temp_count(7 downto 4) + 2;    
                         if temp_count(7 downto 4)="1001" then  --9 ise
                                temp_count(7 downto 4)<="0001"; --1 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                         end if;      
                         if temp_count(7 downto 4)="1000" then  --8 ise
                                temp_count(7 downto 4)<="0000"; --0 yap
                                temp_count(11 downto 8) <= temp_count(11 downto 8) + 1; --1 ekle
                         end if;  
                    temp_count(11 downto 8) <= temp_count(11 downto 8) + 1;
                              if temp_count(11 downto 8)="1001" then  --9 ise
                                     temp_count(11 downto 8)<="0000"; --0 yap
                                     temp_count(15 downto 12) <= temp_count(15 downto 12) + 1; --1 ekle
                              end if;  
                             
                   end if;
                 
                 if (btn4='1') then
--                    temp_count <= temp_count + "0000001100000000";  --add 300

                    temp_count(11 downto 8) <= temp_count(11 downto 8) + 3;
                         if temp_count(11 downto 8)="1001" then  --9 ise
                                temp_count(11 downto 8)<="0010"; --2 yap
                                temp_count(15 downto 12) <= temp_count(15 downto 12) + 1; --1 ekle
                         end if;  
                         if temp_count(11 downto 8)="1000" then  --8 ise
                                temp_count(11 downto 8)<="0001"; --1 yap
                                temp_count(15 downto 12) <= temp_count(15 downto 12) + 1; --1 ekle
                         end if;  
                         if temp_count(11 downto 8)="0111" then  --7 ise
                                temp_count(11 downto 8)<="0000"; --0 yap
                                temp_count(15 downto 12) <= temp_count(15 downto 12) + 1; --1 ekle
                         end if;  
                  end if;                                           
   end if;
end process;          
end Behavioral;
