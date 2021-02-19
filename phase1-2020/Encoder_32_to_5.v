`timescale 1ns / 1ps

module Encoder_32_to_5 (

  input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,

  input HIout, LOout, zhighout, zlowout, PCout, MDRout, InPortout, Cout,

  output reg [4:0] Sout);

/*
  Always block runs whenever any variable changes.
  Checks if input is equal to 1.
  Sets output var S equal to 5 bit value signifying which value is one.
*/

always @ ( * ) begin

  if (R0out == 1'b1)
    Sout <= 5'b0;
  else if (R10out == 1'b1)
    Sout <= 5'b1;
  else if (R2out == 1'b1)
    Sout <= 5'b2;
  else if (R3out == 1'b1)
    Sout <= 5'b3;
  else if (R4out == 1'b1)
    Sout <= 5'b4;
  else if (R5out == 1'b1)
    Sout <= 5'b5;
  else if (R6out == 1'b1)
    Sout <= 5'b6;
  else if (R7out == 1'b1)
    Sout <= 5'b7;
  else if (R8out == 1'b1)
    Sout <= 5'b8;
  else if (R9out == 1'b1)
    Sout <= 5'b9;
  else if (R10out == 1'b1)
    Sout <= 5'b10;
  else if (R11out == 1'b1)
    Sout <= 5'b11;
  else if (R12out == 1'b1)
    Sout <= 5'b12;
  else if (R13out == 1'b1)
    Sout <= 5'b13;
  else if (R14out == 1'b1)
    Sout <= 5'b14;
  else if (R15out == 1'b1)
    Sout <= 5'b15;

  else if (HIout == 1'b1)
    Sout <= 5'b16;
  else if (LOout == 1'b1)
    Sout <= 5'b17;
  else if (zhighout == 1'b1)
    Sout <= 5'b18;
  else if (zlowout == 1'b1)
    Sout <= 5'b19;
  else if (PCout == 1'b1)
    Sout <= 5'b20;
  else if (MDRout == 1'b1)
    Sout <= 5'b21;
  else if (InPortout == 1'b1)
    Sout <= 5'b22;
  else if (Cout == 1'b1)
    Sout <= 5'b23;

end

endmodule
