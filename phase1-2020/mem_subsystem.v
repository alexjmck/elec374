`timescale 1ns/10ps

module Mux2to1(
  input read,
  input [31:0] input_0,
  input [31:0] input_1,
  output reg [31:0] output_MUX
  );

  always @ (posedge read)
  	begin
      case(read)
        0: output_MUX <= input_0;
        1: output_MUX <= input_1;
      endcase
    end
endmodule

module RAM(

  input [8:0] mem_location,

  input [31:0] dataIn,

  input read, write,

  output reg [31:0] dataOut

);

  // Memory in RAM
  reg [31:0] memory [511:0];


  always @ ( * ) begin
    if (read == 1)
      dataOut <= memory[mem_location];
    if (write == 1) begin
      memory[mem_location] <= dataIn;
    end
  end

endmodule


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


module MDR(
	input [31:0] BusMuxOut,
	input [31:0] Mdatain,
	input [31:0] read,
	input clr,
	input clk,
	input MDRin,
	output reg [31:0] output_Q
  );

  reg [31:0] output_Mux;

  Mux2to1 MD_Mux(read,BusMuxOut,Mdatain,output_Mux);

  gen_reg32 MDR_Reg(output_Mux, clk, clr, MDRin, output_Q);

endmodule


module mem_subsytem (
  // RAM
  input [8:0] mem_location,
  input [31:0] dataIn,
  input read, write,
  output reg [31:0] dataOut,

  // MAR
  input [31:0] BusMuxOut,
  input MARclr,
  input clk,
  input MARin,
  output [8:0] address,

  // MDR
  // input [31:0] BusMuxOut,
  input [31:0] Mdatain,
  input [31:0] MDRMuxRead,
  input MDRclr,
  // input clk,
  input MDRin,
  output reg [31:0] output_Q

  );


  MAR mar(BusMuxOut, MARclr, clk, MARin, address);

  RAM ram(address, dataIn, read, write, dataOut);

  MDR mdr(BusMuxOut, Mdatain, MDRMuxRead, MDRclr, clk, MDRin, output_Q);


endmodule //mem_subsytem
