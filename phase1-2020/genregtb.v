`timescale 1ns / 1ps

module genregtb;
	reg [31:0] input_d;
	wire clk;
	reg  clr;
	reg reset;
	wire [31:0] output_q;
	
	clock clock(clk);
	gen_reg32 uut(input_d, clk, clr, reset, output_q );
	
	initial begin
		// $dumpfile("out.vcd");
		// $dumpvars(0, gen_reg_testb);
		
		reset = 0;
		clr = 0;
		#10;
		
		input_d = 30;
		reset = 1;
		#10;
		
		reset = 0;
		#15;
		
		input_d = 50;
		#10
		
		input_d = 20;
		reset = 1;
		#10 
		
		reset = 0;
		#15;
				
	end
		
endmodule