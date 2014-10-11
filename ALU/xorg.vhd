library ieee;
use ieee.std_logic_1164.all;

entity xorg is
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
end xorg;

architecture beh of xorg is
begin 
	 y <= '0' & (a xor b);
end beh;