module vga_controller(iRST_n,
                      iVGA_CLK,
                      oBLANK_n,
                      oHS,
                      oVS,
                      b_data,
                      g_data,
							 left,
							 right,
							 up,
							 down,
                      r_data);

	
input iRST_n;
input iVGA_CLK;
input left, right, up, down;
//input [7:0] dataIn;
output reg oBLANK_n;
output reg oHS;
output reg oVS;
output [7:0] b_data;
output [7:0] g_data;  
output [7:0] r_data;                        
///////// ////                     
reg [18:0] ADDR;
reg [23:0] bgr_data;
wire VGA_CLK_n;
wire [7:0] index;
wire [23:0] bgr_data_raw;
wire cBLANK_n,cHS,cVS,rst;
////
assign rst = ~iRST_n;
video_sync_generator LTM_ins (.vga_clk(iVGA_CLK),
                              .reset(rst),
                              .blank_n(cBLANK_n),
                              .HS(cHS),
                              .VS(cVS));
////
////Addresss generator
always@(posedge iVGA_CLK,negedge iRST_n)
begin
  if (!iRST_n)
     ADDR<=19'd0;
  else if (cHS==1'b0 && cVS==1'b0)
     ADDR<=19'd0;
  else if (cBLANK_n==1'b1)
     ADDR<=ADDR+1;
end
//////////////////////////
//////INDEX addr.
assign VGA_CLK_n = ~iVGA_CLK;
img_data	img_data_inst (
	.address ( ADDR ),
	.clock ( VGA_CLK_n ),
	.q ( index )
	);
	
/////////////////////////
//////Add switch-input logic here

//module square (
//  input [18:0]  address,
//  input clk,
//  input reset,
//  input [7:0] keyB;
//  input [7:0]  qin,
//  output [7:0]  qout
//);
wire [7:0] qout;
wire [7:0] qout1;
wire [7:0] qout2;
wire [9:0] score;
assign score = 10'd123;
//square square1(ADDR, VGA_CLK_n, index, qout, left, right, up, down);

//zhuyi!!!!!
squareRender render1(ADDR, index, VGA_CLK_n, left, right, up, down, qout1);

//module printScore(
// input clk,
// input [18:0]  address,
//   input [7:0]  qin,
// input [9:0] score,
// output reg [7:0] qout
//);
printScore render2(VGA_CLK_n, ADDR,  index, score, qout2);

assign qout = ADDR % 640 < 480 ? qout1 : qout2;

//////Color table output
img_index	img_index_inst (
	.address ( qout ),
	.clock ( iVGA_CLK ),
	.q ( bgr_data_raw)
	);	
//////
//////latch valid data at falling edge;
always@(posedge VGA_CLK_n) bgr_data <= bgr_data_raw;
assign b_data = bgr_data[23:16];
assign g_data = bgr_data[15:8];
assign r_data = bgr_data[7:0]; 
///////////////////
//////Delay the iHD, iVD,iDEN for one clock cycle;
always@(negedge iVGA_CLK)
begin
  oHS<=cHS;
  oVS<=cVS;
  oBLANK_n<=cBLANK_n;
end

endmodule
 	















