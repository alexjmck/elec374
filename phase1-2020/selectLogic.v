`timescale 1ns/10ps

module selectLogic(
  
  input Gra,
  input Grb,
  input Grc,
  input Rin_in,
  input Rout_in,
  input BAout,
  input [31:0] IR,
  
  output reg [31:0] C_sign_extended_num,
  output reg [15:0] Rin,
  output reg [15:0] Rout,
);
 
  reg [3:0] gateAND1temp;
  reg [3:0] gateAND2temp;
  reg [3:0] gateAND3temp;
  reg [3:0] gateAND4temp;
  
  reg [15:0] encodeout;
  
  // OP Code info
  // Ra IR[26:23]
  // Rb IR[22:19]
  // Rc IR[18:15]
  
  assign gateAND1temp = IR[26:23] & {4{Gra}};
  assign gateAND2temp = IR[22:19] & {4{Grb}};
  assign gateAND3temp = IR[18:15] & {4{Grc}};
  assign gateAND4temp = ((gateAND1temp | gateAND2temp) | gateAND3temp);
  
  
  C_sign_extend csed(
    IR,
    C_sign_extended_num
  );
  
  encoder4to16 encodeer(
    gateAND4temp,
    encodeout
  );
  //ssss
  
  assign Rin = ({16{Rin_in}} & encodeout);
  assign Rout = (({16{Rout_in}} | {16{BAout}}) & encodeout);
  
    
endmodule

// C sign extend function

module C_sign_extend(
  input [31:0] in,
  output reg [31:0] out
);
 
  always @ (*) begin
    out <= {{13{in[18]}},{in[18:0]}};
  end
endmodule



// Encoder 4 to 16 implementation

 // 4 to 16 encoder used in the select and encode

module encoder4to16(
  input [3:0] dataIn,
  output reg [15:0] dataOut
);
  
  always @( * ) begin
    
    case (dataIn)
      4'b0000: begin dataOut=16'd1; end
      4'b0001: begin dataOut=16'd2; end
      4'b0010: begin dataOut=16'd4; end
      4'b0011: begin dataOut=16'd8; end
      4'b0100: begin dataOut=16'd16; end
      4'b0101: begin dataOut=16'd32; end
      4'b0110: begin dataOut=16'd64; end
      4'b0111: begin dataOut=16'd128; end
      4'b1000: begin dataOut=16'd256; end
      4'b1001: begin dataOut=16'd512; end
      4'b1010: begin dataOut=16'd1024; end
      4'b1011: begin dataOut=16'd2048; end
      4'b1100: begin dataOut=16'd4096; end
      4'b1101: begin dataOut=16'd8192; end
      4'b1110: begin dataOut=16'd16384; end
      4'b1111: begin dataOut=16'd32768; end
    endcase    
  end

endmodule