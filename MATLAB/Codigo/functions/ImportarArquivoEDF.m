function [header_arquivo, dados_sinal, path, arquivo] = ImportarArquivoEDF()
%   Fun��o que abre um explorador de arquivos para que seja selecionado o
%   arquivo edf
    [arquivo, path] = uigetfile('*.edf', 'Selecionar arquivo EDF');
    
    caminho_arquivo = strcat(path, arquivo);
    [header_arquivo, dados_sinal] = edfread(caminho_arquivo);
end

