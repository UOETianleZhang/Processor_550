module curSquares (
  input clk,
  input leftSignal,
  input rightSignal,
  input upSignal,
  input downSignal,
  input [9:0] scoreToPrint,
  output [9:0] myScore_out,
  output [9:0] toAdd_out,
  input [144:0] initialSquare,
  input [144:0] initialBack,
  output [144:0] background_out,
  output [144:0]  movingSquares,
  		input [10:0] offsetX,
	input [10:0] offsetY,
		output [10:0] rx,
	output [10:0] ry
);
//	wire [10:0] rx;
//	wire [10:0] ry;

reg [9:0] myScore = 0;
reg [9:0] toAdd = 0;
assign myScore_out = myScore;
assign toAdd_out = toAdd;

assign background_out = background;
assign movingSquares = squareIdx;

reg [144:0]  background = 145'd0;
reg [144:0]  squareIdx = 145'h20070;

//module reachedBond(
//	input clk,
//	input [144:0] backGround,
//	input [144:0] currentSqs,
//	output hasReachedLeft, hasReachedRight
//);
reachedBond reachedBond1(clk, background_out, movingSquares, leftBound, rightBound);

//module reachedBottom(
//	input clk,
//	input [144:0] backGround,
//	input [144:0] currentSqs,
//	output hasReachedBottom
//);

reachedBottom reachedBottom1(clk, background_out, movingSquares, downBound);
//assign downBound = 1'b1;

wire leftBound;
wire rightBound;
wire downBound;

//assign leftBound = 0;
//assign rightBound = 0;
//assign downBound = 0;

wire clk_2Hz;
//module counter(
//	input clk,
//	output clk_2Hz
//);
counter myCounter2Hz(clk, clk_2Hz);

  wire left, right, up, down;
  assign left = leftSignal;
  assign right = rightSignal;
  assign up = upSignal;
  assign down = downSignal;
//always@(posedge leftSignal) begin
//	left
//end

//module rotated(
//	input up,
//	input [9:0] centralPoint,
//	input [143:0] backGround,
//	input [143:0] currentSqs,
//	output [143:0] newSqs,
//	output canRotate
//);

wire [144:0] newSqs;
wire canRotate;
reg [9:0] centralPoint = 10'd5;
rotated myRo(clk, centralPoint, background_out, squareIdx, newSqs, canRotate, offsetX, offsetY, rx, ry);

 always@(posedge clk) begin
	  if(downBound && scoreCounter == 1999)begin
			centralPoint = 10'd5;
	  end
	  
	  else begin
		if(left && ~leftBound) begin
			centralPoint = centralPoint - 1;
	  end
			else if(right && ~rightBound) begin
			centralPoint = centralPoint + 1;
	  end
			else if(down && ~downBound) begin
			centralPoint = centralPoint + 12;
			end
			else begin
				 centralPoint = centralPoint;
			end
	  end

 end

genvar i;
generate 
for (i = 0; i <= 144; i = i + 1) begin: for1
    always@(posedge clk) begin
        if(downBound && scoreCounter == 1999) begin
//            background_next[i] = background[11:0] > 0 ? 145'b0 : (squareIdx[i] ? 1'b1 : background[i]);
				background_next[i] = squareIdx[i] ? 1'b1 : background[i];
            squareIdx[i] = initialSquare[i];
				
        end
        
        else begin
			if(up && canRotate) begin
				squareIdx[i] = newSqs[i];
			end
            else if(left && ~leftBound) begin
                squareIdx[i] = i < 144 ? squareIdx[i + 1] : 1'b0;
        end
            else if(right && ~rightBound) begin
            squareIdx[i] = i > 0 ? squareIdx[i - 1] : 1'b0;
        end
            else if(down && ~downBound) begin
            squareIdx[i] = i >= 12 ? squareIdx[i - 12] : 1'b0;
            end
            else begin
                squareIdx[i] = squareIdx[i];
            end
        end

    end
end
endgenerate

    always@(posedge clk) begin
		next = downBound;
	 end
reg next_next = 1'b0;
	 always@(posedge clk) begin
		next_next = next;
	 end

reg [144:0]  background_next = 145'd0;
reg [25:0] scoreCounter = 0;

reg next = 1'b0;
always@(posedge clk) begin
//        if() begin
////            background_next[i] = background[11:0] > 0 ? 145'b0 : (squareIdx[i] ? 1'b1 : background[i]);
//				myScore = scoreToPrint;
//        end

//	if (next_next) begin
	if (downBound && scoreCounter == 2000) begin
		myScore = scoreToPrint;
		toAdd = 0;
		background = background_next;
		 if (background[11:0] == 12'hFFF) begin
			  background[11:0] = 12'h000;
			  toAdd = toAdd + 1;
		 end
		 if (background[23:12] == 12'hFFF) begin
			 background[23:0] = {background[11:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[35:24] == 12'hFFF) begin
			 background[35:0] = {background[23:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[47:36] == 12'hFFF) begin
			 background[47:0] = {background[35:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[59:48] == 12'hFFF) begin
			 background[59:0] = {background[47:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[71:60] == 12'hFFF) begin
			 background[71:0] = {background[59:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[83:72] == 12'hFFF) begin
			 background[83:0] = {background[71:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[95:84] == 12'hFFF) begin
			 background[95:0] = {background[83:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[107:96] == 12'hFFF) begin
			 background[107:0] = {background[95:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[119:108] == 12'hFFF) begin
			 background[119:0] = {background[107:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[131:120] == 12'hFFF) begin
			 background[131:0] = {background[119:0],12'h000};
			 toAdd = toAdd + 1;
		 end
		 if (background[143:132] == 12'hFFF) begin
			 background[143:0] = {background[131:0],12'h000};
			 toAdd = toAdd + 1;
		end
	 
	 end
	 
	 
	 if (scoreCounter == 2000) begin
		scoreCounter = 0;
	 end
	 else begin
			 scoreCounter = scoreCounter + 1;
	 end
end


endmodule