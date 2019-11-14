`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:59 05/29/2018 
// Design Name: 
// Module Name:    mux4_1 
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
module mux4_1(A, B, C, D, Ctrl, S);
	parameter N = 32;
	input wire [1:0] Ctrl;
	input wire [N-1:0] A, B, C, D;
	output wire [N-1:0] S;
	case (Ctrl)
		2'b00: assign S = A;
		2'b01: assign S = B;
		2'b10: assign S = C;
		2'b11: assign S = D;
	endcase
endmodule

