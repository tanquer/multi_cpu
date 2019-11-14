`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:20 05/29/2018 
// Design Name: 
// Module Name:    top 
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
module top(
	input clk, rst,
	output [31:0] _PC, _IR, _ALUresult, _MDR, _A, _B,
	output [3:0] _state,
	output [2:0] _ALUOp
    );
	
	reg [31:0] PC = 0;
	reg [31:0] IR;
	reg [31:0] ALUout;
	reg [31:0] MDR;
	reg [31:0] A, B;
	reg [3:0] state = 0;
	wire [3:0] next;
	
	wire clock, zero, PCW;
	wire PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, ALUSrcA, RegWrite, RegDst;
	wire [1:0] PCSource, ALUOp, ALUSrcB;
	wire [31:0] jump, ALUresult, sign_extend, PC_in;
	
	wire [27:0] tmp;
	assign tmp = IR[25:0] << 2;
	assign jump = {PC[31:28], tmp};
	
	//test
	clk_25mhz c (clk, rst, clock);
	wire [4:0] addr_test;
	wire [31:0] out_test;
	
	//CPU control
	CPU multi(IR[31:26], state, next, PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, ALUSrcA, RegWrite, RegDst, PCSource, ALUOp, ALUSrcB);
	
	//Instruction
	memory IR_Data(clk, MemWrite, IorD == 0 ? (PC / 4) : (ALUout / 4), B, _IR);
	
	//ALU
	sign_exten a0(IR[15:0], sign_extend);
	wire [2:0] O;
	ALUctrl alu_ctr(ALUOp, IR[5:0], O);
	wire [31:0] alu_b;
	assign alu_b = ALUSrcB == 2'b00 ? B : 
						ALUSrcB == 2'b01 ? 4 :
						ALUSrcB == 2'b10 ? sign_extend : sign_extend << 2;
	ALU alu(ALUSrcA == 0 ? PC : A, alu_b, O, ALUresult, zero);
	
	//Regs
	wire [4:0] W_addr;
	wire [31:0] W_data;
	assign W_addr = RegDst == 0 ? IR[20:16] : IR[15:11];
	assign W_data = MemtoReg == 1 ? MDR : ALUout;
	Regs r(clk, rst, IR[25:21], IR[20:16], addr_test, W_addr, W_data, RegWrite, _A, _B, out_test);
	
	assign PCW = (zero & PCWriteCond) | PCWrite;
	assign PC_in = PCSource == 2'b00 ? ALUresult :
						PCSource == 2'b01 ? ALUout :
						PCSource == 2'b10 ? jump : 0;
	
	always @ (negedge clk) begin
		state <= next;
		if (MemRead) MDR <= _IR;
		if (MemRead & IRWrite) IR <= _IR;
		ALUout <= ALUresult;
		A <= _A;
		B <= _B;
		if (PCW) PC <= PC_in;
	end
	
	assign _PC = PC;
	assign _ALUresult = ALUresult;
	assign _MDR = MDR;
	assign _state = state;
	assign _ALUOp = O;
endmodule
