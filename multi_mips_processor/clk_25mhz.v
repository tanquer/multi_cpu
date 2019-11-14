`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:38:36 06/02/2018 
// Design Name: 
// Module Name:    clk_25mhz 
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
module clk_25mhz(
	input clk,
	input rst,
	output reg clock
    );
	reg [1:0] count;
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1)
			count <= 0;
		else if (count == 3)
			count <= 0;
		else
			count <= count + 1;
	end

	always @ (posedge clk or posedge rst) begin
		if (rst == 1)
			clock <= 0;
		else if (count == 3)
			clock <= !clock;
	end

endmodule
