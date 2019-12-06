module curScore(
 input clk,
 input [9:0] score,
 output [768:0] scoreIdx
);
 reg [9:0]Digit1;
   reg [9:0]Digit2;
   reg [9:0]Digit3;
 
 parameter [9:0]step3 = 0;
 parameter [9:0]step2 = 4;
 parameter [9:0]step1 = 8;
 
  
 always@(clk) begin
   
        // Number_To_Display = 999;        
        Digit1 = score % 10; //% 10;
        
        Digit2 = score / 10 % 10;//%10;
    
        Digit3 = score / 100 % 10;//%10;
    end
  
//module setScore(
// input clk,
// input [9:0] digit1,
// input [9:0] digit2,
// input [9:0] digit3,
// input [9:0] step1,
// input [9:0] step2,
// input [9:0] step3,
// output [768:0] scoreIdx
//);
  setScore setDigit(clk, Digit1, Digit2, Digit3, step1, step2, step3, scoreIdx);

  

endmodule