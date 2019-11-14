`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:33:07 06/03/2018
// Design Name:   top
// Module Name:   E:/D/multi_cpu/multi_cpu/sim_CPU.v
// Project Name:  multi_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sim_CPU;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] _PC;
	wire [31:0] _IR;
	wire [31:0] _ALUresult;
	wire [31:0] _MDR;
	wire [31:0] _A;
	wire [31:0] _B;
	wire [3:0] _state;
	wire [2:0] _ALUOp;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst(rst), 
		._PC(_PC), 
		._IR(_IR), 
		._ALUresult(_ALUresult), 
		._MDR(_MDR), 
		._A(_A), 
		._B(_B),
		._state(_state),
		._ALUOp(_ALUOp)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 0;
	end
	
	always begin
		clk = 0; #10;
		clk = 1; #10;
	end
      
endmodule

