library ieee;
use ieee.std_logic_1164.all;

entity dec is
	generic (m: integer:= 3);
	port ( a: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
end dec;

architecture beh of dec is
signal b: std_logic_vector(3 downto 0) := "0001";
signal c,s: std_logic_vector(3 downto 0);
begin 
	 
	s(0) <= a(0) xor b(0);
	c(0) <= a(0) and (not b(0));
	
	s(1) <= a(1) xor b(1) xor c(0);
	c(1) <= (a(1) and (not b(1))) or (c(0) and (a(1) xnor b(1)));
	
	s(2) <= a(2) xor b(2) xor c(1);
	c(2) <= (a(2) and (not b(2))) or (c(1) and (a(2) xnor b(2)));
	 
	s(3) <= a(3) xor b(3) xor c(2);
	c(3) <= (a(3) and (not b(3))) or (c(2) and (a(3) xnor b(3))); 
	
	y <= c(3) & s;
	 
end beh;