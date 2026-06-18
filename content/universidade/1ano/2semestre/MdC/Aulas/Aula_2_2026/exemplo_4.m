
S=1000;
N=100;

P=S;
for k=1:N
   P=P/k^2;
end

P=P

P=1;
for k=1:N
   P=P/(N-k+1)^2;
end

P=S*P

S=1000;
N=102;

P=S;
for k=1:N
   P=P/k^2;
end

P=P

P=1;
for k=1:N
   P=P/(N-k+1)^2;
end

P=S*P