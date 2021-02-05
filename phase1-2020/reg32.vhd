library ieee;

use ieee.std_logic_1164.all;

entity reg32 is
	port (D 							: in STD_LOGIC_VECTOR(31 downto 0);
			clk, clr, reg32in		: in bit;
			--reg32in is an enable signal--
			Q							: out STD_LOGIC_VECTOR(31 downto 0));
end reg32;

architecture behavioural of reg32 is
begin
	reg32process:
	process (D, clk,clr, reg32in)
	begin
		if clr = '0' then
			if clk'event and clk = '1' and reg32in = '1' then
				Q <= D;
			end if;
		elsif clr = '1' then
			Q <= x"00000000";
		end if;
	end process;
end behavioural;	
		