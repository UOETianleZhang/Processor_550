module reachedBottom(
	input clk,
	input [143:0] backGround,
	input [143:0] currentSqs,
	output hasReachedBottom
);

  wire [143:0] signals;
  genvar i;
  generate 
    for (i = 0; i < 144; i = i + 1) begin: for2
		if (i + 12 >= 144) 
			assign signals[i] = currentSqs[i];
		else
			assign signals[i] = currentSqs[i] && backGround[i + 12];
    end
  endgenerate
  
  assign hasReachedBottom = signals > 145'b0;

endmodule
