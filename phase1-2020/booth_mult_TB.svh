// Testing Booth

module booth_mult_TB;

  reg [31:0] mult = 31'h0;
  reg [31:0] multr;
  wire [31:0] ZhighOut;
  wire [31:0] ZlowOut;

  

initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, mult_test);

    mult <= 31'h3;
    multr <= 31'h8;
    #40
	$finish;
end
  
    booth_mult mult_test(
	mult,
	multr,
	ZhighOut,
    ZlowOut
    );



endmodule
