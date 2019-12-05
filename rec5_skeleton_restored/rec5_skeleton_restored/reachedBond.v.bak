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
		assign leftBond[i] = (currentSqs[i] == 1'b1 && (i % 12 == 0 || backGround[i - 1] == 1'b1)) ? 1'b1 : 1'b0;
    end
  endgenerate
  
  assign hasReachedLeft = leftBond > 145'b0 ? 1'b1 : 1'b0;
  
  genvar j;
  generate 
    for (j = 0; j < 144; j = j + 1) begin: for3
		assign rightBond[j] = (currentSqs[j] == 1'b1 && (j % 12 == 11 || backGround[j + 1] == 1'b1)) ? 1'b1 : 1'b0;
    end
  endgenerate
  
  assign hasReachedRight = rightBond > 145'b0 ? 1'b1 : 1'b0;

endmodule
