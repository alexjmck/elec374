module MAR(
	input [31:0] BusMuxOut,
	input clr,
	input clk,
	input MARin,
  output [8:0] address
  );

	wire [31:0] reg_output_Q;

	gen_reg32 MDR_Reg(BusMuxOut, clk, clr, MARin, reg_output_Q);

  assign address = reg_output_Q[8:0];

endmodule
