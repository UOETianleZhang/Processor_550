module squareRender (
  input [18:0]  address,
  input [7:0]  qin,
  input clk,
  input left,
  input right,
  input up,
  input down,
  input [9:0] scoreToPrint,
  output [9:0] myScore,
  output [9:0] toAdd,
  output reg [7:0]  qout,
    		input [10:0] offsetX,
	input [10:0] offsetY,
			output [10:0] rx,
	output [10:0] ry
);

 wire [9:0] i;
 wire [9:0] j;
 wire [9:0] k;
 wire [144:0] movingSquares;
 wire [144:0] background;
wire fall;
 //get the falling signal
// module autoDown(    
//    input clk,     
//    input down,        
//    output moveSig  
//);
autoDown fall1(clk, down, fall);

 //square size is 40
 parameter [9:0] w = 40;
 parameter [9:0] h = 40;
 parameter [7:0] colorIndex = 8'h02;
 
 //row of current addr
 assign i = address / 640;
 //col of current addr
 assign j = address % 640;
 //kth square of current addr
 assign k = i / w * 12 + j / h;
 
 //get the current moving square's index
//module curSquares (
//  input clk,
//  input left,
//  input right,
//  input up,
//  input down,
//  input [144:0] initialSquare,
//  input [144:0] initialBack,
//  output reg [144:0]  background = 145'd16426,
//  output reg [144:0]  squareIdx
//);

wire [144:0] initialSquare;
wire [144:0] initialBackground;
wire refresh;
//module initializer(
// input clk,
// input refresh,
// output [144:0] newShape
//);
//assign initialSquare = 145'h20038;

reachedBottom reachedBottom2(clk, background, movingSquares, refresh);
initializer init1(clk, refresh, initialSquare);
assign initialBackground = 145'b0;
//curSquares getPos1(clk, 1'b0, 1'b0, 1'b0, 1'b0, initialSquare, initialBackground, background, movingSquares);
curSquares getPos1(clk, left, right, up, fall, scoreToPrint, myScore, toAdd, initialSquare, initialBackground, background, movingSquares, offsetX, offsetY, rx, ry);


//assign background = 145'b00001111000000000010;
//assign movingSquares = 145'd16;
 
 always@(posedge clk) begin
  if((background[k] == 1'b1 || movingSquares[k] == 1'b1) && j < 480 && i % w != 0 && j % h != 0) begin
   qout = colorIndex;
  end
  else begin
   qout = qin;
  end
 end

endmodule