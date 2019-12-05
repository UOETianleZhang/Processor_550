module counter(
	input clk,
	output clk_2Hz
);

reg clk_out = 1'b0;
reg [24:0] count = 25'b0;

 always@(posedge clk) begin
	if (count == 25'd10000000) begin
		clk_out = 1'b1;
		count = 0;
	end
	else begin
		clk_out = 1'b0;
		count = count + 1;
	end
 end
 
 assign clk_2Hz = clk_out;

endmodule
