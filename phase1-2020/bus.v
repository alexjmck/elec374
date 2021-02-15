`timescale 1ns / 1ps

module bus (


  );

  // Registers
  gen_reg32 PCreg(?input?, clk, clr, reset, output_Q);
  gen_reg32 IRreg(?input?, clk, clr, reset, output_Q);

  gen_reg32 R0(?input?, clk, clr, reset, output_Q);
  gen_reg32 R1(?input?, clk, clr, reset, output_Q);
  gen_reg32 R2(?input?, clk, clr, reset, output_Q);
  gen_reg32 R3(?input?, clk, clr, reset, output_Q);
  gen_reg32 R4(?input?, clk, clr, reset, output_Q);
  gen_reg32 R5(?input?, clk, clr, reset, output_Q);
  gen_reg32 R6(?input?, clk, clr, reset, output_Q);
  gen_reg32 R7(?input?, clk, clr, reset, output_Q);
  gen_reg32 R8(?input?, clk, clr, reset, output_Q);
  gen_reg32 R9(?input?, clk, clr, reset, output_Q);
  gen_reg32 R10(?input?, clk, clr, reset, output_Q);
  gen_reg32 R11(?input?, clk, clr, reset, output_Q);
  gen_reg32 R12(?input?, clk, clr, reset, output_Q);
  gen_reg32 R13(?input?, clk, clr, reset, output_Q);
  gen_reg32 R14(?input?, clk, clr, reset, output_Q);
  gen_reg32 R15(?input?, clk, clr, reset, output_Q);

  //Input declaration


  // Output declaration




  // Port declaration


  // Code and behaviour

  always @ (postedge clock)

  begin:





  end


endmodule
