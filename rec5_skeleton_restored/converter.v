module converter(
	input [7:0] dataIn,
	output [7:0] dataOut,
    output reg left,
    output  right,
    output  up,
    output reg down
);

	  // This always block is executed whenever a, b, c or sel changes in value
    reg [7:0] data;
    always @ (dataIn) begin     
		case(dataIn)
			8'h1D    : data = 8'd87;     // If sel=0, output is a
			8'h1B    : data = 8'd83;
			8'h1C    : data = 8'd65;
			8'h23    : data = 8'd68;
			default  : data = dataIn;     // If sel is anything else, out is always 0
		endcase

//		if (dataIn == 8'h75)
//		  up = 1;
//		else 
//		  up = 0;
//		if (dataIn == 8'h74)
//		  right = 1;
//		else 
//		  right = 0;
		if (dataIn == 8'h6B)
		  left = 1;
		else 
		  left = 0;
		if (dataIn == 8'h72)
		  down = 1;
		else 
		  down = 0;

  end
  
  assign dataOut = dataIn;
  assign up = dataIn == 8'h75 ? 1 : 0;
  assign right = dataIn == 8'h74 ? 1 : 0;

endmodule