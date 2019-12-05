module reachedBottom(
	input clk,
	input [144:0] backGround,
	input [144:0] currentSqs,
	output hasReachedBottom
);

  wire [144:0] signals;
  genvar i;
  generate 
    for (i = 0; i < 144; i = i + 1) begin: for2
		assign signals[i] = (currentSqs[i] == 1'b1 && (i / 12 == 11 || backGround[i + 12] == 1'b1)) ? 1'b1 : 1'b0;
    end
  endgenerate
  
  assign hasReachedBottom = signals > 145'b0 ? 1'b1 : 1'b0;

endmodule