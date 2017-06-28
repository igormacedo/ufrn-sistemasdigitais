library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rising_edge_detector is
  port( clk  	: in std_logic;
		  clear	: in std_logic;
		  enable : in std_logic;
        q      : out std_logic_vector(31 downto 0) );
end entity;

architecture arc of rising_edge_detector is
signal edge_number : integer := 0;
begin
	process(clk,clear)
	begin
		if(clear = '1') then
			edge_number <= 0;
		else 
			if(rising_edge(clk) and enable = '1') then
				edge_number <= edge_number + 1;
			end if;
		end if;
  end process;  
  q <= std_logic_vector(to_unsigned(edge_number, 32));
end architecture;