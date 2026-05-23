% construindo gra'ficos

x=linspace(0,2*pi,100);
y=sin(x);
z=cos(x);
figure(1)
plot(x,y,x,z,'--',x,y+z,'+')
figure(2)
plot(x,y,'*')
figure(3)
plot(z,y)