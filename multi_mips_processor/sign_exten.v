`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:10 05/29/2018 
// Design Name: 
// Module Name:    sign_exten 
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
module sign_exten(
	input [15:0] i_16,
	output [31:0] o_32
    );

	assign o_32 = {{16{i_16[15]}}, i_16[15:0]};

endmodule
