function [verdadeiro_positivo, falso_positivo, falso_negativo, verdadeiro_negativo, acuracia] = AcuraciaClassificacao(saidaReal,saidaRede)

    [c,cm,ind,per] = confusion(saidaReal,saidaRede); %'cm' � a matriz de confus�o
    
    verdadeiro_positivo = cm(1,1); %True Positive
    falso_positivo = cm(1,2); %Fake Positive
    falso_negativo = cm(2,1); %Fake Negative
    verdadeiro_negativo = cm(2,2); %True Negative
    
    acuracia = ((verdadeiro_positivo + verdadeiro_negativo) / ...
        (verdadeiro_positivo+falso_positivo+falso_negativo+verdadeiro_negativo))*100; %Calculo da acuracia do m�todo de classifica��o

end