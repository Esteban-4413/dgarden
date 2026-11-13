function [r,iteradas,est_erros]=metSecante(f,x0,x1,tol,maxit) 
% metSecante Implementa o método da secante (para uma equação não linear)
%
% [r,iteradas,est_erros]=metSecante(f,x0,x1,tol,maxit,tab) 
%   Cálculo de uma sequência de aproximações para um zero de uma função 
%   f (e de estimativas para os respetivos erros), usando o método da
%   secante
%   O processo iterativo é inicializado com duas aproximação iniciais x0
%   e x1 e é interrompido quando: 
%    (i) o valor absoluto da diferença das duas últimas iterações 
%        calculadas for inferior a uma certa tolerância (tol)
%                               ou 
%   (ii) for atingido um número máximo de iterações permitidas (maxit).
%
% INPUT:
%   f: uma função, cujo zero pretendemos determinar
%   x0, x1 : reais (aproximações  iniciais)
%
% Opcionais:
    %   tol: real positivo (tolerância para estabelecer critério de paragem)
    %        Por defeito, tol = 0.5e-6
    %   maxit: inteiro positivo (número máximo de iterações a efetuar)
    %        Por defeito, maxit = 30
    %
    % OUTPUT:
    %  r:  aproximação para o zero de f
    %
    % Opcional:
    %   iteradas: (vetor coluna com as sucessivas) aproximações para o zero de f
    %   est_erros: (vetor coluna com as) estimativas para os erros nas aproximações
    
%-------------------------------------------------------------------------
% Verificar se existe o número mínimo de entradas
%-------------------------------------------------------------------------

    if ( nargin < 3 )
       error('Tem de introduzir a função, x0 e x1');
    end
    %-------------------------------------------------------------------
    %       Valores de argumentos por defeito
    %--------------------------------------------------------------------------   
        if ( nargin <5 || isempty(maxit) ); maxit = 30; end
        if ( nargin <4 || isempty(tol)); tol = 0.5e-6; end
    %------------------------------------------------------------------------
    %              PROCESSO ITERATIVO
    %------------------------------------------------------------------------
    iteradas = zeros(maxit,1); % Inicialização do vetor iteradas com zeros 
    est_erros = zeros(maxit,1);% Inicialização do vetor est_erros com zeros   
    iteradas(1) = x1; 
    f0=f(x0);
    for niter = 1:maxit     
        f1 = f(x1);
        delta=(f1*(x1-x0))/(f1-f0);
        est = abs(delta);   % Estimativa pra o erro 
        est_erros(niter) = est; % Armazenamento da estimativa para o erro
        if est < tol break; end
        nova_iterada = x1-delta;% Cálculo da nova aproximação
        if ~isfinite(nova_iterada)
            error('A iteração falhou')   % Se o resultado for Inf ou NaN
        end
        iteradas(niter+1) = nova_iterada;      % Armazenamento da nova aproximação 
        x0 = x1; % Atualização de x0 com o valor da penúltima iteração calculada 
        f0 = f1; % Atualização de f0 com o  valor de f nesse ponto 
        x1 =nova_iterada; % Atualização de x1 com o valor da última iteração calculada 
    end
    if (niter == maxit && est >= tol)
        r = iteradas(end);    %  A  aproximação fornecida para o zero
                              % é a última iterada calculada
        warning('não se atingiu a precisão desejada')       
    else
        iteradas(niter+1:end) = []; % "Eliminar" os valores não calculados                              
	    est_erros(niter+1:end)=[];
	    r = iteradas(end);
    end
end
