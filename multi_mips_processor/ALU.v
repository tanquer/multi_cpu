module ALU(
    input [31:0] A, B, 
    input [2:0] O, 
    output reg [31:0] result, 
    output zero
);

    always @* case (O)
        3'b000: result <= A & B;	//and
        3'b001: result <= A | B;	//or
        3'b010: result <= A + B;	//add
        3'b110: result <= A - B;	//sub
        3'b100: result <= ~ (A | B); //nor	
        3'b111: result <= (A < B) ? 32'h1 : 32'h0;	//slt
        //3'b011: result <= A ^ B;
        //3'b101: result <= B >> 1;
    endcase
	 
    assign zero = (result==0);
endmodule
