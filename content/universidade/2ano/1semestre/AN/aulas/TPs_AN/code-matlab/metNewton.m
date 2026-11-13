function [r,iteradas,est_erros] = metNewton(f,flinha,x0,tol,maxit) 
    % metNewton  Implementa o método de Newton (para uma equação não linear)
    %            usando o método do ponto fixo
    %
    % [r,iteradas,est_erros] = metNewton(f,flinha,x0,tol,maxit) 
    %   Cálculo de uma sequência de aproximações para um zero de uma função 
    %   f (e de estimativas para os respetivos erros), usando o método de Newton .
    %   O processo iterativo é inicializado com uma aproximação inicial x0
    %   e é interrompido quando: 
    %     (i) o valor absoluto da diferença das duas últimas iteradas
    %         calculadas (estimativa para o erro na última iterada) for 
    %         inferior a uma certa tolerância (tol)
    %                               ou 
    %     (ii) for atingido um número máximo de iterações permitidas (maxit).
    %
    % INPUT:
    %   f: uma função, cujo zero pretendemos determinar
    %   flinha: uma função (derivada de f)
    %   x0: real (aproximação inicial)
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
    %               

    %-------------------------------------------------------------------------
    % Verificar se existe o número mínimo de entradas
    %-------------------------------------------------------------------------
    if ( nargin < 3 )
       error('Tem que introduzir a função, a sua derivada e x0');
    end
    %--------------------------------------------------------------------------   

    %       Valores de argumentos por defeito
    %--------------------------------------------------------------------------   

    if ( nargin <5 || isempty(maxit) ); maxit = 30; end
    if ( nargin <4 || isempty(tol)); tol = 0.5e-6; end

    %------------------------------------------------------------------------
    %        PROCESSO ITERATIVO :: USA FUNÇÃO metPontoFixo
    %------------------------------------------------------------------------
    g=@(x) x-f(x)/flinha(x);  % função iterativa do ponto fixo
    [r,iteradas,est_erros] = metPontoFixo(g,x0,tol,maxit);
end