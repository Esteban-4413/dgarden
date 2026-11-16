%[text] Exercicio 4
g=@(x) 1/2*exp(-x) %[output:714d46c6]
g(0) %[output:7dd2be53]
g(1/2) %[output:5496fe21]
%[text] 
format long 
x=0;
for k=1:8 %[output:group:5c96873e]
    x=g(x);
    disp(['k = ', num2str(k), ' kx= ', num2str(x)]) %[output:754d9d85] %[output:76a9886e] %[output:8a9da42b] %[output:9862a958] %[output:611c8711] %[output:6ae8e739] %[output:68a96661] %[output:7292b745]
    disp(x) %[output:6bff656d] %[output:67098556] %[output:1ce7109a] %[output:8c853bc6] %[output:4ecabf1a] %[output:73c13d62] %[output:0a37c49f] %[output:3bae5623]
end %[output:group:5c96873e]
x8=x  %[output:7e6b25b6]
format short
erro=1/2^8 %[output:4221985a]
%[text] 
%[text] Função `fzero` do matlab
format long
f=@(x) x-(1/2)*exp(-x);
xfzero=fzero(f,0) %[output:04dd0835]

format short
abs(x8 - xfzero) %[output:5511d7d7]
%[text] 

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:714d46c6]
%   data: {"dataType":"textualVariable","outputData":{"header":"function_handle with value:","name":"g","value":"    @(x)1\/2*exp(-x)\n"}}
%---
%[output:7dd2be53]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"   0.500000000000000\n"}}
%---
%[output:5496fe21]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"   0.303265329856317\n"}}
%---
%[output:754d9d85]
%   data: {"dataType":"text","outputData":{"text":"k = 1 kx= 0.5\n","truncated":false}}
%---
%[output:6bff656d]
%   data: {"dataType":"text","outputData":{"text":"   0.500000000000000\n\n","truncated":false}}
%---
%[output:76a9886e]
%   data: {"dataType":"text","outputData":{"text":"k = 2 kx= 0.30327\n","truncated":false}}
%---
%[output:67098556]
%   data: {"dataType":"text","outputData":{"text":"   0.303265329856317\n\n","truncated":false}}
%---
%[output:8a9da42b]
%   data: {"dataType":"text","outputData":{"text":"k = 3 kx= 0.3692\n","truncated":false}}
%---
%[output:1ce7109a]
%   data: {"dataType":"text","outputData":{"text":"   0.369201574987365\n\n","truncated":false}}
%---
%[output:9862a958]
%   data: {"dataType":"text","outputData":{"text":"k = 4 kx= 0.34564\n","truncated":false}}
%---
%[output:8c853bc6]
%   data: {"dataType":"text","outputData":{"text":"   0.345643025214076\n\n","truncated":false}}
%---
%[output:611c8711]
%   data: {"dataType":"text","outputData":{"text":"k = 5 kx= 0.35388\n","truncated":false}}
%---
%[output:4ecabf1a]
%   data: {"dataType":"text","outputData":{"text":"   0.353882548155000\n\n","truncated":false}}
%---
%[output:6ae8e739]
%   data: {"dataType":"text","outputData":{"text":"k = 6 kx= 0.35098\n","truncated":false}}
%---
%[output:73c13d62]
%   data: {"dataType":"text","outputData":{"text":"   0.350978704353309\n\n","truncated":false}}
%---
%[output:68a96661]
%   data: {"dataType":"text","outputData":{"text":"k = 7 kx= 0.352\n","truncated":false}}
%---
%[output:0a37c49f]
%   data: {"dataType":"text","outputData":{"text":"   0.351999372902275\n\n","truncated":false}}
%---
%[output:7292b745]
%   data: {"dataType":"text","outputData":{"text":"k = 8 kx= 0.35164\n","truncated":false}}
%---
%[output:3bae5623]
%   data: {"dataType":"text","outputData":{"text":"   0.351640281500922\n\n","truncated":false}}
%---
%[output:7e6b25b6]
%   data: {"dataType":"textualVariable","outputData":{"name":"x8","value":"   0.351640281500922\n"}}
%---
%[output:4221985a]
%   data: {"dataType":"textualVariable","outputData":{"name":"erro","value":"0.0039"}}
%---
%[output:04dd0835]
%   data: {"dataType":"textualVariable","outputData":{"name":"xfzero","value":"   0.351733711249196\n"}}
%---
%[output:5511d7d7]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"9.3430e-05"}}
%---
