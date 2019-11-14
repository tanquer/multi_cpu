`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:08 05/03/2018 
// Design Name: 
// Module Name:    Rtype 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Rtype(
    input clk,
    input rst,
    input [31:0] I,
    output [31:0] A,
    output [31:0] B,
    output [31:0] result,
	 output [31:0] test
    );

	 wire [2:0] ALUoper;
	 wire zero;
	 
	 Regs m0(clk, rst, I[25:21], I[20:16], {5{1'b0}}, I[15:11], result, 1'b1, A, B, test);
	 ALUctrl m1(2'b10, I[5:0], ALUoper);
	 ALU m2(A, B, ALUoper, result, zero);

endmodule
