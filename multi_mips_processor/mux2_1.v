`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:01 05/29/2018 
// Design Name: 
// Module Name:    mux2_1 
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
module mux2_1(
	input wire [31:0] A, B,
	input wire Ctrl,
	output wire [31:0] S
    );
	
	assign S = (Ctrl == 1'b0) ? A : B;

endmodule
