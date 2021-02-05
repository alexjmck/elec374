module Mux2to1(read,BuxMuxOut,Mdatain,output_Mux);
	input read;
	input [31:0] BusMuxOut;
	input [31:0] Mdatain;
	output [31:0] output_Mux
	
	always @ (BusMuxOut, Mdatain, read)
		case(read)
			0: output_MUX = BusMuxOut;
			1: output_MUX = Mdatain;
			??default: output_MUX = ??
		endcase
	end
endmodule