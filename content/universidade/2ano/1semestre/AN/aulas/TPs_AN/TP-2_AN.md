# Ficha 1 _ Aritmética Computacional
exercícios: 2, 4, 3, 6

Exercício 4.

a)

- `realmax`
```matlab
>> help realmax
 realmax - Largest positive floating-point number

    Syntax
      f = realmax
      f = realmax(typename)
      f = realmax(like=p)

    Input Arguments
      typename - Floating-point precision type
        "double" (default) | "single"
      p - Prototype
        floating-point variable

    Output Arguments
      f - Largest floating-point number
        scalar

    Examples
      Double Precision
      Single Precision
      Specify Data Type and Complexity from Existing Array
      Specify Sparsity from Existing Array

    See also realmin, intmax, flintmax, format

    Introduced in MATLAB before R2006a
    Documentation for realmax
```

```matlab
>> realmax 

ans =

  1.7977e+308
```

$$
\begin{align*}
\Omega &= 1.7977 \times 10^308 \\
&=(1 - 2^{-53}) \times 2^1024 \\
&= (2 - 2^{-52}) \times 2^1023 \\
\end{align*}
$$

- `realmin`

```matlab
>> help realmin
 realmin - Smallest normalized floating-point number

    Syntax
      f = realmin
      f = realmin(typename)
      f = realmin(like=p)

    Input Arguments
      typename - Floating-point precision type
        "double" (default) | "single"
      p - Prototype
        floating-point variable

    Output Arguments
      f - Smallest positive normalized floating-point number
        scalar

    Examples
      Double Precision
      Single Precision
      Specify Data Type and Complexity from Existing Array
      Specify Sparsity from Existing Array

    See also eps, realmax, intmin, format

    Introduced in MATLAB before R2006a
    Documentation for realmin

>> realmin

ans =

  2.2251e-308

>> 
```
$$
\begin{align*}
\omega &= 2.2251 \times 10^{-308} \\
&= 2^{-1021 - 1} \\
&= 2^{-1022}
\end{align*}
$$

- eps

c)

```matlab
>> (1+2^-52)-1

ans =

   2.2204e-16
```

```matlab
>> eps

ans =

   2.2204e-16
```

$(1 + 2^{-52}) - 1 = 2^{-52} = \varepsilon_{\text{eps}}$

```matlab
>> (1+2^-53)-1

ans =

     0
```
$$
\begin{align*}
\frac{\varepsilon}{2} &= \frac{2^{-52}}{2} \\
&= 2^{-52} \times 2 ^{-1}
&= 2^{-53}
\end{align*}
$$

Exercício 3. 
a)
```matlab
>> pi

ans =

    3.1416

>> format long
>> pi

ans =

   3.141592653589793

>> format short e 
>> pi

ans =

   3.1416e+00

>> format long e 
>> pi

ans =

     3.141592653589793e+00

>> format hex 
>> pi

ans =

   400921fb54442d18
```

