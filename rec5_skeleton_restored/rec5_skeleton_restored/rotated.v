module rotated(
	input clk,
	input [9:0] centralPoint,
	input [143:0] backGround,
	input [143:0] currentSqs,
	output [143:0] newSqs,
	output canRotate
);
	wire [10:0] rx;
	wire [10:0] ry;
	wire [10:0] offsetX;
	wire [10:0] offsetY;
//	wire [4:0] x [143:0];
//	wire [4:0] y [143:0];
//	wire [4:0] newX [143:0];
//	wire [4:0] newY [143:0];
	
	assign rx = centralPoint / 12;
	assign ry = centralPoint % 12;

	
  wire [143:0] signals;
  wire [143:0] valid;
//  genvar i;
//  generate 
//    for (i = 0; i < 144; i = i + 1) begin: for2
//		assign x[i] = i / 12;
//		assign y[i] = i % 12;
//		assign newX[i] = y[i] - ry + rx;
//		assign newY[i] = rx + ry - x[i];
//		assign valid[i] = newX[i] >= 0 && newX[i] < 144 && newY[i] >= 0 && newY[i] < 144;
//		assign signals[i] = ~valid[i] && currentSqs[i];
//		assign newSqs[newX[i] * 12 + newY[i]] = valid[i] ? currentSqs[i] : 1'b0;
//    end
//  endgenerate
// 
// 
// 
reg [11:0] inBoard_xy [11:0];
reg [11:0] inBoard_next_xy [11:0];
reg [143:0] inBoard;
reg [143:0] inBoard_next;
  
genvar i;
generate 
for (i = 0; i < 144; i = i + 1) begin: for1
    always@(posedge clk) begin
//		newX[i] = (12 - (i % 12));
//		newY[i] =  i / 12;
//		signals[i] = currentSqs[i] && (newX[i] - offsetX  < 0 || newY[i] - offsetY < 0 || newX[i] - offsetX  > 143 ||  newY[i] - offsetY > 143);
//		if (up) begin
			//inBoard[i] = currentSqs[newX[i] * 12 + newY[i]];
			inBoard_xy[i / 12][i % 12] = currentSqs[(11 - (i % 12)) * 12 + (i / 12)];
//			inBoard[i] = currentSqs[( (12 - (i % 12)) * 12 + (i / 12) - 1 )% 144];
//		end
		
    end
	 
//	 always@(posedge clk) begin
////	 if (i - offsetX and j - offsetY valid) {
////		inBoard_next[i][j] = inBoard[i - offsetX][j - offsetY];
////	 }
////		inBoard_next_xy[i / 12][i % 12] = (i/12 - offsetX >= 0 && i/12 - offsetX < 144 && i%12 - offsetY >= 0 && i%12 - offsetY < 144) ? inBoard_xy[i/12 - offsetX][i%12 - offsetY] : 1'b0;
//	 end
	 assign signals[i] = ((inBoard_xy[i/12][i%12])  && (~((i/12 + rx >= ry) && (i/12 +rx < 12 + ry) && (i%12 +  rx + ry >= 11) && (i%12 + rx + ry < 12 + 11)))) || (backGround[i] && newSqs[i]);
//	 assign newSqs[i] = inBoard_next_xy[i / 12][i % 12];

//	 assign  newSqs[i] = (((i/12 + offsetX) >= 0) && ((i/12 + offsetX) < 12) && ((i%12 + offsetY) >= 0) && ((i%12 + offsetY) < 12)) ? inBoard_xy[i/12 + offsetX][i%12 + offsetY] : 1'b0;
		assign  newSqs[i] = ((i/12 + ry >= rx) && (i/12 + ry  < 12 + rx) && (i%12 + 11 >= rx + ry) && (i%12 + 11  < 12 + rx + ry)) ? inBoard_xy[i/12 + ry - rx][i%12 + 11 - rx - ry] : 1'b0;

		//	 always@(posedge clk) begin
//		signals[i] =  (i/12 + offsetX < 0 || i/12 + offsetX >= 144 || i%12 + offsetY < 0 || i%12 + offsetY >= 144);
//	 end
end
endgenerate

	assign canRotate = signals == 145'b0;
	assign offsetY = 11 - rx - ry;	//coor should left shift by
	assign offsetX = ry - rx; // should move up by
//assign newSqs = inBoard_next;

endmodule
