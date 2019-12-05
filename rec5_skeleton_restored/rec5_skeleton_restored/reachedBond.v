module reachedBond(
	input clk,
	input [144:0] backGround,
	input [144:0] currentSqs,
	output hasReachedLeft, hasReachedRight
);

  wire [144:0] leftBond;
  wire [144:0] rightBond;
  genvar i;
  generate 
    for (i = 0; i < 144; i = i + 1) begin: for2
		if (i % 12 == 0)
			assign leftBond[i] = currentSqs[i];
		else
			assign leftBond[i] = currentSqs[i] && backGround[i - 1];
    end
  endgenerate
  
  assign hasReachedLeft = leftBond > 145'b0 ? 1'b1 : 1'b0;
  
  genvar j;
  generate 
    for (j = 0; j < 144; j = j + 1) begin: for3
		if (j % 12 == 11)
			assign rightBond[j] = currentSqs[j];
		else
			assign rightBond[j] = currentSqs[j] && backGround[j + 1];
    end
  endgenerate
  
  assign hasReachedRight = rightBond > 145'b0 ? 1'b1 : 1'b0;

endmodule
