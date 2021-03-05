`timescale 1ns/10ps

module RAM(

  input [8:0] mem_location,

  input [31:0] dataIn,

  input read, write,

  output [31:0] dataOut

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
