#import "../defense-template.typ": *

#new-section-slide[Bubble Calculi]

#slide(title: "The chemical metaphor")[
  #let eqv = $quad <==> quad$
  $
  "Item" &eqv "Ion" \
  "Color" &eqv "Polarity" \
  "Logical connective" &eqv "Chemical bond" \
  #only(1, $"Click" &eqv "Heating"$)
  #only(2, text(fill: red, $"Click" &eqv "Heating"$)) \
  "Drag-and-Drop" &eqv "Bimolecular reaction" \
  $
  
  #uncover(2)[
    #centerFocus[
      Breaks on rules that create #alert[subgoals]
      #set text(size: 18pt)
      #h(0.5em) (e.g. click on $conc(and)$)
    ]
  ]
]

#slide(title: "Context scoping")[
  #side-by-side(columns: (1.5fr, 1fr))[
    #image("../images/context-scoping.png")
  ][
    Two main inspirations:

    - The *chemical abstract machine* @berry_chemical_1989
    
    - *Nested sequents* \ @brunnler_deep_2009
  ]
]

#slide(title: "Example proof")[
  #for i in range(1, 20) {
    image("../images/bubbles-proof/step-" + str(i) + ".png")
  }
]

#slide(title: "Polarized bubbles")[
  #let alternatives-select(subslides, count: 1, content) = {
    alternatives-fn(count: count, position: center, subslide => {
      if subslides.contains(subslide) {
        halert(content)
      } else {
        content
      }
    })
  }
  #let select = alternatives-select.with(count: 5)

  #set align(center)
  
  #grid(
    columns: (auto, auto),
    align: center,
    row-gutter: 10mm,
    column-gutter: 30mm,
    select((1,3,4,5))[$
      #hypo($A$) med med #conc($#bubble(text(fill: black, $sigma$))$)
      step
      #conc($#bubble($#hypo($A$) med med #text(fill: black, $sigma$)$)$)
    $],
    select((2,3,4,5))[$
      #hypo($A$) med med #conc($#bubble(text(fill: black, $sigma$))$)
      step
      #conc($#bubble($#hypo($A$) med med #text(fill: black, $sigma$)$)$)
    $],
    select((4,))[$
      #hypo($A$) med med #conc($#bubble(text(fill: black, $sigma$))$)
      step
      #conc($#bubble($#hypo($A$) med med #text(fill: black, $sigma$)$)$)
    $],
    select((4,))[$
      #hypo($A$) med med #conc($#bubble(text(fill: black, $sigma$))$)
      step
      #conc($#bubble($#hypo($A$) med med #text(fill: black, $sigma$)$)$)
    $],
  )
  
  #v(1em)
  
  #centerFocus[
    #alternatives(position: center)[
      Intuitionistic logic
    ][
      Dual-intuitionistic logic
    ][
      Bi-intuitionistic logic
    ][
      Classical logic
    ][
        _Intuitionism = same polarities #alert[repel] eachother_
    ]
  ]
]