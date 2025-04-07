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

module DataMemory (
    input clk,
    input memWrite,
    input [31:0] address,
    input [31:0] writeData,
    output [31:0] readData
);
    reg [31:0] memory [1023:0];

    assign read_data = {memory[address], memory[address+1], memory[address+2], memory[address+3]};

    always @(posedge clk) begin
        if (memWrite) begin
            memory[address  ] <= writeData[31:24];
            memory[address+1] <= writeData[23:16];
            memory[address+2] <= writeData[15:8];
            memory[address+3] <= writeData[7:0];

            $display("posição: %d, valor: %d", address, memory[address+3]);
        end
    end

endmodule