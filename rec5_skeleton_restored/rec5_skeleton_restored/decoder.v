module decoder(
 input [4:0] select,
 output [31:0] decoded
);

// wire [31:0] isEqual;
  genvar i;
  generate 
    for (i = 0; i < 32; i = i + 1) begin: for2
          equal euqal0(decoded[i], select, i);
    end
  endgenerate

endmodule