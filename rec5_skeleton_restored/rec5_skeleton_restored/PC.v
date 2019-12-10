module PC (
 input [11:0] D, //32  32-bit registers
 input clk,
 input reset,
 output [11:0] Q
);

 genvar i;
 generate 
  for (i = 0; i < 12; i = i + 1) begin: for1
   dffe_ref myDffe(Q[i], D[i], clk, 1'b1, reset);
  end
 endgenerate
endmodule