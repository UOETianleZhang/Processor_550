module initializer(
 input clk,
 input refresh,
 output [144:0] newShape
);

parameter [144:0] box = 145'h060060;
parameter [144:0] Ishape = 145'h020020020020;
parameter [144:0] Tshape = 145'h020070;
parameter [144:0] Lshape = 145'h010070;
parameter [144:0] Zshape = 145'h030060;

wire [2:0]counter;

//module Random_3(
//    input               RESET,    
//    input               CLK,     
//    input      [2:0]    Seed,     
//    input               refresh,        
//    output     [2:0]    Random_3_OUT  
//);
Random_3 getRan1(1'b0, clk, 1'b0, refresh, counter);

reg[144:0] shape = 145'h020070;
assign newShape = shape;

always@(posedge clk) begin
 if(refresh) begin
  case(counter % 5)
   3'd0 : shape = box;
   3'd1 : shape = Ishape;
   3'd2 : shape = Tshape;
   3'd3 : shape = Lshape;
   3'd4 : shape = Zshape;
   default : shape = shape;
  endcase
 end
 
 else begin
  shape = shape;
 end
end

endmodule