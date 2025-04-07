module RegisterFile (
    input clk,                      // Sinal de clock que sincroniza as operações de escrita.
    input regWrite,                 // Sinal de controle para escrita; quando ativo, permite escrever no registrador.
    input [4:0] readReg1,           // Endereço do primeiro registrador a ser lido (5 bits, pois 2^5 = 32).
    input [4:0] readReg2,           // Endereço do segundo registrador a ser lido (5 bits).
    input [4:0] writeReg,           // Endereço do registrador destino para escrita (5 bits).
    input [31:0] writeData,         // Dados de 32 bits que serão escritos no registrador selecionado.
    output [31:0] readData1,        // Saída com o conteúdo do primeiro registrador lido.
    output [31:0] readData2         // Saída com o conteúdo do segundo registrador lido.
);
    // Declaração do vetor de registradores:
    // São 32 registradores, cada um com 32 bits.
    reg [31:0] registers [31:0];
    
    // Atribuições contínuas para leitura:
    // readData1 recebe o conteúdo do registrador no endereço readReg1.
    // readData2 recebe o conteúdo do registrador no endereço readReg2.
    assign readData1 = registers[readReg1];
    assign readData2 = registers[readReg2];
    
    // Bloco always síncrono para escrita no banco de registradores.
    // Na borda de subida do clock, se o sinal regWrite estiver ativo, 
    // o valor writeData é escrito no registrador especificado por writeReg.
    always @(posedge clk) begin
        if (regWrite)
            registers[writeReg] <= writeData;
    end

endmodule