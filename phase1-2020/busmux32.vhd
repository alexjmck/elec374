library ieee;
use ieee.std_logic_1164.all;

entity encoder is
	port (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15		: in std_ulogic;
			hiOut, LoOut, Zhigh, Zlow, PCout, MDRout, in_portout, c_out					: in std_ulogic;
			s0,s1,s2,s3,s4																				: out std_ulogic); --input from 32-5 encoder (page4 phase1 document)--);
end encoder;

entity busmux32 is
	port	(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15 	: in std_ulogic_vector(31 downto 0); --registers in 32bit wide--
			 hi, lo, zHigh, zLow, pc, mdr, in_port, c_extend 								: in std_ulogic_vector(31 downto 0); --other 32 bit wide in--
			 S0,S1,S2,S3,S4																			: in std_ulogic;							 --input from 32-5 encoder (page4 phase1 document)--
			 BusMuxOut																					: out std_ulogic_vector(31 downto 0)); --BusMuxOutput 32bit wide--
end busmux32;

architecture behavioural of encoder is
begin
	encoder32to1:
	process
	begin
			
	end process;
end behavioural;

architecture behavioural of busmux32 is
begin
	multiplexer32to1:
	process
	begin
			BusMuxOut <= 
	end process;
end behavioural;

