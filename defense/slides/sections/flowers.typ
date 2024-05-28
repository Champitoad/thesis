#import "../defense-template.typ": *

#new-section-slide[Flower Calculus]

#slide(title: "Polarity meets Space")[
  #set align(center)
  Bubble calculi are not *fully iconic* (need for _symbolic_ connectives)
  #v(2em)
  #pause
  #set text(size: 26pt)
  Key insight: #alert[*space*] is _polarized_, not *objects*
  // #v(2em)

  // #pause
  
  // - (Peirce, 1896): *existential graphs (EGs)* for _classical_ logic
  
  // #pause
  
  // - @oostra_graficos_2010@minghui_graphical_2019: EGs for _intuitionistic_ logic

  // #pause
  
  // #thus *Flower calculus*: intuitionistic variant that is #alert[analytic]
]

#slide(title: [Existential Graphs #title-right[@peirce_prolegomena_1906]])[
  - *Diagrammatic* proof system invented by C. S. Peirce around 1890
  
  - #alert[Topological] representation of *negation* as nested "_cuts_" (Jordan curves):
  
  #align(center)[
    #grid(
      columns: (auto, auto, auto),
      inset: 5mm,
      grid(
        columns: (5cm, 5cm),
        align: center,
        inset: 15pt,
        $A #juxt B$,
        grid.vline(),
        $#cut(inv: true, $A$)$,
        grid.hline(),
        $A and B$,
        $not A$,
      ),
      uncover("2-", text(size: 30pt)[$arrow.r.triple$]),
      uncover("2-", grid(
        columns: (5cm, 5cm),
        align: center,
        inset: 15pt,
        $#cut(inset: 0pt, inv: true, $#cut($A$) #cut($B$)$)$,
        grid.vline(),
        $#cut(inset: 0pt, inv: true, $A #juxt #cut($B$)$)$,
        grid.hline(),
        $A or B$,
        $A #limp B$,
      ))
    )
  ]
]

#slide(title: "Illative transformations")[
  #v(-3cm)
  #centerFocus[
    Inference rules on #alert[locations]
  ]
  #v(1.5cm)
  $
    #uncover("1-")[$a #juxt #cut(inv: true, $a #juxt #cut($b$)$)$]
    #uncover("2-")[$#xrule[Deiteration] a #juxt #cut(inv: true, $#phantom[a #juxt] #cut($b$)$)$]
    #uncover("3-")[$#xrule[Double-cut] a #juxt b$]
    #uncover("4-")[$#xrule[Deletion] b$]
  $
]

#slide(title: [Intuitionistic Existential Graphs #title-right[@oostra_graficos_2011]])[
  // - *Intuitionistic* variant of existential graphs

  - Topological representation of *implication* with Peirce's "_scroll_"
  
  - Scroll = #alert[continuously] joined nested cuts:
    #align(center)[
      #grid(
        columns: (auto, auto, auto),
        inset: 5mm,
        grid(
          columns: (5cm, 5cm),
          align: center,
          inset: 15pt,
          nscroll(fontsize: 20pt, outloop: (size: 1.8cm), inloops: ((:), (content: $B$, size: 0.6cm), (:), (content: $A$, size: 0.6cm))).content,
          grid.vline(),
          nscroll(fontsize: 20pt, outloop: (size: 1.8cm, content: move(dx: -7mm, $A$)), inloops: ((:), (content: $B$, size: 0.6cm), (:), (:))).content,
          grid.hline(),
          $A or B$,
          $A #limp B$,
        ),
        text(size: 30pt)[$eq.not$],
        grid(
          columns: (5cm, 5cm),
          align: center,
          inset: 15pt,
          $#cut(inset: 0pt, inv: true, $#cut($A$) #cut($B$)$)$,
          grid.vline(),
          $#cut(inset: 0pt, inv: true, $A #juxt #cut($B$)$)$,
          grid.hline(),
          $not (not A and not B)$,
          $not (A and not B)$,
        )
      )
    ]
]


#slide(title: [Blooming])[
  #set align(center)
  #let emoji_size = 35pt

  #v(-0.6em)

  #side-by-side(gutter: 0cm, columns: (auto, auto))[
    #grid(
      columns: (1fr, 1.25fr),
      only("2-", image("../images/cylinder.jpg", fit: "cover", width: 100%)),
      grid(
        columns: (auto),
        inset: 0.3em,
        only("2-", text(size: emoji_size, emoji.pistol)),
        v(0.1em),
        nscroll(outloop: (content: $a$, size: 2.75cm), inloops: (
          (content: $b$), (content: $c$), (content: $d$), (content: $e$), (content: $f$), 
        )).content,
        only("2-", text(size: emoji_size, font: "Noto Color Emoji", "☹️")),
      )
    )
  ][
    #grid(
      columns: (1.25fr, 1fr),
      only("3-", grid(
        columns: (auto),
        inset: 0.3em,
        only("4-", text(size: emoji_size, emoji.flower)),
        v(0.1em),
        flower.one((
          pistil: (content: $a$),
          petal_size: 3cm,
          petals: ((name: "p1", content: $b$), (name: "p2", content: $c$), (name: "p3", content: $d$), (name: "p4", content: $e$), (name: "p5", content: $f$))
        )).content,
        only("4-", text(size: emoji_size, font: "Noto Color Emoji", emoji.face.happy)),
      )),
      only("4-", image("../images/flower.jpg", fit: "cover", width: 100%)),
    )
  ]

  #only("3")[
    Turn *inloops* into #alert[petals].
  ]
  #only("4")[
    #link("https://en.wikipedia.org/wiki/Make_love,_not_war")[_"Make love, not war"_]
  ]
]

#slide(title: "Pollination")[
  #set align(center)
  #grid(
    columns: (auto, auto),
    inset: 5mm,
    align: bottom,
    image("../images/cross-pollination.png", width: 50%, fit: "contain"),
    image("../images/self-pollination.png", width: 47%, fit: "contain"),
    "Cross-pollination",
    "Self-pollination",
  )
]

#slide(title: [Flower Calculus #title-right[@flower-calculus]])[
  #set text(18pt)

  #side-by-side(columns: (2fr, 1fr))[
      // - *Flower* = continuous deformation of scroll turned _inside-out_
      
    - Support for *quantification* with _binders_ $arrow(x)$

    - Interpretation as #alert[geometric] formulas from _topos theory_

    - Inference rules divided in two fragments:

      - *Nature* #nature = #alert[analytic] and invertible
      - *Culture* #culture = non-invertible
  
    #theorem("Analytic completeness")[
      If a flower is _valid_ (i.e. true in every Kripke model), then it is $#nature$-provable.
    ]
  ][
    #show math.equation: set text(font: "Fira Math", weight: 400)
    $
      #scale(x: 80%, y: 80%, reflow: true, rebase(flower.one((
        pistil: (size: 1.5cm, content: $accent(x, arrow) #h(8pt) Phi$),
        petal_size: 5cm,
        petals: (
          (name: "1", content: $accent(y_1, arrow) #h(8pt) Psi_1$),
          (name: "1", content: $accent(y_2, arrow) #h(8pt) Psi_2$),
          (name: "1", content: $accent(y_3, arrow) #h(8pt) Psi_3$),
          (name: "1", content: $accent(y_(i-1), arrow) #h(8pt) Psi_(n-1)$),
          (name: "1", content: $accent(y_n, arrow) #h(8pt) Psi_n$),
        )
      )).content)) \
    $
    #set text(size: 22pt)
    $
      forall arrow(x). (and.big Phi #limp or.big_i exists arrow(y_i). Psi_i)
    $
  ]
]

#slide(title: [#sys[Flower Prover] #title-right[#text(size: 19pt)[(mascarpone cream)]]])[
  #align(center)[
    _GUI in the Proof-by-Action paradigm based on the flower calculus_
  ]
  #v(1em)

  - Represent flowers as nested *boxes*

  - *Modal interface* to interpret gestural actions:
  #v(0.5em)
  $
    #text(fill: eastern.darken(20%))[Proof] #text[mode] &arrow.l.r.double.long #text(fill: eastern.darken(20%))[Natural] #text[(invertible and analytic) rules] \
    #text(fill: red.darken(20%))[Edit] #text[mode] &arrow.l.r.double.long #text(fill: red.darken(20%))[Cultural] #text[(non-invertible) rules] \
    #text(fill: purple.darken(20%))[Navigation] #text[mode] &arrow.l.r.double.long #text(fill: purple.darken(20%))[Contextual] #text[closure (functoriality)] \
  $
]
