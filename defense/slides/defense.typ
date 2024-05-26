#import "defense-template.typ": *

#let title = "Deep Inference for Graphical Theorem Proving"
#show: body => defense-template(title, body)

/********** CONTENT **********/

#title-slide(
  author: [Pablo Donato],
  title: title,
  date: "2024-05-29",
  extra: [
    Institut Polytechnique de Paris, LIX, PARTOUT
    #set text(size: 15pt)
    #v(1em)
    PhD defense, Palaiseau
    
    Supervised by Benjamin Werner
  ]
)

#part-slide[Introduction]

// #include "sections/context.typ"
// #include "sections/contrib.typ"

#part-slide[Symbolic Manipulations]

// #include "sections/pba.typ"
// #include "sections/sfl.typ"

#part-slide[Iconic Manipulations]

#include "sections/bubbles.typ"
#include "sections/flowers.typ"

#part-slide[Thank you!]
