library ieee;
use ieee.std_logic_1164.all;

entity cmp is
  port(a, b : in  std_logic_vector(3 downto 0);
       y    : out std_logic_vector(4 downto 0)
       );
end cmp;

architecture beh of cmp is
begin

  process(a,b)
  begin

    if(a(3)=b(3)) then
      if(a(2)=b(2)) then
        if(a(1)=b(1)) then
          if(a(0)=b(0)) then
            y <= "00010";
          elsif(a(0)>b(0)) then
            y <= "00001";
          else
            y <= "00011";
          end if;
        elsif(a(1)>b(1)) then
            y <= "00001";
        else
            y <= "00011";
        end if;
      elsif(a(2)>b(2)) then
            y <= "00001";
      else
            y <= "00011";
      end if;
    elsif(a(3)>b(3)) then
            y <= "00001";
    else
            y <= "00011";
    end if;
  end process;
end beh;