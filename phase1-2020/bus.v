`timescale 1ns / 1ps

module bus(

  // Encoder inputs and outputs
  input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
  input HIout, LOout, zhighout, zlowout, PCout, MDRout, InPortout, Cout,

  // 32 to 1 Mux inputs and outputs
  input [31:0] R0MuxIn, R1MuxIn, R2MuxIn, R3MuxIn, R4MuxIn, R5MuxIn, R6MuxIn, R7MuxIn, R8MuxIn, R9MuxIn, R10MuxIn, R11MuxIn, R12MuxIn, R13MuxIn, R14MuxIn, R15MuxIn,
  input [31:0] HIMuxIn, LOMuxIn, zhighMuxIn, zlowMuxIn, PCMuxIn, MDRMuxIn, InPortMuxIn, CMuxin,
  output [31:0] BusMuxOut

  );

  wire [4:0] Sout;
  
  // Run Encoder_32_to_5
  Encoder_32_to_5 encoder32to5(R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
                  HIout, LOout, zhighout, zlowout, PCout, MDRout, InPortout, Cout, Sout);

  // Run Mux32to1 with Encoder S output
  Mux32to1 mux32to1(R0MuxIn, R1MuxIn, R2MuxIn, R3MuxIn, R4MuxIn, R5MuxIn, R6MuxIn, R7MuxIn, R8MuxIn, R9MuxIn, R10MuxIn, R11MuxIn, R12MuxIn, R13MuxIn, R14MuxIn, R15MuxIn,
    HIMuxIn, LOMuxIn, zhighMuxIn, zlowMuxIn, PCMuxIn, MDRMuxIn, InPortMuxIn, CMuxin, Sout, BusMuxOut);


endmodule
