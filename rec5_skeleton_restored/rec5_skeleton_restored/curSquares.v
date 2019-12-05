module curSquares (
  input clk,
  input left,
  input right,
  input up,
  input down,
  input [144:0] initialSquare,
  input [144:0] initialBack,
  output [144:0] background_out,
  output [144:0]  movingSquares
);

assign background_out = background;
assign movingSquares = squareIdx;

reg [144:0]  background = 145'd5411;
reg [144:0]  squareIdx = 145'h20070;


wire leftBound;
wire rightBound;
wire downBound;

assign leftBound = 0;
assign rightBound = 0;
assign downBound = 0;

wire clk_2Hz;
//module counter(
//	input clk,
//	output clk_2Hz
//);
counter myCounter2Hz(clk, clk_2Hz);


 genvar i;
 generate 
 for (i = 0; i <= 144; i = i + 1) begin: for1
 always@(posedge clk_2Hz) begin
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