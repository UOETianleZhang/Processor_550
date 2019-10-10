module square (
  input [18:0]  address,
  input clk,
//  input [7:0] keyB,
  input [7:0]  qin,
  output reg [7:0]  qout,
  input left,
  input right,
  input up,
  input down
);

 wire [9:0] i;
 wire [9:0] j;
 
 reg [9:0] x = 100;
 reg [9:0] y = 100;
 
 parameter [9:0] w = 20;
 parameter [9:0] h = 40;
 parameter [7:0] colorIndex = 8'haa;
 
 assign i = address / 640;
 assign j = address % 640;
 
 always@(posedge clk) begin
  if (x >= i && x < i + h && y >= j && y < j + w) begin
   qout = colorIndex;
  end
  else begin
   qout = qin;
  end
 end
 
// reg left = 0;
// reg right = 0;
// reg up = 0;
// reg down = 0;
// always@(posedge keyB) begin
//  if (keyB == 8'h6b) //left
//   left = 1;
//  if (keyB == 8'h74)
//   right = 1;
//  if (keyB == 8'h75)
//   up = 1;
//  if (keyB == 8'h72)
//   down = 1;
// end
 
// always@(posedge clk) begin
//  left = 0;
//  right = 0;
//  up = 0;
//  down = 0;
// end
// 
 reg [220:0] counter = 0;
 always@(posedge clk) begin
 if (~left|| ~right|| ~up || ~down) begin
	if (counter == 0) begin
	  if (~left) //left
		y = y - 1;
	  else if (~right)
		y = y + 1;
	  else if (~up)
		x = x - 1;
	  else if (~down)
		x = x + 1;
	  counter = counter + 1;
	end
end 
else
		counter = 0;
	
 end
 
// always@(posedge left or posedge right or posedge up or posedge down) begin
//  if (left == 1 && y > 0) //left
//   y = y - 1;
//  else if (right == 1 && y < 620)
//   y = y + 1;
//  else if (up == 1 && x > 0)
//   x = x - 1;
//  else if (down == 1 && x <440)
//   x = x + 1;
// end
// always@(posedge right) begin
// y = y + 1;
// end
//  always@(posedge up) begin
//   x = x + 1;
// end
//  always@(posedge down) begin
//   x = x - 1;
// end
endmodule