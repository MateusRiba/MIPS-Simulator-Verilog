// Instruction R-type

`define R_TYPE  6'b000000

`define JUMP    6'b000010
`define JR      6'b001000
`define ADDU    6'b100001
`define SUB     6'b100010

// Instruction I-type

`define LUI     6'b001111
`define ORI     6'b001101
`define ADDI    6'b001000
`define ADDIU   6'b001001
`define BEQ     6'b000100
`define LW      6'b100011
`define SW      6'b101011

// Instruction J-type

`define JAL     6'b000011

module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUControl,
    output reg [31:0] Result,
    output Zero
);
    always @(*) begin
        case (ALUControl)
            4'b0000: Result = A & B;
            4'b0001: Result = A | B;
            4'b0010: Result = A + B;
            4'b0110: Result = A - B;
            4'b0111: Result = (A < B) ? 1 : 0;
            4'b1100: Result = ~(A | B);
            4'b0011: Result = B << 16; // LUI
            default: Result = 0;
        endcase
    end

    assign Zero = (Result == 0);
endmodule