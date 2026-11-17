%[text] ## Análise Númerica
%[text] ### Erros e estabilidade númerica
%[text] Exercício 3
%[text] a)
sin(pi) %[output:3618f260]
%%
%[text] b)
a = 1/3 %[output:2f109202]
b = 4/3 - 1 %[output:05179e23]
isequal(a,b) %[output:5584ea26]
a-b  %[output:06a4b0b9]
3*a %[output:4cccb2f0]
3*b %[output:9cb819de]
%%
%[text] Exercício 4
%[text] a)
help realmax %[output:1a6099fb]
help realmin %[output:1cb9c4d4]
help eps %[output:305620eb]
%[text] b)
realmax %[output:8018edb2]
realmin %[output:7931f241]
eps %[output:2bdab594]
%[text] c)
(1+2^-52)-1 %[output:97567093]
(1+2^-53)-1  %[output:0bdda02d]
isequal(2^-1074,0) %[output:9e1f10cd]
isequal(2^-1075,0)  %[output:08b4fe29]
%%
%[text] Exercício 7
%[text] a)
format long
1/6  %[output:07c4f55d]
1/11 %[output:1d787d61]
pi/100 %[output:158508c9]
exp(3) %[output:1ba21048]
log(5) %[output:21558db1]
%[text] b)
format long 
x = [1/6, 1/11, pi/100, exp(3), log(5)];
round(x, 5, 'significant')  %[output:4b3095ff]
%%
%[text] Exercício 8
%[text] a)
x = 1e-8;
y = sin(pi/2 + x) - 1 %[output:68090e15]
y_alt = -2*sin(x/2)^2 %[output:1e4a15da] %[output:2d150835]
%%
%[text] Exercício 10
%[text] a)
sqrt(159999) %[output:214933bb]
%[text] c)
format longg
roots([1, 800, 1]) %[output:5ee0a151]
%[text] 

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:3618f260]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"1.2246e-16"}}
%---
%[output:2f109202]
%   data: {"dataType":"textualVariable","outputData":{"name":"a","value":"0.3333"}}
%---
%[output:05179e23]
%   data: {"dataType":"textualVariable","outputData":{"name":"b","value":"0.3333"}}
%---
%[output:5584ea26]
%   data: {"dataType":"textualVariable","outputData":{"header":"logical","name":"ans","value":"   0\n"}}
%---
%[output:06a4b0b9]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"5.5511e-17"}}
%---
%[output:4cccb2f0]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"1"}}
%---
%[output:9cb819de]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"1.0000"}}
%---
%[output:1a6099fb]
%   data: {"dataType":"text","outputData":{"text":" <strong>realmax<\/strong> - Largest positive floating-point number\n\n    <strong>Syntax<\/strong>\n      f = realmax\n      f = realmax(typename)\n      f = realmax(like=p)\n\n    <strong>Input Arguments<\/strong>\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/realmax.html#mw_f86e82a6-15c0-4d28-8a79-a46160e342dc\">typename<\/a> - Floating-point precision type\n        \"double\" (default) | \"single\"\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/realmax.html#mw_a3465443-498e-472a-b534-a0c4b72783c6\">p<\/a> - Prototype\n        floating-point variable\n\n    <strong>Output Arguments<\/strong>\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/realmax.html#mw_56ff5a35-e70e-47e8-b47c-9720eff39805\">f<\/a> - Largest floating-point number\n        scalar\n\n    <strong>Examples<\/strong>\n      <a href=\"matlab:openExample('matlab\/DoublePrecisionRealmaxExample')\">Double Precision<\/a>\n      <a href=\"matlab:openExample('matlab\/SinglePrecisionRealmaxExample')\">Single Precision<\/a>\n      <a href=\"matlab:openExample('matlab\/CloneDataTypeAndComplexityRealmaxExample')\">Specify Data Type and Complexity from Existing Array<\/a>\n      <a href=\"matlab:openExample('matlab\/SpecifySparsityFromExistingArrayRealmaxExample')\">Specify Sparsity from Existing Array<\/a>\n\n    <strong>See also<\/strong> <a href=\"matlab:help realmin -displayBanner\">realmin<\/a>, <a href=\"matlab:help intmax -displayBanner\">intmax<\/a>, <a href=\"matlab:help flintmax -displayBanner\">flintmax<\/a>, <a href=\"matlab:help format -displayBanner\">format<\/a>\n\n    Introduced in MATLAB before R2006a\n    <a href=\"matlab:doc realmax\">Documentation for realmax<\/a>\n\n","truncated":false}}
%---
%[output:1cb9c4d4]
%   data: {"dataType":"text","outputData":{"text":" <strong>realmin<\/strong> - Smallest normalized floating-point number\n\n    <strong>Syntax<\/strong>\n      f = realmin\n      f = realmin(typename)\n      f = realmin(like=p)\n\n    <strong>Input Arguments<\/strong>\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/realmin.html#mw_d560d0f3-9292-4bf5-9e5c-f20d5fcf3c5b\">typename<\/a> - Floating-point precision type\n        \"double\" (default) | \"single\"\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/realmin.html#mw_2b2e3642-d517-4a69-91d3-e6f88e03dc12\">p<\/a> - Prototype\n        floating-point variable\n\n    <strong>Output Arguments<\/strong>\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/realmin.html#mw_a0d9d3ef-4b00-4981-a83c-c552b81db5a1\">f<\/a> - Smallest positive normalized floating-point number\n        scalar\n\n    <strong>Examples<\/strong>\n      <a href=\"matlab:openExample('matlab\/DoublePrecisionRealminExample')\">Double Precision<\/a>\n      <a href=\"matlab:openExample('matlab\/SinglePrecisionRealminExample')\">Single Precision<\/a>\n      <a href=\"matlab:openExample('matlab\/SpecifyDataTypeAndComplexityRealminExample')\">Specify Data Type and Complexity from Existing Array<\/a>\n      <a href=\"matlab:openExample('matlab\/SpecifySparsityFromExistingArrayRealminExample')\">Specify Sparsity from Existing Array<\/a>\n\n    <strong>See also<\/strong> <a href=\"matlab:help eps -displayBanner\">eps<\/a>, <a href=\"matlab:help realmax -displayBanner\">realmax<\/a>, <a href=\"matlab:help intmin -displayBanner\">intmin<\/a>, <a href=\"matlab:help format -displayBanner\">format<\/a>\n\n    Introduced in MATLAB before R2006a\n    <a href=\"matlab:doc realmin\">Documentation for realmin<\/a>\n\n","truncated":false}}
%---
%[output:305620eb]
%   data: {"dataType":"text","outputData":{"text":" <strong>eps<\/strong> - Floating-point relative accuracy\n\n    <strong>Syntax<\/strong>\n      d = eps\n      d = eps(x)\n      d = eps(typename)\n      d = eps(like=p)\n\n    <strong>Input Arguments<\/strong>\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/double.eps.html#br8pqeh-1-x\">x<\/a> - Input array\n        scalar | vector | matrix | multidimensional array\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/double.eps.html#br8pqeh-1-datatype\">typename<\/a> - Output data type\n        \"double\" (default) | \"single\"\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/double.eps.html#mw_86fcb61c-1557-4b41-9962-92a6041aeb2f\">p<\/a> - Prototype\n        floating-point variable\n\n    <strong>Output Arguments<\/strong>\n      <a href=\"matlab:web \/Applications\/MATLAB_R2026b.app\/help\/matlab\/ref\/double.eps.html#mw_446f45e0-ecaa-4512-b766-a85d3cbfd1fd\">d<\/a> - Output array\n        scalar | vector | matrix | multidimensional array\n\n    <strong>Examples<\/strong>\n      <a href=\"matlab:openExample('matlab\/DoublePrecisionMachineEpsilonExample')\">Accuracy in Double Precision<\/a>\n      <a href=\"matlab:openExample('matlab\/SinglePrecisionMachineEpsilonExample')\">Accuracy in Single Precision<\/a>\n      <a href=\"matlab:openExample('matlab\/SpecifyDataTypeAndComplexityEpsExample')\">Specify Data Type and Complexity from Existing Array<\/a>\n      <a href=\"matlab:openExample('matlab\/SpecifySparsityFromExistingArrayEpsExample')\">Specify Sparsity from Existing Array<\/a>\n\n    <strong>See also<\/strong> <a href=\"matlab:help single -displayBanner\">single<\/a>, <a href=\"matlab:help double -displayBanner\">double<\/a>, <a href=\"matlab:help isapprox -displayBanner\">isapprox<\/a>, <a href=\"matlab:help duration -displayBanner\">duration<\/a>, <a href=\"matlab:help realmax -displayBanner\">realmax<\/a>, <a href=\"matlab:help realmin -displayBanner\">realmin<\/a>, <a href=\"matlab:help intmax -displayBanner\">intmax<\/a>\n\n    Introduced in MATLAB before R2006a\n    <a href=\"matlab:doc eps\">Documentation for eps<\/a>\n    <a href=\"matlab:matlab.lang.internal.introspective.overloads.displayOverloads('eps')\">Other uses of eps<\/a>\n\n","truncated":false}}
%---
%[output:8018edb2]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"1.7977e+308"}}
%---
%[output:7931f241]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"2.2251e-308"}}
%---
%[output:2bdab594]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"2.2204e-16"}}
%---
%[output:97567093]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"2.2204e-16"}}
%---
%[output:0bdda02d]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"0"}}
%---
%[output:9e1f10cd]
%   data: {"dataType":"textualVariable","outputData":{"header":"logical","name":"ans","value":"   0\n"}}
%---
%[output:08b4fe29]
%   data: {"dataType":"textualVariable","outputData":{"header":"logical","name":"ans","value":"   1\n"}}
%---
%[output:07c4f55d]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"   0.166666666666667\n"}}
%---
%[output:1d787d61]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"   0.090909090909091\n"}}
%---
%[output:158508c9]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"   0.031415926535898\n"}}
%---
%[output:1ba21048]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"  20.085536923187668\n"}}
%---
%[output:21558db1]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"   1.609437912434100\n"}}
%---
%[output:4b3095ff]
%   data: {"dataType":"matrix","outputData":{"columns":5,"name":"ans","rows":1,"type":"double","value":[["0.166670000000000","0.090909000000000","0.031416000000000","20.085999999999999","1.609400000000000"]]}}
%---
%[output:68090e15]
%   data: {"dataType":"textualVariable","outputData":{"name":"y","value":"0"}}
%---
%[output:1e4a15da]
%   data: {"dataType":"textualVariable","outputData":{"name":"y_alt","value":"-5.0000e-17"}}
%---
%[output:2d150835]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"20"}}
%---
%[output:214933bb]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"399.9987"}}
%---
%[output:5ee0a151]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"ans","rows":2,"type":"double","value":[["-799.998749998047"],["-0.0012500019531311"]]}}
%---
