library ieee;
use ieee.std_logic_1164.all;

entity xnorg is
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
end xnorg;

architecture beh of xnorg is
begin 
	 y <= '0' & (a xnor b);
end beh;