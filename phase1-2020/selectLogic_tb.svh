`timescale 1ns/10ps

module selectLogic_tb;
  
  reg Gra;
  reg Grb;
  reg Grc;
  reg Rin_in;
  reg Rout_in;
  reg BAout;
  reg [31:0] IR;
  
  reg [31:0] C_sign_extended_num;
  
  reg [15:0] Rin;
  reg [15:0] Rout;


  selectLogic SL_test(
    Gra,
    Grb,
    Grc,
    Rin_in,
    Rout_in,
    BAout,
    IR,
  
    C_sign_extended_num,
  
    Rin,
    Rout
    
    );

initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, SL_test);
    Gra = 0;
    Grb = 0;
    Grc = 1;
    Rin_in = 0;
    Rout_in = 1;
    BAout = 0;
    // IR{OP-code , Ra  , Rb  , Rc, rest of the binary}
  IR = {5'bXXXXX, 4'b0001, 4'b1000, 4'b0100, 15'b0};
    #40;
	$finish;
end


endmodule