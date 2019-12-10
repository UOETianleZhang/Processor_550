module equal #(parameter N = 5)(
 isEqual,
 a,
 b
);
 
 input [N - 1:0] a;
 input [N - 1:0] b;
 output isEqual;
 
 wire [N - 1:0] c;
 
 genvar i;
  // Generate for loop to instantiate N times
  generate 
    for (i = 0; i < N; i = i + 1) begin: for1
          xor(c[i], a[i], b[i]);
    end
  endgenerate
  
  assign isEqual = c ? 1'b0 : 1'b1;

endmodule