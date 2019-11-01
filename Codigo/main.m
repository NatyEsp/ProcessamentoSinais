[header_sinal, sinal, path, nome_arquivo] = ImportarArquivoEDF();

nome_arquivo = strrep(nome_arquivo, '.edf', '.tse');
caminho_arquivo_tse = strcat(path, nome_arquivo);

eventos = ImportarArquivoTSE(caminho_arquivo_tse);
sinal_associado = AssociarSinalEEGComEventos(header_sinal, sinal, eventos);

tamanho_sinal = length(sinal_associado.sinal(1,:));

sinal_filtrado = filtragemTKEO(sinal_associado.sinal(1,1:tamanho_sinal));

Fs = header_sinal.frequency(1);
tempo = 1/Fs:1/Fs:tamanho_sinal/Fs;

%% Divis�o do sinal

sinal_dividido = DividirSinal(sinal_filtrado, 3, header_sinal.frequency(1));
trechos_sinal_associados = AssociarTrechosDeSinalComTipoDeEvento(sinal_dividido, sinal_associado.eventos);


