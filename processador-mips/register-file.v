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

module RegisterFile (
    input clk,
    input regWrite,
    input [4:0] readReg1,
    input [4:0] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    output [31:0] readData1,
    output [31:0] readData2
);
    reg [31:0] registers [31:0];
    
    assign readData1 = registers[readReg1];
    assign readData2 = registers[readReg2];
    
    always @(posedge clk) begin
        if (regWrite)
            registers[writeReg] <= writeData;
    end

endmodule