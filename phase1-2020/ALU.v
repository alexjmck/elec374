`timescale 1ns / 1ps

module ALU (

  input [11:0] aluControl,
  input [31:0] A, B,
  output [31:0] zhighOut <= 0,
  output [31:0] zlowOut

);

/*
aluControl signal meaning
complete operation when bit number is 1

ADD - 0
SUB - 1
MUL - 2
DIV - 3
SHR - 4
SHL - 5
ROR - 6
ROL - 7
AND - 8
OR  - 9
NEG - 10
NOT - 11

*/

always @ ( * ) begin
  if (aluControl == 12'b0000_0000_0001)
    ADD(A, B, zlowout);
  else if (aluControl == 12'b0000_0000_0010)
    SUB(A, B, zlowout);
  else if (aluControl == 12'b0000_0000_0100)
    MUL(A, B, zhighout, zlowout);
  else if (aluControl == 12'b0000_0000_1000)
    DIV(A, B, zhighout, zlowout);
  else if (aluControl == 12'b0000_0001_0000)
    SHR(A, B, zlowout);
  else if (aluControl == 12'b0000_0010_0000)
    SHL(A, B, zlowout);
  else if (aluControl == 12'b0000_0100_0000)
    ROR(A, B, zlowout);
  else if (aluControl == 12'b0000_1000_0000)
    ROL(A, B, zlowout);
  else if (aluControl == 12'b0001_0000_0000)
    AND(A, B, zlowout);
  else if (aluControl == 12'b0010_0000_0000)
    OR(A, B, zlowout);
  else if (aluControl == 12'b0100_0000_0000)
    NEG(A, B, zlowout);
  else if (aluControl == 12'b1000_0000_0000)
    NOT(A, B, zlowout);

end

endmodule
