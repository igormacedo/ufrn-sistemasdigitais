library ieee;
use ieee.std_logic_1164.all;

entity dflipflop is
  port( d 		: in std_logic_vector(31 downto 0); 
		  clk  	: in std_logic;
		  clear	: in std_logic;
		  enable : in std_logic;
        q      : out std_logic_vector(31 downto 0) );
end entity;

architecture arc of dflipflop is
begin
  process(clk)
  begin
    if(rising_edge(clk) and enable = '1') then
		if(clear = '1') then
			q <= "00000000000000000000000000000000";
		else 
			q <= d;
		end if;
    end if;
  end process;
end architecture;