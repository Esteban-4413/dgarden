---
topic:
date: 2026-02-13
course:
tags:
  - Universidade
  - calculus
  - math
excalidraw-plugin: parsed
excalidraw-open-md: true
---
# Notas para el segundo parcial de Cálculo

## Fichas resolvidas
- [x] Ficha 4
- [ ] Ficha 5
- [ ] Ficha 6
---

***TEMA 4: Límites y continuidad  #Cálculo1 #Límites #Continuidad

Definición de un límite:
![[Pasted image 20251208132649.png]]
si no existe tal L entonces se dice que f diverge o simplemente que el límite no existe

### Ejercicios folha 4
[[Calculo_folha4.pdf#page=1|Calculo_folha4]]

4.2
La propiedad que es realmente verdadera es $$\lim_{x \to x_{0}}f(x)=2 \times \\lim_{x \to x_{0}} f(2x)$$
4.5 #TeoremaDelSandwich #TeoremaDoEnquadramento

Se usa el Teorema del sandwich o teorema del encuadramiento

4.7 [[LimitesContinuidade.pdf#page=11|LimitesContinuidade, page 11]]
$$\forall_{\epsilon} > 0 \text{ }  \exists \varphi \text{ } \forall_{x} \in X \text{ } \text{ } \text{ } \text{ } \text{ }|x \ - x_{0}| <\varphi \rightarrow |f(x) - f(x_{0})|<\epsilon   $$
a) y b) ??????

4.9 #Dirichlet y #Thomae

Dirichlet y Thomae (funciones raras)

4.10 #Heaviside
b)

función de heaviside
función matemática discontinua que vale 0 para argumentos negativos y 1 para argumentos no negativos (positivos o cero), modelando un "interruptor" que se enciende instantáneamente, usándose en ingeniería para circuitos y señales, y representando un "sí/no" o "activo/inactivo", con su derivada siendo la función delta de Dirac y clave en la transformada de Laplace para funciones por tramos

[[Calculo_folha4.pdf#page=2|Calculo_folha4, page 2]]

# Resumen: Hoja 4 (Límites y Continuidad)

## 1. Definición de Continuidad
Para que una función $f$ sea continua en un punto $a$, deben cumplirse tres cosas simultáneamente:
1. Existe $f(a)$.
2. Existe el límite $\lim_{x \to a} f(x)$ (los límites laterales coinciden).
3. El límite es igual al valor de la función.

> **Fórmula:**
> $$\lim_{x \to a^-} f(x) = \lim_{x \to a^+} f(x) = f(a)$$

---

## 2. Teorema de Bolzano-Cauchy (Ceros de una función)
**¿Para qué sirve?**
Es fundamental para demostrar que una ecuación **tiene solución** (existe una raíz) dentro de un intervalo, aunque no sepamos calcularla.

> **Enunciado:**
> Sea $f$ una función continua en un intervalo cerrado $[a, b]$.
> Si $f(a)$ y $f(b)$ tienen signos contrarios (es decir, $f(a) \cdot f(b) < 0$), entonces existe al menos un punto $c \in ]a, b[$ tal que:
> $$f(c) = 0$$

* **Uso típico:** "Muestre que la ecuación $x^3 + x - 1 = 0$ tiene solución en $]0, 1[$".

---

## 3. Teorema de Weierstrass (Extremos Absolutos)
**¿Para qué sirve?**
Garantiza que una función acotada y continua siempre alcanza un "techo" (máximo) y un "suelo" (mínimo).

> **Enunciado:**
> Si $f$ es continua en un intervalo cerrado y acotado $[a, b]$, entonces $f$ alcanza un **máximo absoluto** y un **mínimo absoluto** en ese intervalo.
> $$\exists x_{min}, x_{max} \in [a, b] \text{ tales que } f(x_{min}) \le f(x) \le f(x_{max}), \forall x \in [a, b]$$

---

## 4. Teorema del Valor Intermedio (Darboux)
**¿Para qué sirve?**
Es una generalización de Bolzano. Dice que una función continua no da "saltos". Si pasa de 10 a 20, tuvo que pasar por el 15.

> **Enunciado:**
> Si $f$ es continua en $[a, b]$ y $k$ es un número entre $f(a)$ y $f(b)$, entonces existe al menos un $c \in ]a, b[$ tal que:
> $$f(c) = k$$

---

#  Resumen: Hoja 5 (Funciones Especiales)

## 1. Funciones Trigonométricas Inversas
Son vitales para resolver ecuaciones y simplificar expresiones (como en el Ejercicio 5.3).

| Función          | Dominio      | Rango (Imagen)                    | Definición                      |
| :--------------- | :----------- | :-------------------------------- | :------------------------------ |
| **Arcoseno**     | $[-1, 1]$    | $[-\frac{\pi}{2}, \frac{\pi}{2}]$ | $y = \arcsin x \iff \sin y = x$ |
| **Arcocoseno**   | $[-1, 1]$    | $[0, \pi]$                        | $y = \arccos x \iff \cos y = x$ |
| **Arcotangente** | $\mathbb{R}$ | $]-\frac{\pi}{2}, \frac{\pi}{2}[$ | $y = \arctan x \iff \tan y = x$ |

### Identidades Clave para Deducciones (Ej. 5.3)
Para simplificar expresiones como $\sin(\arccos x)$:
1. $\sin^2 \alpha + \cos^2 \alpha = 1$
2. $1 + \tan^2 \alpha = \sec^2 \alpha = \frac{1}{\cos^2 \alpha}$
3. **Truco del triángulo:** Dibuja un triángulo rectángulo donde el ángulo es $\alpha = \arccos x$ (cateto adyacente $= x$, hipotenusa $= 1$).

---

## 2. Funciones Hiperbólicas
Se definen usando la exponencial $e^x$. Se comportan parecido a las trigonométricas, pero con diferencias de signo.

### Definiciones
$$\sinh x = \frac{e^x - e^{-x}}{2} \quad ; \quad \cosh x = \frac{e^x + e^{-x}}{2} \quad ; \quad \tanh x = \frac{e^x - e^{-x}}{e^x + e^{-x}}$$

### Identidad Fundamental Hiperbólica (¡Ojo al signo menos!)
A diferencia de la trigonometría clásica ($\cos^2 + \sin^2 = 1$), aquí es:
$$\cosh^2 x - \sinh^2 x = 1$$

### Propiedades de Paridad
* **Impar:** $\sinh(-x) = -\sinh x$
* **Par:** $\cosh(-x) = \cosh x$ (como una parábola colgante).

---

## 3. Inversas Hiperbólicas (Argumentos)
Aparecen en el Ejercicio 5.10. Se expresan con logaritmos.

1. **Argumento Seno Hiperbólico:**
   $$\text{argsh } x = \ln(x + \sqrt{x^2 + 1}), \quad \forall x \in \mathbb{R}$$
2. **Argumento Coseno Hiperbólico:**
   $$\text{argch } x = \ln(x + \sqrt{x^2 - 1}), \quad x \ge 1$$
3. **Argumento Tangente Hiperbólica:**
   $$\text{argth } x = \frac{1}{2} \ln\left(\frac{1+x}{1-x}\right), \quad |x| < 1$$

# Resumen: Teoremas Fundamentales del Cálculo (Hoja 6)

## 1. Teorema de Bolzano (Existencia de Raíces)

**¿Para qué sirve?**
Permite asegurar que una ecuación **tiene solución** (existe al menos una raíz), aunque no sepamos calcularla exactamente. Se basa en el cambio de signo.

> **Enunciado:**
> Sea $f$ una función continua en un intervalo cerrado $[a, b]$.
> Si $f(a)$ y $f(b)$ tienen signos opuestos (es decir, $f(a) \cdot f(b) < 0$), entonces existe al menos un punto $c \in ]a, b[$ tal que:
> $$f(c) = 0$$

### Ejemplo Práctico (Ejercicio 6.13)
**Problema:** Demostrar que $p(x) = x^3 - 6x^2 + 9x - 1$ tiene un cero en $]1, 3[$.

**Demostración:**
1. Evaluamos la función en los extremos:
   $$p(1) = 1^3 - 6(1)^2 + 9(1) - 1 = 3 \quad (> 0)$$
   $$p(3) = 3^3 - 6(3)^2 + 9(3) - 1 = 27 - 54 + 27 - 1 = -1 \quad (< 0)$$
2. Como $p(x)$ es continua (es un polinomio) y hay cambio de signo ($p(1) \cdot p(3) < 0$), por el **Teorema de Bolzano**:
   $$\exists c \in ]1, 3[ \text{ tal que } p(c) = 0$$

---

## 2. Teorema de Rolle (Unicidad y Derivada)

**¿Para qué sirve?**
Se usa frecuentemente para demostrar la **unicidad** de una raíz (que no hay más de una) mediante reducción al absurdo. Relaciona los valores iguales de la función con un cero en la derivada.

> **Enunciado:**
> Sea $f$ una función continua en $[a, b]$ y derivable en $]a, b[$.
> Si $f(a) = f(b)$, entonces existe al menos un punto $c \in ]a, b[$ tal que:
> $$f'(c) = 0$$
> *(La tangente es horizontal).*

###  Ejemplo Práctico (Ejercicio 6.15)
**Problema:** Demostrar que $x^3 - 3x + b = 0$ no puede tener más de una raíz en $]-1, 1[$.

**Demostración (Reducción al Absurdo):**
1. Supongamos que existen **dos** raíces distintas $x_1, x_2 \in ]-1, 1[$ tal que $f(x_1) = f(x_2) = 0$.
2. Por el Teorema de Rolle, debería existir un $c$ entre ellos tal que $f'(c) = 0$.
3. Calculamos la derivada:
   $$f'(x) = 3x^2 - 3$$
4. Buscamos dónde se anula:
   $$3x^2 - 3 = 0 \iff x^2 = 1 \iff x = \pm 1$$
5. **Contradicción:** Los puntos $x=1$ y $x=-1$ **no pertenecen** al intervalo abierto $]-1, 1[$.
6. **Conclusión:** La suposición es falsa, por lo tanto, no puede haber dos raíces.

---

### 3. Teorema de Lagrange / Valor Medio (Desigualdades)

**¿Para qué sirve?**
Es la herramienta principal para demostrar **desigualdades** complejas que involucran funciones ($e^x, \ln x, \sin x$).

> **Enunciado:**
> Sea $f$ continua en $[a, b]$ y derivable en $]a, b[$. Existe un punto $c \in ]a, b[$ tal que:
> $$\frac{f(b) - f(a)}{b - a} = f'(c)$$
> *(La velocidad media es igual a la velocidad instantánea en un punto).*

#### Ejemplo Práctico (Ejercicio 6.20 a)
**Problema:** Demostrar que $e^x > 1 + x$ para todo $x \neq 0$.

**Demostración:**
1. Consideramos $f(t) = e^t$ en el intervalo $[0, x]$ (asumiendo $x>0$).
2. Aplicamos Lagrange:
   $$\frac{e^x - e^0}{x - 0} = e^c \implies \frac{e^x - 1}{x} = e^c$$
3. Despejamos $e^x$:
   $$e^x = 1 + x \cdot e^c$$
4. Analizamos el signo:
   Como $c \in ]0, x[$, entonces $c > 0 \implies e^c > 1$.
   Multiplicando por $x$ (que es positivo): $x \cdot e^c > x$.
5. Sustituimos en la ecuación:
   $$e^x = 1 + (x \cdot e^c) > 1 + x$$
   $$\boxed{e^x > 1 + x}$$

---

##  Guía Rápida para Examen

| Si el ejercicio pide...                        | Usa este Teorema        | Estrategia                                                                       |
| :--------------------------------------------- | :---------------------- | :------------------------------------------------------------------------------- |
| Demostrar que **existe** solución              | **Bolzano**             | Busca cambio de signo $(+ \to -)$ en los extremos.                               |
| Demostrar que hay **exactamente una** solución | **Bolzano + Monotonía** | 1. Bolzano (existe).<br>2. Signo de $f'(x)$ (siempre crece/decrece $\to$ única). |
| Demostrar que **NO** hay más soluciones        | **Rolle**               | Supón que hay dos y busca contradicción en $f'(c)=0$.                            |
| Demostrar una **desigualdad**                  | **Lagrange**            | Aplica $\frac{f(x)-f(0)}{x} = f'(c)$ y acota $f'(c)$.                            |

*Bibliografías:
[[LimitesContinuidade.pdf#page=1|LimitesContinuidade, page 1]]
[[Apuntes_en_Cálculo_I (4).pdf#page=43|Apuntes_en_Cálculo_I (4), pag]]
[[Derivadas.pdf]]
[[Funcoes.pdf]]
[[TrigonometricasHiperbolicas.pdf]]

*Ejercicios:
[[Calculo_folha4.pdf#page=1|Calculo_folha4, page 1]]
[[Calculo_folha5.pdf]]
[[Calculo_folha6.pdf]]
[[CalculoEng_folha4_AL2.pdf#page=1|CalculoEng_folha4_AL2, page 1]]

*Formularios*
[[FormularioDerivadas.pdf]]
[[FormularioTrigonometricasHiperbolicas.pdf]]

  