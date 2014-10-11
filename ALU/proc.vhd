library ieee;
use ieee.std_logic_1164.all;

entity alu is
	port ( a,b: in std_logic_vector(3 downto 0);
			cin: in std_logic;
			y: out std_logic_vector(4 downto 0);
			sel: in bit_vector(3 downto 0)
		 );
end alu;

architecture str of alu is
	
	component notg 
	generic (m : integer:= 3);
	port (a: in std_logic_vector(m downto 0);
			  y: out std_logic_vector((m+1) downto 0)
			 );
	end component;
	
	component andg 
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
    end component;
	
	component org 
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
	end component;
	
	component nandg 
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
	end component;
	
	component norg 
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
	end component;
	
	component xorg 
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
	end component;
	
	component xnorg 
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
	end component;
	
	component inc 
	generic (m: integer:= 3);
	port ( a: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
	end component;
	
	component dec 
	generic (m: integer:= 3);
	port ( a: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
    end component;
	
	component add 
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			y: out std_logic_vector((m+1) downto 0)
			);
	end component;
	
	component addc 
	generic (m: integer:= 3);
	port ( a,b: in std_logic_vector(m downto 0);
			cin: in std_logic;
			y: out std_logic_vector((m+1) downto 0)
			);
	end component;
	
	component mux16
	port (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p: in std_logic_vector(4 downto 0);
		  s: in bit_vector(3 downto 0);
		  y: out std_logic_vector(4 downto 0)
		  );
	end component;
	
	type sig is array(15 downto 0) of std_logic_vector(4 downto 0);
	signal ty: sig;
	
	begin
		
		NA: notg port map (a,ty(0));
		
		NB: notg port map (b,ty(1));
		
		AND1: andg port map (a,b,ty(2));
		
		OR1: org port map (a,b,ty(3));
		
		NAND1: nandg port map (a,b,ty(4));
		
		NOR1: norg port map (a,b,ty(5));
		
		XOR1: xorg port map (a,b,ty(6));
		
		XNOR1: xnorg port map (a,b,ty(7));
		
		ty(8) <= '0' & a;
		
		ty(9) <= '0' & b;
		
		INCA: inc port map (a,ty(10));
		
		INCB: inc port map (b,ty(11));
		
		DECA: dec port map (a,ty(12));
		
		DECB: dec port map (b,ty(13));
		
		ADD1: add port map (a,b,ty(14));
		
		ADDC1: addc port map (a,b,cin,ty(15));
		
		MUX: mux16 port map (ty(0),ty(1),ty(2),ty(3),ty(4),ty(5),ty(6),ty(7),ty(8),ty(9),ty(10),ty(11),ty(12),ty(13),ty(14),ty(15),sel,y);
		
end str;
		
		
		
		