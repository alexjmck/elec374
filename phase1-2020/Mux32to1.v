`timescale 1ns / 1ps

module Mux32to1 (

  input [31:0] R0MuxIn, R1MuxIn, R2MuxIn, R3MuxIn, R4MuxIn, R5MuxIn, R6MuxIn, R7MuxIn, R8MuxIn, R9MuxIn, R10MuxIn, R11MuxIn, R12MuxIn, R13MuxIn, R14MuxIn, R15MuxIn,

  input [31:0] HIMuxIn, LOMuxIn, zhighMuxIn, zlowMuxIn, PCMuxIn, MDRMuxIn, InPortMuxIn, CMuxin,

  input reg [4:0] Scode,

  output [31:0] BusMuxOut);

/*
  Always block runs whenever any variable changes.
  Checks if Scode is equal to a registers designated code.
  output value of register that sCode designates.
*/

always @ ( * ) begin

if (Scode == 5'0)
  BusMuxOut <= R0MuxIn;
else if (Scode == 5'1)
  BusMuxOut <= R1MuxIn;
else if (Scode == 5'2)
  BusMuxOut <= R2MuxIn;
else if (Scode == 5'3)
  BusMuxOut <= R3MuxIn;
else if (Scode == 5'4)
  BusMuxOut <= R4MuxIn;
else if (Scode == 5'5)
  BusMuxOut <= R5MuxIn;
else if (Scode == 5'6)
  BusMuxOut <= R6MuxIn;
else if (Scode == 5'7)
  BusMuxOut <= R7MuxIn;
else if (Scode == 5'8)
  BusMuxOut <= R8MuxIn;
else if (Scode == 5'9)
  BusMuxOut <= R9MuxIn;
else if (Scode == 5'10)
  BusMuxOut <= R10MuxIn;
else if (Scode == 5'11)
  BusMuxOut <= R11MuxIn;
else if (Scode == 5'12)
  BusMuxOut <= R12MuxIn;
else if (Scode == 5'13)
  BusMuxOut <= R13MuxIn;
else if (Scode == 5'14)
  BusMuxOut <= R14MuxIn;
else if (Scode == 5'15)
  BusMuxOut <= R15MuxIn;

else if (Scode == 5'16)
  BusMuxOut <= HIMuxIn;
else if (Scode == 5'17)
  BusMuxOut <= LOMuxIn;
else if (Scode == 5'18)
  BusMuxOut <= zhighMuxIn;
else if (Scode == 5'19)
  BusMuxOut <= zlowMuxIn;
else if (Scode == 5'20)
  BusMuxOut <= PCMuxIn;
else if (Scode == 5'21)
  BusMuxOut <= MDRMuxIn;
else if (Scode == 5'22)
  BusMuxOut <= InPortMuxIn;
else if (Scode == 5'23)
  BusMuxOut <= CMuxIn;

end

endmodule
