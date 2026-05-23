
%  operadores 'if' e while

b_in=[2, 1, 5,4,6,7,1,10,13,11]

b=b_in;

N=numel(b);

p=1;
while p>0
   p=0;
   for k=1:N-1
      if b(k)>b(k+1)
         c=b(k);
         b(k)=b(k+1);
         b(k+1)=c;
         p=1;
      end
   end
end
      
b_out=b

