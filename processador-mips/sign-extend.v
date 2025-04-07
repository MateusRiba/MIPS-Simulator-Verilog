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

module SignExtend (
    input [15:0] in,
    output [31:0] out
);
    assign out = {{16{in[15]}}, in};

endmodule