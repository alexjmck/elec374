library ieee;
use ieee.std_logic_1164.all;

entity add is
	port ( 							: in STD_LOGIC_VECTOR(31 downto 0);
			clk, clr, reg32in		: in bit;
			--reg32in is an enable signal--
			Q							: out STD_LOGIC_VECTOR(31 downto 0));
end reg32;