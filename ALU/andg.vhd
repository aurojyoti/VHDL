library ieee;
use ieee.std_logic_1164.all;

entity andg is
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
end andg;

architecture beh of andg is
begin 
	 y <='0' & (a and b);
end beh;