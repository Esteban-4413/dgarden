% calculando exp(1) utilizando operador 'for'
format long

x=1;
N=10;

e=exp(1)

ee=zeros(1,N+1);
qq=zeros(1,N+1);
nn=linspace(0,N,N+1);
s=0;
kf=1;
for k=0:N
   s=s+x^k/kf;
   ee(k+1)=s;
   kf=(k+1)*kf;
end
s

for k=1:N+1
   qq(k)=(1+1/k)^k;
end
qq(N+1)

figure(1)
plot(nn,ee,nn,qq)


%função exponencial


t=linspace(0,pi,101);
et=exp(t);
ett=zeros(1,101);
for k=0:100
   t1=t(k+1);
   ett(k+1)=1+t1+t1^2/2+t1^3/6;
end

figure(2)
plot(t,et,t,ett)


