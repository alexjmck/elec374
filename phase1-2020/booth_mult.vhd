`timescale 1ns / 1ps

module booth_mult (
  input [31:0] mult,
  input [31:0] multr,
  output reg [31:0] ZhighOut,
  output reg [31:0] ZlowOut

);

integer i = 0;

reg [31:0] mult_neg;
reg [63:0] P; // answer store temp
reg [63:0] A;
reg [63:0] S;
reg [63:0] prod;

reg [1:0] aRight, sRight, pRight, prodRight;

// A = mult_pos
// S = mult_neg
// P = multr

always @(*) begin

	// assign values
    
    mult_neg = -mult;

	aRight = 2'b0;	// add extra end bit
    A = {mult[31:0], 32'h0 }; // sign extend mult, 
    
    sRight = 2'b0;
    S = { mult_neg[31:0], 32'b0 }; // invert sign extended 64 bit
    
    prodRight = {multr[0], 1'b0};
    prod = { 33'b0, multr[31:1] }; //export answer
    
    
    for (i = 0; i < 4; i = i + 1) begin
    	    P <= prod;
            pRight <= prodRight;
            
        case ({pRight[1:0]})
			2'b00: begin 
              prodRight = {P[0], pRight[1]};
              prod <= P >>> 1;
            end
            2'b01: begin
              prod <= (P + A) >>> 1;
            end
            2'b10: begin
              prod <= (P + S) >>> 1;
            end
            2'b11: begin
              prodRight = {P[0], pRight[1]};
              prod <= P >>> 1;
			end
            
        endcase
    end
    
    P = {prod[30:0], prodRight[1]};
    
end


assign ZhighOut = P[31:0]; 
assign ZlowOut = P[63:32]; 

endmodule