module getScoreCpu(
 input clk,
 input reset,
 input [3:0] var,
 input [10:0] rx,
 input [10:0] ry,
 input [9:0] curScore,
 output [10:0] offsetX,
 output [10:0] offsetY,
 output [9:0] score
);
 
 wire[9:0] nextScore;
 

//module cpu(clock, reset, var, curScore, nextScore, rx, ry, offsetX, offsetY);
//    input clock, reset;
//  input[3:0] var;
//  input [9:0] curScore;
//  input [10:0] rx,
//  input [10:0] ry,
//  output [10:0] offsetX,
//  output [10:0] offsetY,
//  output [9:0] nextScore;
 cpu cscore1(clk, reset, var, curScore, score, rx, ry, offsetX, offsetY);

endmodule