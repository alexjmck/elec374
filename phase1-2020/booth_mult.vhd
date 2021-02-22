`timescale 1ns / 1ps

module booth_mult (
  input [31:0] mult,
  input [31:0] multr,
  output reg [31:0] ZhighOut,
  output reg [31:0] ZlowOut

);

integer i = 0;

reg [31:0] mult_neg = -mult;
reg [63:0] P; // answer store temp
reg [63:0] A;
reg [63:0] S;
reg [63:0] prod;

reg leftMost;
reg rightMost

// A = mult_pos
// S = mult_neg
// P = multr

always @(*) begin

	// assign values
    
    mult_neg = -mult;
    A = { mult[31], mult[31:0], 33'b0 }; // sign extend mult, add extra end bit
    S = { mult_neg[31], mult_neg[31:0], 33'b0 }; // invert sign extended 64 bit
    prod = { 33'b0, multr[31:0], 1'b0 }; //export answer
    
    
    for (i = 0; i < 32; i = i + 1) begin
    	    P <= prod;
        case ({P[1:0]})
			2'b00: begin 
              prod <= P >>> 1;
            end
            2'b01: begin
              prod <= (P + A) >>> 1;
            end
            2'b10: begin
              prod <= (P + S) >>> 1;
            end
            2'b11: begin
              prod <= P >>> 1;
			end
            
        endcase
    end
end


assign ZhighOut = prod[31:0]; 
assign ZlowOut = prod[63:32]; 

endmodule