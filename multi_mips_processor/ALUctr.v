`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:04 05/25/2018 
// Design Name: 
// Module Name:    ALUctrl 
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
module ALUctrl(
    input wire [1:0] ALUop,
    input wire [5:0] Func,
    output reg [2:0] ALUoper
    );
	 
	 always @(*) begin
		case (ALUop) // R:10, BEQ:01, else:00
			2'b10: case (Func)
				6'b100000: ALUoper <= 3'b010; // add
				6'b100010: ALUoper <= 3'b110; // sub
				6'b100100: ALUoper <= 3'b000; // and
				6'b100101: ALUoper <= 3'b001; // or
				6'b101010: ALUoper <= 3'b111; // slt
				6'b100111: ALUoper <= 3'b100; //nor
			endcase
			2'b01: ALUoper<=3'b110; // sub
			2'b00: ALUoper<=3'b010; // add
		endcase
	end
endmodule

