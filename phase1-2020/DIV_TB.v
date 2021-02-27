`timescale 1ns/10ps

module test_TB;
  reg [11:0] ALUControl;
  reg [31:0] A, B;
  reg [31:0] zlow, zhigh;


  ALU alu(ALUControl, A, B, zlow,zhigh);


  initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, alu);
    #40;
    ALUControl <= 12'b0000_0000_1000;
    #5;
    A <= 32'b0000_0000_0000_0000_0000_0000_0001_1000;
    B <= 32'b0000_0000_0000_0000_0000_0000_0000_0011;
    #40;

    $finish;
  end
endmodule
