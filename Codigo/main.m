%% Leitura e filtragem

[header_sinal, sinal, path, nome_arquivo] = ImportarArquivoEDF();

nome_arquivo = strrep(nome_arquivo, '.edf', '.tse');
caminho_arquivo_tse = strcat(path, nome_arquivo);

eventos = ImportarArquivoTSE(caminho_arquivo_tse);
sinal_associado = SinalEEG(header_sinal, sinal, eventos);

tamanho_sinal = length(sinal_associado.sinal(1,:));

sinal_filtrado = filtragemTKEO(sinal_associado.sinal(1,1:tamanho_sinal));

Fs = header_sinal.frequency(1);
tempo = 1/Fs:1/Fs:tamanho_sinal/Fs;

%% Divis�o do sinal

sinal_dividido = DividirSinal(sinal_associado.sinal(1,1:tamanho_sinal), 3, header_sinal.frequency(1));
trechos_sinal_associados = AssociarTrechosDeSinalComTipoDeEvento(sinal_dividido, sinal_associado.eventos);

%% Aplica��o de Wavelet e obten��o de caracteristicas do sinal

caracteristicas_do_sinal = ObterCaracteristicasDoSinal(trechos_sinal_associados);
caracteristicas_do_sinal = cell2mat(caracteristicas_do_sinal);

%% Treinamento Rede Neural

saida_cada_trecho = [ trechos_sinal_associados{:} ];
saida_cada_trecho = [ saida_cada_trecho(:).ocorre_convulsao ];

resultado_rede = TreinamentoRedeNeural(caracteristicas_do_sinal, saida_cada_trecho);

%% Treinamento SVM






