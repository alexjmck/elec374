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
    Sout <= 5'b00000;
  else if (R1out == 1'b1)
    Sout <= 5'b00001;
  else if (R2out == 1'b1)
    Sout <= 5'b00010;
  else if (R3out == 1'b1)
    Sout <= 5'b00011;
  else if (R4out == 1'b1)
    Sout <= 5'b00100;
  else if (R5out == 1'b1)
    Sout <= 5'b00101;
  else if (R6out == 1'b1)
    Sout <= 5'b00110;
  else if (R7out == 1'b1)
    Sout <= 5'b00111;
  else if (R8out == 1'b1)
    Sout <= 5'b01000;
  else if (R9out == 1'b1)
    Sout <= 5'b01001;
  else if (R10out == 1'b1)
    Sout <= 5'b01010;
  else if (R11out == 1'b1)
    Sout <= 5'b01011;
  else if (R12out == 1'b1)
    Sout <= 5'b01100;
  else if (R13out == 1'b1)
    Sout <= 5'b01101;
  else if (R14out == 1'b1)
    Sout <= 5'b01110;
  else if (R15out == 1'b1)
    Sout <= 5'b01111;

  else if (HIout == 1'b1)
    Sout <= 5'b10000;
  else if (LOout == 1'b1)
    Sout <= 5'b10001;
  else if (zhighout == 1'b1)
    Sout <= 5'b10010;
  else if (zlowout == 1'b1)
    Sout <= 5'b10011;
  else if (PCout == 1'b1)
    Sout <= 5'b10100;
  else if (MDRout == 1'b1)
    Sout <= 5'b10101;
  else if (InPortout == 1'b1)
    Sout <= 5'b10110;
  else if (Cout == 1'b1)
    Sout <= 5'b10111;

end

endmodule
