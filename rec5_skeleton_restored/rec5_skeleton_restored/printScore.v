module printScore(
 input clk,
 input [18:0]  address,
   input [7:0]  qin,
 input [9:0] score,
 output reg [7:0] qout
);

 wire [9:0] i;
 wire [9:0] j;
 wire [9:0] k;
 
  //row of current addr
 assign i = address / 640;
 //col of current addr
 assign j = address % 640;
 //kth transitor of current addr
 assign k = i / w * 16 + (j-480) / h;
 
 //for score part, we have 768 units in total
 wire[768:0] scoreIdx;
 //unit size, width is w, height is h
 parameter [9:0] w = 10;
 parameter [9:0] h = 10;
 parameter [7:0] colorIndex = 8'h00; //white
 
 
// module curScore(
// input clk,
// input [9:0] score,
// output [768:0] scoreIdx
//);
 curScore getScore1(clk, score, scoreIdx);

 
 always@(posedge clk) begin
  if((scoreIdx[k] == 1'b1) && j >= 480) begin
   qout = colorIndex;	//white
  end
  else begin
//   qout = qin;
		qout = 8'h03;
		
  end
 end
 

endmodule