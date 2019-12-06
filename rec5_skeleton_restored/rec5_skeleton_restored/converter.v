module converter(
	input clk,
	input [7:0] dataIn,
	input ps2_key_pressed_in,
	output [7:0] dataOut,
    output reg left,
    output reg right,
    output reg up,
    output reg down
);

	reg ps2_key_pressed = 1'b0;
//	reg [30:0] ps2Counter = 0;
	
//	always @ (posedge clk) begin
//		if (ps2Counter == 25'd2500000) begin
//			ps2_key_pressed = ps2_key_pressed_in;
//				
//		end
//		else begin
//		
//		
//		end
//	end

	  // This always block is executed whenever a, b, c or sel changes in value
    reg [7:0] data;
	 reg [24:0] counter = 0;
	 reg nextUp = 1'b0, nextRight = 1'b0, nextDown = 1'b0, nextLeft = 1'b0;
    always @ (posedge clk) begin
		if (ps2_key_pressed_in) begin
			ps2_key_pressed = 1'b1;
		end
		
		if (counter == 25'd5000000) begin
			counter = 0;
			up = nextUp;
			right = nextRight;
			left = nextLeft;
			down = nextDown;
			
			nextUp = 1'b0;
			nextRight = 1'b0;
			nextLeft = 1'b0;
			nextDown = 1'b0;
		end
		else begin
			up = 1'b0;
			right = 1'b0;
			left = 1'b0;
			down = 1'b0;
			
			counter = counter + 1;
			if (ps2_key_pressed) begin
				nextUp	 	= dataIn == 8'h75 ? 1'b1 : nextUp;
				nextRight 	= dataIn == 8'h74 ? 1'b1 : nextRight;
				nextLeft 	= dataIn == 8'h6B ? 1'b1 : nextLeft;
				nextDown		= dataIn == 8'h72 ? 1'b1 : nextDown;
				ps2_key_pressed = ps2_key_pressed_in;
			end
		end

  end
  
  assign dataOut = dataIn;


endmodule