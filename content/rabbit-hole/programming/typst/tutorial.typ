// this is an import that allows us drawing diagrams with arrows, built on top of CeTZ.
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

= Basics

= Title
== Title
=== Title

*this is bold*
_italics_

$sin(x) = x^2$

Centered.
$ sin(x) = x^2 "this is some text inside the equation" $

$ integral_0^infinity sin x d x $

#align(center)[

  #set text(16pt)
  Homework 09
]

1. Let an abelian object be defined $cal(A)^j$

_proof:_
$
  a & = 2 + 4 + x \
  a & = 6 + x \
  a & = x + 6 \
$

#align(right)[#square(width: 0.9em, stroke: 0.5pt)]

#table(columns: 4)[day][month][year][event][1][2][3]

$ ==> ~~> \ $

#let Franklin = $Phi : RR -> NN = lambda(x) -> x^4$
#let Franklin2 = [This is a variable]

#Franklin
#Franklin2


#for i in range(10) {
  Franklin2
}

#for i in range(10) [
  #Franklin2 \
]

#diagram(
  cell-size: 15mm,
  $
                  G edge(f, ->) edge("d", pi, ->>) & im(f) \
    G slash ker(f) edge("ur", tilde(f), "hook-->")
  $,
)

