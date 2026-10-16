# Ficha 2 - Interpolação polinomial
[[ExerciciosInterpolacao.pdf]]
1; 3; 4

1)

a) 
```m
x = [0 0.4];
y = sin(x);
xbar = 0.25;
L1 = (xbar - x(2)) / (x(1) - x(2));
L2 = (xbar - x(1)) / (x(2) - x(1));
L = [L1 L2];
valAprox = L * y'
```

```m
valAprox = 0.2434
```

```m
valExato = sin(xbar);
erro = abs(valAprox - valExato)
```

```m
erro = 0.0040
```

```m
majorante = (sin(0.4) / 2) * abs((xbar - x(1)) * (xbar - x(2)))
```

```m
majorante = 0.0073
```

A aproximação é 0.2434, um majorante para o erro é 0.0073 e o erro cometido é 0.0040.

b)

```m
xb = [0 0.4 0.6];
yb = sin(xb);
L1b = (xbar - xb(2)) * (xbar - xb(3)) / ((xb(1) - xb(2)) * (xb(1) - xb(3)));
L2b = (xbar - xb(1)) * (xbar - xb(3)) / ((xb(2) - xb(1)) * (xb(2) - xb(3)));
L3b = (xbar - xb(1)) * (xbar - xb(2)) / ((xb(3) - xb(1)) * (xb(3) - xb(2)));
Lb = [L1b L2b L3b];
valAproxb = Lb * yb'
errob = abs(valAprox - valExato)
majoranteb = abs((xbar - xb(1)) * (xbar - xb(2)) * (xbar - xb(3)))/6
```

```m
valAproxb = 0.2495
errob = 0.0040
majoranteb = 0.0022
```

3)
a)
```m
a=0.5*1E-3*27/(sin(1)*sqrt(3));
nthroot(a,3)
```

```m
ans = 0.2100
```

Logo $h \leq 0.21 \implies h = 0.2$

A tabela vai precisar de 6 entradas

4) 
Fórmula de Newton com diferenças dividas
[[Interpolacao.pdf]]
