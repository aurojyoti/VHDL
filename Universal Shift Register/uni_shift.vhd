library IEEE;
use IEEE.std_logic_1164.all;

entity uni_shift is
  generic (m: integer:= 7);
  port ( ld_shift,rs_ls,rst,clk: in std_logic;
         din: in std_logic_vector(0 to m);
         dout: out std_logic
       );
end uni_shift;

architecture beh of uni_shift is

  component d_ff
	port ( d,clk,rst: in std_logic;
			q: out std_logic
		 );
  end component;

  component mux
	port (a,b,s: in std_logic;
			y: out std_logic
		 );
  end component;

  signal t1,t2,q: std_logic_vector(0 to m);

  begin
	dout <= q(7);	
    gen_loop: for i in 0 to m generate
      
      if_1: if(i=0) generate
        M01: mux port map (q(i+1),q(m),rs_ls,t1(i));
        M02: mux port map (t1(i),din(i),ld_shift,t2(i));
        D0: d_ff port map (t2(i),clk,rst,q(i));
      end generate;

      if_2: if(i>0 and i<m) generate
        M11: mux port map (q(i+1),q(i-1),rs_ls,t1(i));
        M12: mux port map (t1(i),din(i),ld_shift,t2(i));
        D1: d_ff port map (t2(i),clk,rst,q(i));
      end generate;

      if_3: if(i=m) generate
        M21: mux port map (q(0),q(i-1),rs_ls,t1(i));
        M22: mux port map (t1(i),din(i),ld_shift,t2(i));
        D2: d_ff port map (t2(i),clk,rst,q(i));
      end generate;

    end generate;
  end beh;
  
