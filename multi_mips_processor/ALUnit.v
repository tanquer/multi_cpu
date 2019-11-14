module ALU(
    input [31:0] A, B, 
    input [2:0] O, 
    output [31:0] ans, 
    output zero, overflow
);

    wire [32:0] _and, _or, _add, _sub, _nor, _slt, _xor, _srl;
    reg [32:0] C;

    assign _and = A & B;
    assign _or  = A | B;
    assign _add = A + B;
    assign _sub = A - B;
    assign _nor = ~ (A | B);
    assign _slt = (A < B) ? 8'h1 : 8'h0;
    assign _xor = A ^ B;
    assign _srl = B >> 1;

    always @* case (O)
        3'b000: C=_and;
        3'b001: C=_or;
        3'b010: C=_add;
        3'b110: C=_sub;
        3'b100: C=_nor;
        3'b111: C=_slt;
        3'b011: C=_xor;
        3'b101: C=_srl;
        3'b010: C=_add;
    endcase
    assign ans = C[31:0];
    assign zero = (C==0);
    assign overflow = C[32];
endmodule
