`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:57 05/31/2018 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
	input [5:0] Op,
	input [3:0] state,
	output reg [3:0] next,
	output wire PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, ALUSrcA, RegWrite, RegDst,
	output wire [1:0] PCSource, ALUOp, ALUSrcB
    );

	wire R = (Op==6'h0);
	wire LW = (Op==6'h23);
	wire SW = (Op==6'h2B);
	wire BEQ = (Op==6'h4);
	wire J = (Op==6'h2);
	
	always @(*) begin 
		case (state)
			0: next <= 1;
			1: begin 
					if (J) next <= 9;
					else if (BEQ) next <= 8;
					else if (R) next <= 6;
					else next <= 2;
				end
			2: begin
					if (SW) next <= 5;
					else if (LW) next <= 3;
				end
			3: next <= 4;
			6: next <= 7;
			default: next <= 0;
		endcase
	end
	 
	assign MemRead = (state == 0) || (state == 3);
	assign IRWrite = (state == 0);
	assign PCWrite = (state == 0) || (state == 9);
	assign PCWriteCond = (state == 8);
	assign IorD = (state == 3) || (state == 5);
	assign MemWrite = (state == 5);
	assign MemtoReg = (state == 4);
	assign PCSource[0] = (state == 8);
	assign PCSource[1] = (state == 9);
	assign ALUOp[1] = (state == 6);
	assign ALUOp[0] = (state == 8);
	assign ALUSrcB[1] = (state == 1) || (state == 2);
	assign ALUSrcB[0] = (state == 0) || (state == 1);
	assign ALUSrcA = (state == 2) || (state == 6) || (state == 8);
	assign RegWrite = (state == 4) || (state == 7);
	assign RegDst = (state == 7);

endmodule
