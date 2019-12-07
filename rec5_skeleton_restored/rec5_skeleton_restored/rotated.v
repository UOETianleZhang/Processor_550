module rotated(
	input [9:0] centralPoint,
	input [143:0] backGround,
	input [143:0] currentSqs,
	output [143:0] newSqs,
	output canRotate
);
	
	wire [3:0] rx;
	wire [3:0] ry;
	assign rx = centralPoint / 12;
	assign ry = centralPoint % 12;

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
  

endmodule
