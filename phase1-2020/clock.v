`timescale 1ns / 1ps

module clock(
	output reg clk
);

	initial clk = 1;
	
	always #5 clk = ~clk;
	
endmodule

