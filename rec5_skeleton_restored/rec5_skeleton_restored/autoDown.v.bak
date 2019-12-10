module autoDown(    
    input clk,     
    input down,        
    output moveSig  
);
 reg [24:0]counter = 25'b0;
 reg sig = 1'b0;
 
 always@(posedge clk) begin
  if(~down) begin
   if (counter >= 25'd20000000) begin
    // d10000000 2Hz
    sig = 1'b1;
    counter = 0;
   end
   else begin
    sig = 1'b0;
    counter = counter + 1;
   end
  end
  else begin
   if (counter >= 25'd3000000) begin
    // d5000000 4Hz
    sig = 1'b1;
    counter = 0;
   end
   else begin
    sig = 1'b0;
    counter = counter + 1;
   end
  end
   end
 
   assign moveSig = sig; 

endmodule