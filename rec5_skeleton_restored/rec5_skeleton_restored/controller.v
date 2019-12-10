module controller(
 input [4:0] opCode,
 input [4:0] funcode,
 input overflow, 
 input isLargerThan, 
 input isNotEqual,
 output [19:0] control
);

wire [31:0] decoded;
decoder mydecoder(opCode, decoded);

parameter  
   R    = 0, 
   addi  = 5,
   swi   = 7,
   lwi = 8,
   bnei = 2,
   blti = 6,
   j  = 1,
   jal = 3,
   jr  = 4, //JII
   bex = 22, //JI
   setx = 21; //JI

parameter    
   Rdst   = 5'd0,
   Rwe   = 5'd1,
   backC   = 5'd2,
   A0    = 5'd3,
   A1    = 5'd4,
   B0    = 5'd5,
   B1    = 5'd6,
   ALUinB  = 5'd7,
   T    = 5'd8,
   bexc   = 5'd9,
   jalc   = 5'd10,
   swc   = 5'd11,
   isR   = 5'd12;


wire equalAdd, equalSub;
equal eq1(equalAdd, funcode, 5'd0);
equal eq2(equalSub, funcode, 5'd1);

assign control[Rdst]  = decoded[swi] || decoded[bnei] || decoded[blti] || decoded[jr];
assign control[Rwe]   = decoded[R] || decoded[addi] || decoded[lwi] || decoded[jal] ||decoded[setx];
assign control[ALUinB]  = decoded[swi] || decoded[addi] || decoded[lwi];
assign control[T]   = decoded[setx] || (decoded[addi] && overflow) 
          || (decoded[R] && (equalAdd || equalSub) && overflow);
assign control[jalc]  = decoded[jal];
assign control[bexc]  = decoded[bex];
assign control[swc]   = decoded[swi];
assign control[isR]  = decoded[R];
assign control[backC] = (decoded[addi] && overflow) 
          || (decoded[R] && (equalAdd || equalSub) && overflow);
assign control[A1]   = decoded[j] || decoded[jal] || decoded[jr] || (decoded[bex] && isNotEqual);
assign control[A0]   = decoded[jr] || (decoded[blti] && isLessThan) || (decoded[bnei] && isNotEqual);

assign control[B1]   = decoded[jal] || decoded[setx];
assign control[B0]   = decoded[lwi] || decoded[setx];


wire isLessThan;
assign isLessThan = (~isLargerThan) && isNotEqual;

endmodule