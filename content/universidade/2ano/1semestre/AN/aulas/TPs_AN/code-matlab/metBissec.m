function [r,n] = metBissec(f,a,b,tol,tab)
%metBissec  Método da bisseção para aproximar um zero de uma função
%
%  r = metBissec(f,a,b,tol,tab) 
%       Cálculo de  uma aproximação para um zero de f, situado entre a e b,
%       pelo método da bisseção
%
%  INPUT:
%
%    f -  função cujo zero se pretende
%    a -  real, extremo esquerdo do intervalo inicial 
%    b -  real, extremo direito do intervalo inicial
%    NOTA: f deve ser contínua e devemos ter f(a) f(b)<0 
%
%   Opcionais:
%
%   tol - tolerância para o erro na aproximação
%         Por defeito, tol = 0.5e-3
%   tab - se tab = 0, não se visualiza a tabela de resultados; caso contrário, vê-se a tabela 
%         Por defeito, tab = 1.
%
% OUTPUT:
%   r - aproximação para um zero de f

%-------------------------------------------------------------------------
% Verificar se existe o número mínimo de entradas
%-------------------------------------------------------------------------
if ( nargin < 3 )
   error('Tem de introduzir f, a  e b')
end
%-------------------------------------------------------------------------
% Verificações sobre as entradas
%--------------------------------------------------------------------------
    
if ( a >= b )
    error('a deve ser menor que b')
end

% Verificação de que em a e b, f tem sinais contrários
    sinal_fa = sign(f(a));
    sinal_fb = sign(f(b));
if ( sinal_fa*sinal_fb >= 0 ) 
    error('Escolha outro intervalo inicial')
end
%--------------------------------------------------------------------------
% Valores de tab por defeito
if ( nargin <5 ), tab = 1; end

% Valor de tol por defeito
if ( nargin<4 || isempty(tol) ), tol=0.5e-3; end

% Cálculo do número de iterações a efetuar
n = ceil(log2((b-a)/tol));
if n < 1 
	r = (a+b)/2;
else
	if tab ~=0
        %  Cabeçalho da tabela dos resultados 
        disp('______________________________________________________________________________')
        disp([' k ','   a_{k-1}   ', '   b_{k-1}   ','   x_k ','  sf(a_{k-1})', ' sf(x_k)',  '   Maj. erro '])
        disp('______________________________________________________________________________')
    end
    for k = 1:n
        erro = (b-a)/2;
        r = (a+b)/2;
        fr = f(r);
        sinal_fr = sign(fr);
        if tab ~= 0
          fprintf('%3.0f %10.6f  %10.6f  %10.6f %5.0f %5.0f %15.2e\n',k,a,b,r,sinal_fa,sinal_fr,erro)
        end
        if fr == 0
            disp('a raiz foi encontrada')
            n=k;
            return
        elseif ( sinal_fa*sinal_fr<0 )% Raiz está no subintervalo esquerdo
            b = r;        
        else % Raiz está no subintervalo direito
            a = r;     
        end
    end
end
