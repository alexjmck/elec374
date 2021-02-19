`timescale 1ns / 1ps

module Mux32to1 (

  input [31:0] R0MuxIn, R1MuxIn, R2MuxIn, R3MuxIn, R4MuxIn, R5MuxIn, R6MuxIn, R7MuxIn, R8MuxIn, R9MuxIn, R10MuxIn, R11MuxIn, R12MuxIn, R13MuxIn, R14MuxIn, R15MuxIn,

  input [31:0] HIMuxIn, LOMuxIn, zhighMuxIn, zlowMuxIn, PCMuxIn, MDRMuxIn, InPortMuxIn, CMuxin,

  input reg [4:0] Scode,

  output [31:0] BusMuxOut

);

/*
  Always block runs whenever any variable changes.
  Checks if Scode is equal to a registers designated code.
  output value of register that sCode designates.
*/

always @ ( * ) begin

if (Scode == 5'b00000)
  BusMuxOut <= R0MuxIn;
else if (Scode == 5'b00001)
  BusMuxOut <= R1MuxIn;
else if (Scode == 5'b00010)
  BusMuxOut <= R2MuxIn;
else if (Scode == 5'b00011)
  BusMuxOut <= R3MuxIn;
else if (Scode == 5'b00100)
  BusMuxOut <= R4MuxIn;
else if (Scode == 5'b00101)
  BusMuxOut <= R5MuxIn;
else if (Scode == 5'b00110)
  BusMuxOut <= R6MuxIn;
else if (Scode == 5'b00111)
  BusMuxOut <= R7MuxIn;
else if (Scode == 5'b01000)
  BusMuxOut <= R8MuxIn;
else if (Scode == 5'b01001)
  BusMuxOut <= R9MuxIn;
else if (Scode == 5'b01010)
  BusMuxOut <= R10MuxIn;
else if (Scode == 5'b01011)
  BusMuxOut <= R11MuxIn;
else if (Scode == 5'b01100)
  BusMuxOut <= R12MuxIn;
else if (Scode == 5'b01101)
  BusMuxOut <= R13MuxIn;
else if (Scode == 5'b01110)
  BusMuxOut <= R14MuxIn;
else if (Scode == 5'b01111)
  BusMuxOut <= R15MuxIn;

else if (Scode == 5'b10000)
  BusMuxOut <= HIMuxIn;
else if (Scode == 5'b10001)
  BusMuxOut <= LOMuxIn;
else if (Scode == 5'b10010)
  BusMuxOut <= zhighMuxIn;
else if (Scode == 5'b10011)
  BusMuxOut <= zlowMuxIn;
else if (Scode == 5'b10100)
  BusMuxOut <= PCMuxIn;
else if (Scode == 5'b10101)
  BusMuxOut <= MDRMuxIn;
else if (Scode == 5'b10110)
  BusMuxOut <= InPortMuxIn;
else if (Scode == 5'b10111)
  BusMuxOut <= CMuxIn;

end

endmodule
