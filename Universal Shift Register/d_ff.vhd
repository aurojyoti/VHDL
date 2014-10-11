library IEEE;
use IEEE.std_logic_1164.all;

entity d_ff is 
	port ( d,clk,rst: in std_logic;
			q: out std_logic
		 );
end d_ff;

architecture beh of d_ff is
begin
	process(rst,clk)
	begin
		--
			if(rst='1') then
				q <= '0';
			elsif(clk'event and clk = '1') then
				q <= d;
			end if;
		--end if;
	end process;
end beh;