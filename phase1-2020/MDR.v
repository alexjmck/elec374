module MDR(busMuxOut,Mdatain,read,clr,clk,MDRin,output_Q)
	input [31:0] BusMuxOutput;
	input [31:0] Mdatain;
	input [31:0] read
	input clr;
	input clk;
	input MDRin;
	output reg [31:0] output_Q;
	
	Mux2to1 MD_Mux(read,BuxMuxOut,Mdatain,output_Mux)
	
	gen_reg32 MDR_Reg(output_Mux, clk, clr, MDRin, output_Q)