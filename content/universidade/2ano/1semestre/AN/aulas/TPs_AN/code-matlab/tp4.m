%[text] Interpolação polinomial  -- Exercício 1
%[text] a)
x = [0 0.4];
y = sin(x);
xbar = 0.25;
L1 = (xbar - x(2)) / (x(1) - x(2));
L2 = (xbar - x(1)) / (x(2) - x(1));
L = [L1 L2];
valAprox = L * y' %[output:336cebc0]
valExato = sin(xbar);
erro = abs(valAprox - valExato) %[output:43b8014c]
majorante = (sin(0.4) / 2) * abs((xbar - x(1)) * (xbar - x(2))) %[output:86dbd14e]
%[text] A aproximação é 0.2434, um majorante para o erro é 0.0073 e o erro cometido é 0.0040. 
%%
%[text] b) Neste caso, precisamos de usar três pontos.
xb = [0 0.4 0.6];
yb = sin(xb);
L1b = (xbar - xb(2)) * (xbar - xb(3)) / ((xb(1) - xb(2)) * (xb(1) - xb(3)));
L2b = (xbar - xb(1)) * (xbar - xb(3)) / ((xb(2) - xb(1)) * (xb(2) - xb(3)));
L3b = (xbar - xb(1)) * (xbar - xb(2)) / ((xb(3) - xb(1)) * (xb(3) - xb(2)));
Lb = [L1b L2b L3b];
valAproxb = Lb * yb' %[output:508d6dd8]
errob = abs(valAprox - valExato) %[output:7360a230]
majoranteb = abs((xbar - xb(1)) * (xbar - xb(2)) * (xbar - xb(3)))/6 %[output:5855660a]
%%
%[text] Interpolação polinomial -- Exercício 3
a=0.5*1E-3*27/(sin(1)*sqrt(3));
nthroot(a,3) %[output:3c3cd9b8]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:336cebc0]
%   data: {"dataType":"textualVariable","outputData":{"name":"valAprox","value":"0.2434"}}
%---
%[output:43b8014c]
%   data: {"dataType":"textualVariable","outputData":{"name":"erro","value":"0.0040"}}
%---
%[output:86dbd14e]
%   data: {"dataType":"textualVariable","outputData":{"name":"majorante","value":"0.0073"}}
%---
%[output:508d6dd8]
%   data: {"dataType":"textualVariable","outputData":{"name":"valAproxb","value":"0.2495"}}
%---
%[output:7360a230]
%   data: {"dataType":"textualVariable","outputData":{"name":"errob","value":"0.0040"}}
%---
%[output:5855660a]
%   data: {"dataType":"textualVariable","outputData":{"name":"majoranteb","value":"0.0022"}}
%---
%[output:3c3cd9b8]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"0.2100"}}
%---
