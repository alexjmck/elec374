// `timescale 1ns / 1ps
//
// module ALU (
//
//   input [11:0] aluControl,
//   input [31:0] A, B,
//   output [31:0] zhighOut <= 0,
//   output [31:0] zlowOut
//
// );
//
// /*
// aluControl signal meaning
// complete operation when bit number is 1

//
// always @ ( * ) begin
//   if (aluControl == 12'b0000_0000_0001)
//     ADD(A, B, zlowout);
//   else if (aluControl == 12'b0000_0000_0010)
//     SUB(A, B, zlowout);
//   else if (aluControl == 12'b0000_0000_0100)
//     MUL(A, B, zhighout, zlowout);
//   else if (aluControl == 12'b0000_0000_1000)
//     DIV(A, B, zhighout, zlowout);
//   else if (aluControl == 12'b0000_0001_0000)
//     SHR(A, B, zlowout);
//   else if (aluControl == 12'b0000_0010_0000)
//     SHL(A, B, zlowout);
//   else if (aluControl == 12'b0000_0100_0000)
//     ROR(A, B, zlowout);
//   else if (aluControl == 12'b0000_1000_0000)
//     ROL(A, B, zlowout);
//   else if (aluControl == 12'b0001_0000_0000)
//     AND(A, B, zlowout);
//   else if (aluControl == 12'b0010_0000_0000)
//     OR(A, B, zlowout);
//   else if (aluControl == 12'b0100_0000_0000)
//     NEG(A, B, zlowout);
//   else if (aluControl == 12'b1000_0000_0000)
//     NOT(A, B, zlowout);
//
// end

  //

  `timescale 1ns / 1ps

 module ALU(
   input [11:0] aluControl,
   input [31:0] A, B,
   output [31:0] zlow, zhigh);

  wire [31:0] zlowAND, zhighAND, zlowOR, zhighOR, zlowNEG, zhighNEG, zlowNOT, zhighNOT, zlowADD, zhighADD, zlowSUB, zhighSUB;
  wire [31:0] zlowMUL, zhighMUL, zlowDIV, zhighDIV, zlowSHR, zhighSHR, zlowSHL, zhighSHL, zlowROR, zhighROR, zlowROL, zhighROL;
  reg [31:0] zlowTemp, zhighTemp;
  wire cin;
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

   adder32 ADD(A,B,cin,zlowADD,zhighADD);
   sub32 SUB(A,B,cin,zlowSUB,zhighSUB);
   DIV DIVIDER(A,B,zlowDIV,zhighDIV);
   ShiftRight SHR(A,B,zlowSHR);
   ShiftLeft SHL(A,B,zlowSHL);
   ror32 ROR(A,B,zlowROR);
   rol32 ROL(A,B,zlowROL);
   neg32 NEG(A,zlowNEG);
   not32 NOT(A,zlowNOT);


   	always @ * begin
      if(aluControl == 12'b0000_0000_0001) begin
  			zlowTemp <= zlowADD;
  			zhighTemp <= zhighADD;
      end else if(aluControl == 12'b0000_0000_0010) begin
  			zlowTemp <= zlowSUB;
  			zhighTemp <= zhighSUB;
      /*
        Add MUL Here
      */
		  end else if(aluControl == 12'b0000_0000_1000) begin
        zlowTemp <= zlowDIV;
        zhighTemp <= zhighDIV;
      end else if(aluControl == 12'b0000_0001_0000) begin
        zlowTemp <= zlowSHR;
        zhighTemp <= 0;
      end else if(aluControl == 12'b0000_0010_0000) begin
        zlowTemp <= zlowSHL;
        zhighTemp <= 0;
      end else if(aluControl == 12'b0000_0100_0000) begin
        zlowTemp <= zlowROR;
        zhighTemp <= 0;
      end else if(aluControl == 12'b0000_1000_0000) begin
        zlowTemp <= zlowROL;
        zhighTemp <= 0;
      end else if(aluControl == 12'b0001_0000_0000) begin
    		zlowTemp <= A & B;
        zhighTemp <= 0;
      end else if(aluControl == 12'b0010_0000_0000) begin
        zlowTemp <= A | B;
        zhighTemp <= 0;
      end else if(aluControl == 12'b0100_0000_0000) begin
        zlowTemp <= zlowNEG;
        zhighTemp <= 0;
      end else if(aluControl == 12'b1000_0000_0000) begin
        zlowTemp <= zlowNOT;
        zhighTemp <= 0;
	end

	assign zlow = zlowTemp;
	assign zhigh = zhighTemp;

   always @(*) begin
     $monitor ("low = %h", zlow);
     $monitor ("high = %h", zhigh);
   end

endmodule


endmodule
