---
tags:
  - curator/youtube
  - programming/haskell
  - haskell
  - desk
  - youtube
---

# 𝜆 Haskell: Recursividad y fé (jbb)

Haskell no es solo un lenguaje de programación; es un cambio de paradigma. Aquí la computación se encuentra con el cálculo lambda, y las funciones dejan de ser simples instrucciones para convertirse en definiciones matemáticas puras. Estos tres videos son mi selección para entender por qué este lenguaje es el estándar de oro de la elegancia.

---

##  La Historia y la Filosofía (Computerphile)
*Ponente: John Hughes (Co-diseñador de Haskell)*

Si quieres entender el "porqué" de Haskell, tienes que escuchar a quienes lo crearon. John Hughes explica cómo el lenguaje nació de la necesidad de compartir resultados entre investigadores y por qué el nombre rinde homenaje al lógico Haskell Curry.

<iframe width="100%" height="400" src="https://www.youtube.com/embed/LnX3B9oaKzw?start=376" title="Haskell - Computerphile" frameborder="0" allowfullscreen></iframe>

**Nota del Curador:**
Me encanta la parte donde explica que en Haskell, si ves $x + y$, siempre puedes reemplazarlo por $y + x$ sin miedo a efectos secundarios [00:04:35]. Es la definición de **transparencia referencial**.

---

## ⚡ Haskell en 100 Segundos (Fireship)
*Para una dosis rápida de dopamina técnica.*

Fireship tiene el don de resumir conceptos masivos en segundos. Es perfecto para repasar qué es la **evaluación perezosa (lazy evaluation)** y cómo los tipos se infieren automáticamente.

<iframe width="100%" height="400" src="https://www.youtube.com/embed/Qa8IfEeBJqk" title="Haskell in 100 Seconds" frameborder="0" allowfullscreen></iframe>

**¿Por qué está aquí?**
Es el "cheat sheet" visual definitivo. En menos de dos minutos te explica desde la inmutabilidad hasta el concepto de **Mónada** como un "wrapper" para manejar efectos secundarios en un mundo puro [00:02:09].

---

## 🛠️ Del Mundo Imperativo al Funcional
*Serie: Philipp Hagenlocher*

Este es el video que recomendaría a cualquier programador que venga de C, Java o Python. Philipp explica la diferencia fundamental: en lo imperativo le dices a la máquina *qué hacer*; en lo declarativo (Haskell), le dices *qué es* el resultado.

<iframe width="100%" height="400" src="https://www.youtube.com/embed/Vgu82wiiZ90" title="Basics of Haskell" frameborder="0" allowfullscreen></iframe>

**Punto Clave:**
La explicación sobre la **evaluación perezosa** es brutal. Un programa que en Java tardaría 3 años en ejecutarse, en Haskell podría tardar solo 2 porque solo evalúa lo que realmente necesita para dar un resultado [00:04:15]. 

---
---

## 🧩 Resolviendo Wordle en Haskell
*Canal:  Tweag by Modus Create

Este video es el ejemplo perfecto de por qué Haskell es divertido. No es una clase teórica; es pura resolución de problemas. Ver cómo se estructuran los tipos para un juego y cómo se maneja el estado de forma funcional es una lección invaluable.

<iframe width="100%" height="450" src="https://www.youtube.com/watch?v=2djr6ZxQ8VA&list=PLyzwHTVJlRc9Fcinmxe97pHl_pl1B7jH9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

**¿Por qué es oro puro?**
Tsoding tiene una forma de programar muy transparente. En este video ves cómo se pelea con el sistema de tipos hasta que todo "encaja". Es la mejor forma de perderle el miedo a la sintaxis y ver que, al final del día, Haskell es una herramienta poderosa para construir cosas reales.

**Nota del Curador:**
Fíjate en cómo usa funciones de orden superior para filtrar las palabras posibles. Es mucho más limpio que cualquier ciclo `for` anidado que verías en otros lenguajes.