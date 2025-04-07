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

module ALUControlUnit (
    input [1:0] ALUOp,
    input [5:0] Funct,
    output reg [3:0] ALUControl
);
    always @(*) begin
        case (ALUOp)
            2'b00: ALUControl = 4'b0010; // ADD, LW, SW, ADDI, ADDIU
            2'b01: ALUControl = 4'b0110; // SUB, BEQ
            2'b10: begin
                case (Funct)
                    `ADDU: ALUControl = 4'b0010;
                    `SUB: ALUControl = 4'b0110;
                    `JR: ALUControl = 4'b0000; // JR
                    default: ALUControl = 4'b0000;
                endcase
            end
            2'b11: begin
                case (Funct)
                    `LUI: ALUControl = 4'b0011; // LUI 
                    `ORI: ALUControl = 4'b0001; // ORI
                    default: ALUControl = 4'b0000;
                endcase
            end
            default: ALUControl = 4'b0000;
        endcase
    end
endmodule