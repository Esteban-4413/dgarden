% e^x utilizando operador 'while'

function s=fun_exp(x,eps);
s=0;
n=1;
r=1;
k=0;
while r>eps
   s=s+x^k/n;
   k=k+1;
   n=k*n;
   r=x^k/n;
end
