function [eventos] = ImportarArquivoTSE(caminho_arquivo)
%   L� os arquivo .tse e retorna uma struct com as respectivas
%   informa��es:
%   - Nome do evento(vide documento explicando as bases de dados)
%   - Inicio
%   - Fim
%   - Probabilidade de ter ocorrido (padr�o � 1)

    if(not(exist('caminho_arquivo')) || isempty(caminho_arquivo))
        [arquivo, path] = uigetfile('*.tse', 'Selecionar arquivo TSE');
        caminho_arquivo = strcat(path, arquivo);        
    end
    
    [arquivoID, msg_erro] = fopen(caminho_arquivo, 'r');
    if arquivoID == -1
        error(msg_erro)
    end
    
    conteudo = textscan(arquivoID, '%f %f %s %f', 'headerlines', 2);
    
    quantidade_eventos = length(conteudo{1}(:));
    
    eventos = {};
    
    for i = 1:quantidade_eventos
        evento.inicio = conteudo{1}(i);
        evento.fim = conteudo{2}(i);
        evento.tipo = conteudo{3}{i};
        evento.probabilidade = conteudo{4}(i);
        
        eventos = [eventos evento];
    end
end

