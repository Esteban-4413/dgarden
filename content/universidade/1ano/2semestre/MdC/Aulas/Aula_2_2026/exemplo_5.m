a=1;
b=2;
c=3;
d=3;
e=4;
f=7;
x=1/a*(c-b*(c-a*f/d)/(b-a*e/d))
y=(c-a*f/d)/(b-a*e/d)

A=[[a,b];[d,e]]
B=[c;f]
S=A\B

D=A*S-B



eps=1e-299;
a=eps;
b=1;
c=1+eps;
d=1;
e=eps;
f=1+eps;
x=1/a*(c-b*(c-a*f/d)/(b-a*e/d))
y=(c-a*f/d)/(b-a*e/d)

A=[[a,b];[d,e]]
B=[c;f]
S=A\B


d=eps;
e=1;
f=1+eps;
a=1;
b=eps;
c=1+eps;
x=1/a*(c-b*(c-a*f/d)/(b-a*e/d))
y=(c-a*f/d)/(b-a*e/d)

A=[[a,b];[d,e]]
B=[c;f]
S=A\B