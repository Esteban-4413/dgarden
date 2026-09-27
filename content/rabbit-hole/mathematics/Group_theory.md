# Introduction to Group Theory: From Symmetry to Abstraction

> [!quote] The core idea
> "A group is not really about the symmetries of one particular object — it's an abstract way that *anything* can have symmetry."

That's the sentence to hold onto. Everything below is just the slow, careful unpacking of what it means.

## 1. What even *is* symmetry?

Before any formulas: an object is **symmetric** when it looks exactly the same after you do something to it. The "something" is a transformation, and we call that transformation a **symmetry** of the object.

Some quick intuition:

- An **isosceles triangle** looks the same if you flip it across its vertical axis. That's a mirror symmetry.
- A **rectangle** looks the same after a horizontal flip, a vertical flip, or a half-turn rotation. Three non-trivial symmetries, plus "do nothing."
- A **circle** looks the same after *any* rotation, by any angle. Infinitely many symmetries.
- The letter **A** has exactly the same symmetry as the isosceles triangle — same mirror axis, same behavior. Different object, identical symmetry structure.

Notice the pattern already forming:

1. Every object has at least one symmetry: doing nothing at all. This is the **identity** symmetry, usually written $e$.
2. Some objects have more. Sometimes one extra, sometimes many, sometimes infinitely many.
3. Two completely different-looking objects (a triangle, a letter) can share the exact same symmetry behavior.

That third point is the seed of everything that follows: if the *symmetries themselves* can be studied independently of the object they came from, then symmetry is really a structure in its own right.

## 2. The key realization: symmetries are functions

A transformation takes an object and *does something to it* — moves each point somewhere else. That is exactly what a function does. So:

> Symmetries are functions from an object to itself, and they preserve whatever structure makes the object "the same" afterward.

And if symmetries are functions, we already know three things we can do with them:

- **Name them**: $e$, $r$, $s$, ...
- **Compose them**: apply one, then another (written $s \circ r$, or just $sr$ once we drop the composition symbol — remember, functions apply right to left).
- **Ask for inverses**: is there a symmetry that undoes this one?

## 3. Working it out by hand: the equilateral triangle

Take an equilateral triangle. It has six symmetries: the identity, two rotations, and three reflections. Rather than naming all six separately, notice you can build all of them from just two:

- $r$ — rotate $1/3$ turn counter-clockwise
- $s$ — reflect across one altitude

Then the six symmetries are:

$$e, \quad r, \quad r^2, \quad s, \quad sr, \quad sr^2$$

Playing with these compositions by hand (or with a paper triangle) surfaces the properties that matter:

- Composing any two symmetries gives you another symmetry — you never "fall outside" the set of six.
- Composition is **associative**: $(ab)c = a(bc)$, always — this falls straight out of the fact that they're functions.
- There is an **identity** $e$ such that $ea = a = ae$ for every symmetry $a$.
- Every symmetry has an **inverse**: something that undoes it. Here, $r^{-1} = r^2$ and every reflection is its own inverse.
- Order matters: $rs \neq sr$ in general. Symmetries don't have to commute — and that's fine, because functions don't either.

## 4. Stripping away the triangle

Look at that list again:

0. Closure — combining two elements gives another element of the same set.
1. Associativity.
2. An identity element.
3. Inverses for everyone.

None of these four properties actually mention triangles, rotations, or reflections. They're properties of *how the operation behaves*, not properties of the specific object. So we can throw the triangle away entirely and keep only the abstract skeleton:

> [!abstract] **Definition — Group**
> A group is a set $G$ together with an operation $*$ such that:
> 0. $\forall a,b \in G,\; a*b \in G$ (closure)
> 1. $\forall a,b,c \in G,\; (a*b)*c = a*(b*c)$ (associativity)
> 2. $\exists\, e \in G$ such that $\forall a \in G,\; e*a = a = a*e$ (identity)
> 3. $\forall a \in G,\; \exists\, a^{-1} \in G$ such that $a*a^{-1} = e = a^{-1}*a$ (inverses)

This is exactly your class's construction, just built from the top down instead of the bottom up: a **groupoide** is the set + operation with nothing assumed; add associativity and it's a **semigrupo**; add an identity and it's a **monoide**; add inverses for everyone and it's a **grupo**.

## 5. Why the abstraction is the whole point

Here's the payoff, and the reason for the opening quote: once you have this abstract definition, you start noticing groups *everywhere*, in places that have nothing visibly to do with triangles or reflections:

- $(\mathbb{Z}, +)$ is a group: closed, associative, identity $0$, and every integer has an additive inverse.
- $(\mathbb{R}, +)$ is a group for the same reasons.
- $(\mathbb{R}, \cdot)$ is **not** a group — $0$ has no multiplicative inverse. But $(\mathbb{R} \setminus \{0\}, \cdot)$ *is* one, which is exactly why your notes single out $(\mathbb{Q}\setminus\{0\}, *)$ as an example: removing the one troublemaker restores the group structure.
- The symmetries of a regular $n$-gon form the **dihedral group** of order $2n$.
- The permutations of $\{1, 2, \ldots, n\}$ form the **symmetric group** $S_n$ — the "symmetries" of a plain set, with no geometry involved at all.

None of these look like each other on the surface. A rotation is not a number, and a number is not a permutation. But underneath, they all satisfy the same four rules. That is what it means to say a group is "an abstract way that anything can have symmetry": symmetry stops being a property of shapes and becomes a property of *structure*, which is why the same theory shows up in geometry, number theory, chemistry (molecular symmetry), physics (particle symmetries), and cryptography (as in your notes on prime moduli and hashing).

## 6. Where this leads next

With the four axioms in hand, the natural next questions are the ones your lecture notes are already building toward:

- Left/right neutral elements and why they must coincide.
- Left/right inverses and uniqueness.
- Cayley tables as a way to *see* the group structure of a finite set at a glance.
- Eventually: homomorphisms and isomorphisms — the precise way to say "these two groups are secretly the same," which is really just asking whether two different symmetry stories are, underneath, the same abstract group.

---

**Sources:**
- Evan P. Dummit, ["What Are Groups, And Why Are They Interesting?"](https://www.youtube.com/watch?v=mH0oCDa74tE) — Northeastern Math Club talk, Sept. 2024.
- Keith Conrad, ["Why study group theory?"](https://kconrad.math.uconn.edu/blurbs/grouptheory/whygroups.pdf)
