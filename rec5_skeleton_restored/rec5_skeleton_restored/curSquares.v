module curSquares (
  input clk,
  input leftSignal,
  input rightSignal,
  input upSignal,
  input downSignal,
  input [144:0] initialSquare,
  input [144:0] initialBack,
  output [144:0] background_out,
  output [144:0]  movingSquares
);


assign background_out = background;
assign movingSquares = squareIdx;

reg [144:0]  background = 145'd5411;
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

 genvar i;
 generate 
 for (i = 0; i <= 144; i = i + 1) begin: for1
 always@(posedge clk) begin
   if(downBound)begin
    background[i] = squareIdx[i] ? 1'b1 : background[i];
    squareIdx[i] = initialSquare[i];
   end
 
   else begin
    if(left && ~leftBound) begin
        squareIdx[i] = i < 144 ? squareIdx[i + 1] : 1'b0;
  //squareIdx[i + 1] = 1'b0;
  end
    else if(right && ~rightBound) begin
      squareIdx[i] = i > 0 ? squareIdx[i - 1] : 1'b0;
  //squareIdx[i - 1] = 1'b0;
  end
    else if(down && ~downBound) begin
      squareIdx[i] = i >= 12 ? squareIdx[i - 12] : 1'b0;
  //squareIdx[i - 12] = 1'b0;
    end
    else begin
        squareIdx[i] = squareIdx[i];
    end
   end
 
 end
 end
 endgenerate


//  genvar i;
//  generate 
//  for (i = 0; i < 144; i = i + 1) begin: for1
//  always@(posedge clk) begin
//   if(downBound == 1'b1)begin
//    //background[i] = background[i] || squareIdx[i];
//    if(squareIdx[i] == 1'b1)begin
//     background[i] = 1'b1;
//    end
//    squareIdx[i] = initialSquare[i];
//   end
//   else begin
//    if(left && leftBound == 1'b0 && squareIdx[i + 1] == 1)
//     squareIdx[i] = 1'b1;
//    else if(i > 0 && right && rightBound == 1'b0) begin
//     if(squareIdx[i - 1] == 1)
//      squareIdx[i] = 1'b1;
//    end
//    else if(i >= 12 && down && downBound == 1'b0) begin
//     if(squareIdx[i - 12] == 1)
//      squareIdx[i] = 1'b1;
//    end
//   end
//  end
//  end
//  endgenerate


endmodule