/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module leleProcessor(
  control_test,
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
 output [19:0] control_test;
 assign control_test = control;

    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem; //PC
    input [31:0] q_imem; //instruction

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
 //**************************** control ****************************
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
 wire [19:0] control;
 controller myc(q_imem[31:27], q_imem[6:2], overflow, isLargerThan, isNotEqual, control);
 //**************************** PC ****************************
 wire [11:0] nextPC;
 PC myPC(nextPC, clock, reset, address_imem);

 //**************************** RegFile ****************************
//   output ctrl_writeEnable; //Rew
//    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB; //d, s1, s2
//    output [31:0] data_writeReg; 
//    input [31:0] data_readRegA, data_readRegB; //regA, regB
  assign ctrl_writeEnable = control[Rwe];
  assign ctrl_writeReg = control[jalc] ? 5'd31 : (control[T] ? 5'd30 : q_imem[26:22]);
  assign ctrl_readRegA = control[bexc] ? 5'd30 : q_imem[21:17];
  assign ctrl_readRegB = control[bexc] ? 5'd0  : (control[Rdst] ? q_imem[26:22] : q_imem[16:12]);
  
  wire [31:0] extendedImm;
  assign extendedImm = q_imem[16] ? {15'h7FFF, q_imem[16:0]} : {15'h0000, q_imem[16:0]};
  
  //**************************** ALU ****************************
  wire [31:0] ALUdataB;
  wire [4:0] ctrl_ALUopcode;
  wire [31:0] data_result;
  wire isNotEqual, isLargerThan, overflow;
  alu myAlu(data_readRegA, ALUdataB, ctrl_ALUopcode,
     q_imem[11:7], data_result, isNotEqual, isLargerThan, overflow);
  assign ALUdataB = control[ALUinB] ? extendedImm : data_readRegB;
  assign ctrl_ALUopcode = control[isR] ? q_imem[6:2] : 5'd0;
  //**************************** data memory && writeBack ****************************
  assign address_dmem = data_result[11:0];
  assign data = data_readRegB;
  assign wren = control[swc];
  
  wire [31:0] writeBack1, writeBack2;
  assign writeBack1 = control[B1] ? (control[B0] ? {5'h00, q_imem[26:0]} : PC_1) 
            : (control[B0] ? q_dmem : data_result);
  assign writeBack2 = q_imem[27] ? 2 : (q_imem[2] ? 3 : 1);
  assign data_writeReg = control[backC] ? writeBack2 : writeBack1;
  //****************************branch && jump ****************************
  wire [31:0] PC_1, PC_1_N, nextPC_32;
  wire tmp1, tmp2, tmp3, tmp4, tmp5, tmp6;
  alu adder1({20'h00000, address_imem}, 1, 5'd0, 5'd0, PC_1, tmp1, tmp2, tmp3);
  alu adder2(PC_1, extendedImm, 5'd0, 5'd0, PC_1_N, tmp4, tmp5, tmp6);
  assign nextPC_32 = control[A1] ? (control[A0] ? data_readRegB : {5'h00, q_imem[26:0]}) 
            : (control[A0] ? PC_1_N : PC_1);
  assign nextPC = nextPC_32[11:0];
  
endmodule