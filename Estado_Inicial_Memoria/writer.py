# Esse codigo Automatiza a conversão dos arquivos binários em código de inicialização 
# para o simulador. Isso facilita a atualização e evita erros manuais na escrita das 
# atribuições de memória.


import os

file = open("códigos auxiliares\\binary\\.text.bin", "r")

new_file = os.path.join("códigos auxiliares\\get-text", ".text-binario.sv")

with open(new_file, "w") as novo_file:
    index = 0
    for content in file:
        i = 8
        contents = content.split("\n")[0]

        for binary in range(4):
            novo_file.write(f"cpu.im.memory[{index}] = 8'b{"".join(contents[i - 8 : i])};\n")

            index += 1
            i += 8
        
        novo_file.write("\n")

file.close()

file = open("códigos auxiliares\\binary\\.data.bin", "r")

new_file = os.path.join("códigos auxiliares\\get-text", ".data-binario.sv")

with open(new_file, "w") as novo_file:
    index = 0
    i = 8
    for content in file:
        i = 8
        contents = content.split("\n")[0]

        for binary in range(4):
            novo_file.write(f"cpu.dm.memory[{index}] = 8'b{"".join(contents[i - 8 : i])};\n")

            index += 1
            i += 8
        
        novo_file.write("\n")

        if index == 32:
            break

file.close()