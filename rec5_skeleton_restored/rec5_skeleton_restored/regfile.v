module regfile(
 curScore, nextScore,
 clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
 ctrl_readRegA, ctrl_readRegB, data_writeReg, data_readRegA,
 data_readRegB,
 rx, ry, offsetX, offsetY, var
);
 
 
 input clock, ctrl_writeEnable, ctrl_reset;
 input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
 input [31:0] data_writeReg;
 input [9:0] curScore;
 input [10:0] rx;
 input [10:0] ry;
 input[3:0] var;
 output [10:0] offsetX;
 output [10:0] offsetY;
 output [31:0] data_readRegA, data_readRegB;
 output [9:0] nextScore;

 reg[31:0] registers[31:0];
 reg[9:0] score = 10'd0;
 reg[10:0] X = 11'd0;
 reg[10:0] Y = 11'd0;
 
 always @(posedge clock or posedge ctrl_reset)
 begin
  if(ctrl_reset)
   begin
    integer i;
    for(i = 0; i < 32; i = i + 1)
     begin
      registers[i] = 32'd0;
     end
   end
  else begin
    registers[13] = curScore;
    registers[15] = rx;
    registers[16] = ry;
    registers[12] = var;
    if(ctrl_writeEnable && ctrl_writeReg != 5'd0)begin
     registers[ctrl_writeReg] = data_writeReg;
    end
  end
   
  score = registers[14];
  X = registers[17];
  Y = registers[18];
 end
 
 assign nextScore = score;
 assign offsetX = X;
 assign offsetY = Y;
 
 assign data_readRegA = ctrl_writeEnable && (ctrl_writeReg == ctrl_readRegA) ? 32'bz : registers[ctrl_readRegA];
 assign data_readRegB = ctrl_writeEnable && (ctrl_writeReg == ctrl_readRegB) ? 32'bz : registers[ctrl_readRegB];
 
endmodule