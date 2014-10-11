library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
	port (a,b,s: in std_logic;
			y: out std_logic
		 );
end mux;

architecture beh of mux is
attribute buffer_type: string;
attribute buffer_type of a: signal is "BUFGP";

begin	
	y<= ((a and (not s)) or (b and s));
end beh;