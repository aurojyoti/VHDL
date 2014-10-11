library ieee;
use ieee.std_logic_1164.all;

entity notg is
	generic (m: integer:= 3);
	port ( a: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
end notg;

architecture beh of notg is
	begin 
	 y <= '0' &  (not a);
end beh;