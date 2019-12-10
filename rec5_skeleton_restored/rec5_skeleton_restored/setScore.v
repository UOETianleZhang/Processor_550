module setScore(
 input clk,
 input [9:0] digit1,
 input [9:0] digit2,
 input [9:0] digit3,
 input [9:0] step1,
 input [9:0] step2,
 input [9:0] step3,
 output [768:0] scoreIdx
);

reg[768:0] score;
assign scoreIdx = score;

always@(posedge clk) begin
 score = 769'b0;
 case(digit1)
    9'd0:begin
     score[step1] = 1'b1;
     score[1+step1] = 1'b1;
     score[2+step1] = 1'b1;
     score[16+step1] = 1'b1;
     score[18+step1] = 1'b1;
     score[32+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[48+step1] = 1'b1;
     score[50+step1] = 1'b1;
     score[64+step1] = 1'b1;
     score[65+step1] = 1'b1;
     score[66+step1] = 1'b1;
     end
     
    9'd1:begin
     score[2+step1] = 1'b1;
     score[18+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[50+step1] = 1'b1;
     score[66+step1] = 1'b1;
     end
     
    9'd2:begin
       score[0+step1] = 1'b1;
     score[1+step1] = 1'b1;
     score[2+step1] = 1'b1;
     score[18+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[33+step1] = 1'b1;
     score[32+step1] = 1'b1;
     score[48+step1] = 1'b1;
     score[64+step1] = 1'b1;
     score[65+step1] = 1'b1;
     score[66+step1] = 1'b1;
     end
     
    9'd3:begin
     score[0+step1] = 1'b1;
     score[1+step1] = 1'b1;
     score[2+step1] = 1'b1;
     score[18+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[33+step1] = 1'b1;
     score[32+step1] = 1'b1;
     score[50+step1] = 1'b1;
     score[66+step1] = 1'b1;
     score[65+step1] = 1'b1;
     score[64+step1] = 1'b1;
     end
     
    9'd4:begin
     score[0+step1] = 1'b1;
     score[16+step1] = 1'b1;
     score[32+step1] = 1'b1;
     score[33+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[18+step1] = 1'b1;
     score[2+step1] = 1'b1;
     score[50+step1] = 1'b1;
     score[66+step1] = 1'b1;
     end
     
    9'd5:begin
     score[2+step1] = 1'b1;
     score[1+step1] = 1'b1;
     score[0+step1] = 1'b1;
     score[16+step1] = 1'b1;
     score[32+step1] = 1'b1;
     score[33+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[50+step1] = 1'b1;
     score[66+step1] = 1'b1;
     score[65+step1] = 1'b1;
     score[64+step1] = 1'b1;
     end
     
    9'd6:begin
     score[2+step1] = 1'b1;
     score[1+step1] = 1'b1;
     score[0+step1] = 1'b1;
     score[16+step1] = 1'b1;
     score[32+step1] = 1'b1;
     score[33+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[48+step1] = 1'b1;
     score[50+step1] = 1'b1;
     score[66+step1] = 1'b1;
     score[65+step1] = 1'b1;
     score[64+step1] = 1'b1;
     end
     
    9'd7:begin
     score[0+step1] = 1'b1;
     score[1+step1] = 1'b1;
     score[2+step1] = 1'b1;
     score[18+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[50+step1] = 1'b1;
     score[66+step1] = 1'b1;
     end
     
    9'd8:begin
     score[2+step1] = 1'b1;
     score[1+step1] = 1'b1;
     score[0+step1] = 1'b1;
     score[16+step1] = 1'b1;
     score[18+step1] = 1'b1;
     score[32+step1] = 1'b1;
     score[33+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[48+step1] = 1'b1;
     score[50+step1] = 1'b1;
     score[66+step1] = 1'b1;
     score[65+step1] = 1'b1;
     score[64+step1] = 1'b1;
     end
     
    9'd9:begin
     score[2+step1] = 1'b1;
     score[1+step1] = 1'b1;
     score[0+step1] = 1'b1;
     score[16+step1] = 1'b1;
     score[18+step1] = 1'b1;
     score[32+step1] = 1'b1;
     score[33+step1] = 1'b1;
     score[34+step1] = 1'b1;
     score[50+step1] = 1'b1;
     score[66+step1] = 1'b1;
     score[65+step1] = 1'b1;
     score[64+step1] = 1'b1;
     end
  endcase
  
  case(digit2)
    9'd0:begin
     score[step2] = 1'b1;
     score[1+step2] = 1'b1;
     score[2+step2] = 1'b1;
     score[16+step2] = 1'b1;
     score[18+step2] = 1'b1;
     score[32+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[48+step2] = 1'b1;
     score[50+step2] = 1'b1;
     score[64+step2] = 1'b1;
     score[65+step2] = 1'b1;
     score[66+step2] = 1'b1;
     end
     
    9'd1:begin
     score[2+step2] = 1'b1;
     score[18+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[50+step2] = 1'b1;
     score[66+step2] = 1'b1;
     end
     
    9'd2:begin
       score[0+step2] = 1'b1;
     score[1+step2] = 1'b1;
     score[2+step2] = 1'b1;
     score[18+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[33+step2] = 1'b1;
     score[32+step2] = 1'b1;
     score[48+step2] = 1'b1;
     score[64+step2] = 1'b1;
     score[65+step2] = 1'b1;
     score[66+step2] = 1'b1;
     end
     
    9'd3:begin
     score[0+step2] = 1'b1;
     score[1+step2] = 1'b1;
     score[2+step2] = 1'b1;
     score[18+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[33+step2] = 1'b1;
     score[32+step2] = 1'b1;
     score[50+step2] = 1'b1;
     score[66+step2] = 1'b1;
     score[65+step2] = 1'b1;
     score[64+step2] = 1'b1;
     end
     
    9'd4:begin
     score[0+step2] = 1'b1;
     score[16+step2] = 1'b1;
     score[32+step2] = 1'b1;
     score[33+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[18+step2] = 1'b1;
     score[2+step2] = 1'b1;
     score[50+step2] = 1'b1;
     score[66+step2] = 1'b1;
     end
     
    9'd5:begin
     score[2+step2] = 1'b1;
     score[1+step2] = 1'b1;
     score[0+step2] = 1'b1;
     score[16+step2] = 1'b1;
     score[32+step2] = 1'b1;
     score[33+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[50+step2] = 1'b1;
     score[66+step2] = 1'b1;
     score[65+step2] = 1'b1;
     score[64+step2] = 1'b1;
     end
     
    9'd6:begin
     score[2+step2] = 1'b1;
     score[1+step2] = 1'b1;
     score[0+step2] = 1'b1;
     score[16+step2] = 1'b1;
     score[32+step2] = 1'b1;
     score[33+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[48+step2] = 1'b1;
     score[50+step2] = 1'b1;
     score[66+step2] = 1'b1;
     score[65+step2] = 1'b1;
     score[64+step2] = 1'b1;
     end
     
    9'd7:begin
     score[0+step2] = 1'b1;
     score[1+step2] = 1'b1;
     score[2+step2] = 1'b1;
     score[18+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[50+step2] = 1'b1;
     score[66+step2] = 1'b1;
     end
     
    9'd8:begin
     score[2+step2] = 1'b1;
     score[1+step2] = 1'b1;
     score[0+step2] = 1'b1;
     score[16+step2] = 1'b1;
     score[18+step2] = 1'b1;
     score[32+step2] = 1'b1;
     score[33+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[48+step2] = 1'b1;
     score[50+step2] = 1'b1;
     score[66+step2] = 1'b1;
     score[65+step2] = 1'b1;
     score[64+step2] = 1'b1;
     end
     
    9'd9:begin
     score[2+step2] = 1'b1;
     score[1+step2] = 1'b1;
     score[0+step2] = 1'b1;
     score[16+step2] = 1'b1;
     score[18+step2] = 1'b1;
     score[32+step2] = 1'b1;
     score[33+step2] = 1'b1;
     score[34+step2] = 1'b1;
     score[50+step2] = 1'b1;
     score[66+step2] = 1'b1;
     score[65+step2] = 1'b1;
     score[64+step2] = 1'b1;
     end
  endcase
  
  case(digit3)
    9'd0:begin
     score[step3] = 1'b1;
     score[1+step3] = 1'b1;
     score[2+step3] = 1'b1;
     score[16+step3] = 1'b1;
     score[18+step3] = 1'b1;
     score[32+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[48+step3] = 1'b1;
     score[50+step3] = 1'b1;
     score[64+step3] = 1'b1;
     score[65+step3] = 1'b1;
     score[66+step3] = 1'b1;
     end
     
    9'd1:begin
     score[2+step3] = 1'b1;
     score[18+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[50+step3] = 1'b1;
     score[66+step3] = 1'b1;
     end
     
    9'd2:begin
       score[0+step3] = 1'b1;
     score[1+step3] = 1'b1;
     score[2+step3] = 1'b1;
     score[18+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[33+step3] = 1'b1;
     score[32+step3] = 1'b1;
     score[48+step3] = 1'b1;
     score[64+step3] = 1'b1;
     score[65+step3] = 1'b1;
     score[66+step3] = 1'b1;
     end
     
    9'd3:begin
     score[0+step3] = 1'b1;
     score[1+step3] = 1'b1;
     score[2+step3] = 1'b1;
     score[18+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[33+step3] = 1'b1;
     score[32+step3] = 1'b1;
     score[50+step3] = 1'b1;
     score[66+step3] = 1'b1;
     score[65+step3] = 1'b1;
     score[64+step3] = 1'b1;
     end
     
    9'd4:begin
     score[0+step3] = 1'b1;
     score[16+step3] = 1'b1;
     score[32+step3] = 1'b1;
     score[33+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[18+step3] = 1'b1;
     score[2+step3] = 1'b1;
     score[50+step3] = 1'b1;
     score[66+step3] = 1'b1;
     end
     
    9'd5:begin
     score[2+step3] = 1'b1;
     score[1+step3] = 1'b1;
     score[0+step3] = 1'b1;
     score[16+step3] = 1'b1;
     score[32+step3] = 1'b1;
     score[33+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[50+step3] = 1'b1;
     score[66+step3] = 1'b1;
     score[65+step3] = 1'b1;
     score[64+step3] = 1'b1;
     end
     
    9'd6:begin
     score[2+step3] = 1'b1;
     score[1+step3] = 1'b1;
     score[0+step3] = 1'b1;
     score[16+step3] = 1'b1;
     score[32+step3] = 1'b1;
     score[33+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[48+step3] = 1'b1;
     score[50+step3] = 1'b1;
     score[66+step3] = 1'b1;
     score[65+step3] = 1'b1;
     score[64+step3] = 1'b1;
     end
     
    9'd7:begin
     score[0+step3] = 1'b1;
     score[1+step3] = 1'b1;
     score[2+step3] = 1'b1;
     score[18+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[50+step3] = 1'b1;
     score[66+step3] = 1'b1;
     end
     
    9'd8:begin
     score[2+step3] = 1'b1;
     score[1+step3] = 1'b1;
     score[0+step3] = 1'b1;
     score[16+step3] = 1'b1;
     score[18+step3] = 1'b1;
     score[32+step3] = 1'b1;
     score[33+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[48+step3] = 1'b1;
     score[50+step3] = 1'b1;
     score[66+step3] = 1'b1;
     score[65+step3] = 1'b1;
     score[64+step3] = 1'b1;
     end
     
    9'd9:begin
     score[2+step3] = 1'b1;
     score[1+step3] = 1'b1;
     score[0+step3] = 1'b1;
     score[16+step3] = 1'b1;
     score[18+step3] = 1'b1;
     score[32+step3] = 1'b1;
     score[33+step3] = 1'b1;
     score[34+step3] = 1'b1;
     score[50+step3] = 1'b1;
     score[66+step3] = 1'b1;
     score[65+step3] = 1'b1;
     score[64+step3] = 1'b1;
     end
  endcase
end

endmodule