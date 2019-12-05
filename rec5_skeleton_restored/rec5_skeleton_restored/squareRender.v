module squareRender (
  input [18:0]  address,
  input [7:0]  qin,
  input clk,
  input left,
  input right,
  input up,
  input down,
  output reg [7:0]  qout
);

 wire [9:0] i;
 wire [9:0] j;
 wire [9:0] k;
 wire [144:0] movingSquares;
 wire [144:0] background;

 //square size is 40
 parameter [9:0] w = 40;
 parameter [9:0] h = 40;
 parameter [7:0] colorIndex = 8'haa;
 
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
assign initialSquare = 145'h20070;
assign initialBackground = 145'b00001111000000000010;
//curSquares getPos1(clk, 1'b0, 1'b0, 1'b0, 1'b0, initialSquare, initialBackground, background, movingSquares);
curSquares getPos1(clk, left, right, up, down, initialSquare, initialBackground, background, movingSquares);


//assign background = 145'b00001111000000000010;
//assign movingSquares = 145'd16;
 
 always@(posedge clk) begin
  if((background[k] == 1'b1 || movingSquares[k] == 1'b1) && j < 480) begin
   qout = colorIndex;
  end
  else begin
   qout = qin;
  end
 end

endmodule