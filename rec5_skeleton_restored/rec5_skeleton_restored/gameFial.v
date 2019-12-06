module gameFail(
	input clk,
	input [143:0] backGround,
	input [143:0] currentSqs,
	output hasReachedTop
);

	assign hasReachedTop = currentSqs[11:0] != 0;

endmodule
