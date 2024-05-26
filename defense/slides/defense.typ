#import "@preview/polylux:0.3.1": *
#import "@preview/xarrow:0.3.0": xarrow
#import "@preview/curryst:0.3.0": rule, proof-tree

#import "theme/metropolis.typ": *
#import "@local/svg-emoji:0.1.0": setup-emoji

#import "flower.typ"
#import "eg.typ": *
#import "notations.typ": *
#import "utils.typ": *


/********** PREAMBLE **********/


#show: metropolis-theme.with(
  footer: [
    #set text(size: 13pt, fill: rgb("#949494"))
    Deep Inference for Graphical Theorem Proving
  ]
)

// Font config
#set text(font: "Fira Sans", weight: "light", size: 20pt)
#show math.equation: set text(font: "Fira Math", weight: "light")
#set strong(delta: 100)
#show link: underline.with(offset: 3pt)
#show: setup-emoji

// Layout config
#set par(justify: true)
#set list(spacing: 1.5em)

// Useful shortcuts
#let mt = spar($|->$)
#let to = spar($->$)
#let xrule(content) = spar(spacing: 1em, xarrow(sym: sym.arrow.r, irule(content)))

// Theorem and definition environements
#import "@preview/ctheorems:1.1.2": *
#show: thmrules

#let definition = thmbox(
  "definition", "Definition",
  fill: blue.lighten(90%),
).with(numbering: none)

#let theorem = thmbox(
  "theorem", "Theorem",
  fill: red.lighten(90%),
).with(numbering: none)

#let corollary = thmbox(
  "corollary", "Corollary",
  fill: green.lighten(90%),
).with(numbering: none)

#let proof = thmproof("proof", "Proof")

// Finetune layout of inference rules
#let proof-tree = proof-tree.with(prem-min-spacing: 1cm)

// Slide for a part
#let part-slide(title) = focus-slide[
  #set text(size: 40pt, weight: 400)
  #title
]

#let squareFocus(content) = rect(inset: 15pt, content)

#let centerFocus(content, size: 22pt) = [
  #set align(center)
  #set text(size)
  #v(1em)
  #content
  #v(1em)
]

#let titleWord(content) = underline(stroke: red + 2pt, offset: 6pt, content)


/********** CONTENT **********/


#title-slide(
  author: [Pablo Donato],
  title: "Deep Inference for Graphical Theorem Proving",
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

#slide(title: [Logic])[
  - Study of _sound_ #alert[reasoning]
  
  #pause
  
  - Example of everyday life deduction:
  
  #align(center)[
  #grid(
    columns: (auto, auto),
    align: center,
    inset: 1cm,
    only("3-")[
      $
      #hypo[*premisses*]\
      #conc[*conclusion*]\
      $
    ],
    [$
      #only("-3", proof-tree(rule(
        [
          #only("-2")[you are wet 💧]
          #only("3-")[#conc[you are wet] 💧]
        ],
        [
          #only("-2")[it rains 🌧️]
          #only("3-")[#hypo[it rains] 🌧️]
        ],
        [
          #only("-2")[you don't have ☂️]
          #only("3-")[#hypo[you don't have] ☂️]
        ],
      )))
      #only("4-", proof-tree(rule(
        [
          #only("-2")[you are wet 💧]
          #only("3-")[#conc[you are wet] 💧]
        ],
        [
          #only("-2")[it rains 🌧️]
          #only("3-")[#hypo[it rains] 🌧️]
        ],
        [
          #only("-2")[you don't have ☂️]
          #only("3-")[#hypo[you don't have] ☂️]
        ],
        [#text(fill: color.transparentize(hypo_color, 50%))[you are outside]],
        [#text(fill: color.transparentize(hypo_color, 50%))[you are not under a bus shelter]],
        [#text(fill: color.transparentize(hypo_color, 50%))[...]],
      )))
    $]
  )
  ]
  #uncover("5-")[
    - Hidden assumptions $=>$ lack of *certainty*
  ]
]

// #slide(title: [The need for abstraction])[
//   #set text(size: 18pt)

//   An analogy between *counting* and *reasoning*:
//   #align(center)[
//     #text(size: 24pt)[
//       #grid(
//         columns: (auto, auto, auto),
//         align: center,
//         inset: 10pt,
//         [🍎🍎],
//         [],
//         [🍊🍊🍊],
//         only("2-")[$2$],
//         only("2-")[$+$],
//         only("2-")[$3$],
//         grid.cell(
//           colspan: 3,
//           inset: 0pt,
//           only("2-")[$= 5$],
//         )
//       )
//     ]
//     _How many fruits are there?_
//   ]
//   #uncover("3-")[

//     - Fruits do _not_ matter, only their *numbers*
//   ]
//   #uncover("4-")[
//     - To study $+$, *concrete* numbers may even be _irrelevant_:
//     $ "e.g." #h(1cm) x + y = y + x "    for every pair of numbers x,y" $
//   ]
//   #v(0.5em)
//   #uncover("5-")[
//     #set align(center)
//     #thus We gradually #alert[abstract] from _reality_
//   ]
// ]

#slide(title: [Formal logic])[
  Let's try another one #text(size: 19pt)[(Aristotle -- 4th century BC)]:
  #align(center)[
    #proof-tree(rule(
      [_Socrates is mortal_],
      [_Socrates is human_],
      [_All humans are mortal_],
    ))
  ]

  #pause

  - Better! But _why_ does it hold?

  #pause

  - *Forget* everything about _reality_:
  #align(center)[
    #proof-tree(rule(
      [$x "is" Q$],
      [$x "is" P$],
      [$"All" P "are" Q$],
    ))
  ]
  #pause
  #centerFocus[
    #thus #alert[Formal] essence of logical reasoning
  ]
]

// #slide(title: [From words to symbols])[
//   #set text(size: 18pt)

//   - Happens all the time in mathematics for *conciseness*:
//   $
//   &"The result of adding" 2 "with" 3 "is" 5 \
//   arrow.r.squiggly &"The result of" 2 + 3 "is" 5 \
//   arrow.r.squiggly &2 + 3 = 5 \
//   $
  
//   #pause
  
//   - We can do the same for *logic*!
//   #align(center)[
//     $
//     #only("-2")[
//       #proof-tree(rule(
//         [$x "is" Q$],
//         [$x "is" P$],
//         [$"All" P "are" Q$],
//       ))
//     ]
//     #only("3-")[
//       #proof-tree(rule(
//         [$x "is" Q$],
//         [$x "is" P$],
//         [$"forall" y ", if" y "is" P "then" y "is" Q$],
//       ))
//     ]
//     #uncover("4-")[
//       $" " arrow.r.squiggly " "$
//       #proof-tree(rule(
//         [
//           #only("4-")[$Q(x)$]
//         ],
//         [
//           #only("4-")[$P(x)$]
//         ],
//         [
//           #only("4")[$"forall" y ", if" P(y) "then" Q(y)$]
//           #only("5")[$forall y. "if" P(y) "then" Q(y)$]
//           #only("6-")[$forall y. P(y) #limp Q(y)$]
//         ],
//       ))
//     ]
//     $
//     #uncover("4-")[
//       #grid(
//         columns: (auto, auto, auto, auto, auto, auto),
//         inset: 5mm,
//         align: center,
//         grid.hline(),
//         grid.vline(),
//         [$x "is" P$],
//         grid.vline(),
//         [$"forall" x$],
//         grid.vline(),
//         [$"if" A "then" B$],
//         grid.vline(),
//         [$A "and" B$],
//         grid.vline(),
//         [$A "or" B$],
//         grid.vline(),
//         [$"not" A$],
//         grid.vline(),
//         grid.hline(),
//         [$P(x)$],
//         [$forall x.$],
//         [$A #limp B$],
//         [$A and B$],
//         [$A or B$],
//         [$not A$],
//         grid.hline(),
//       )
//     ]
//   ]
// ]

#slide(title: [#titleWord[Inference] rules])[
  $
    #proof-tree(rule(
      [$x "is" Q$],
      [$x "is" P$],
      [$"All" P "are" Q$],
    ))
    #uncover("2-")[$
      #h(1cm) arrow.r.squiggly #h(1cm)
      #proof-tree(rule(
        [$Q(x)$],
        [$P(x)$],
        [$forall y. P(y) #limp Q(y)$],
      ))
    $]
  $
  #v(1cm)
  
  #uncover("3-")[
  - _Generic patterns_ of deduction as *rules*
  ]

  #uncover("4-")[
  - Formalist school #text(size: 19pt)[(Hilbert -- 20th century)]:
  ]
  
  #uncover("4-")[
  #centerFocus[
    Maths as a huge *game*

    Goal: to #titleWord[prove] #titleWord[theorems] by following rules
  ]]
  
  #uncover("5-")[
  - *Proof theory:* design & study of _rule systems_ capturing maths
  ]
]

// #slide(title: [Digression: AI])[
// ]

#slide(title: [Proof assistants])[
  - Inference rules represented with *symbols*
  
  #pause

  - *Computers* very good at _manipulating symbols_ and _following rules_
  
  #pause
  
  #centerFocus[
    #thus Teach computers how to do maths with proof theory!
  ]
  
  #pause
  
  - Problem: maths is _hard_ $=>$ need for a *human* in the loop

  #centerFocus[
    #thus #alert[Interactive] Theorem Provers (ITPs)
  ]
]

#slide(title: [Textual vs. #titleWord[Graphical]])[
  #set align(center)

  #let user = text(size: 35pt)[🙇]
  #let computer = text(size: 35pt)[💻]

  *State-of-the art:* build proofs by writing *textual* commands

  #centerFocus[
    #uncover("2-")[
      #user : #quote[Please apply _this_ rule]
    ]

    #alternatives-match(position: center + horizon, (
      "3": [
        #computer : "#text(fill: olive)[*✅ OK*] here is the result!"
      ],
      "4-": [
        #computer : "#text(fill: red)[*❌ ERROR:*] dkfsljfjdklsfjdkfjsldjfkdlsfj"
      ]
    ))
  ]
  
  #uncover("5-")[
    #squareFocus[
      #grid(
        columns: (auto),
        align: left,
        inset: 8pt,
        [*1st contribution:* build proofs by #alert[direct manipulation] of _formulas_],
        [
          #thus  No need to _memorize_ the rules \
          #thus  No risks of _errors_
        ]
      )
    ]
  ]
]

#slide(title: [Symbolic vs. Iconic])[
  - *Symbols* are hard to:
    - _learn_ $=>$ purely conventional meaning
    - _manipulate_ $=>$ need for very precise gestures

  #pause
  
  - Formulas can *interact* by being _moved_ in the same #alert[space]
  
  #pause

  #v(1cm)
  #set align(center)
  #squareFocus[
    *2nd contribution:* replace logical symbols by #alert[geometrical diagrams]
  ]
]

// #slide(title: [Classical vs. Intuitionistic])[
//   - *Classical* logic: is this statement true?

//   - *Intuitionistic* logic: _how_ is this statement true?
// ]


#part-slide[Symbolic Manipulations]

#new-section-slide[Proof-by-Action]

#focus-slide[
  _A *demo* is worth a thousand words!_
]

#slide(title: [Paradigm])[
  #let space(content) = text(fill: color.darken(fuchsia, 10%), content)
  #let time(content) = text(fill: color.darken(teal, 30%), content)

  - Fully graphical: #alert[no textual] proof language
  
  #pause
  
  - Both #space[spatial] and #time[temporal]:
  #centerFocus[proof #h(5mm) = #h(5mm) #space[gesture] #time[sequence]]

  #pause
  
  - *Different modes* of reasoning with a *single "syntax"*:
  #centerFocus[
    $
    "Click" #h(1cm) &<==> #h(1cm) "introduction/elimination" \
    "Drag-and-Drop" #h(1cm) &<==> #h(1cm) "backward/forward" \
    $
  ]
]

#slide(title: [#sys[coq-actema]])[
  #set align(center)
  #image("images/archi.svg", width: 65%, height: 125%, fit: "stretch")
]


#new-section-slide[Subformula Linking]

#slide(title: [Semantics of drag-and-drop #title-right[@Chaudhuri2013]])[
  #v(-1cm)

  *Idea:* bring matching subformulas through #alert[switch] rules
  
  #{
    set text(size: 18.5pt)
    set math.cases(gap: 0.5em)

    let switch(content) = block(fill: rgb("#eb811b").transparentize(75%), outset: 3pt, content)
    let identity(content) = block(fill: rgb("#5eec33").transparentize(75%), outset: 3pt, content)
    let unit(content) = block(fill: rgb("#aaaaaa").transparentize(75%), outset: 3pt, content)

    $
    #switch[switch] &cases(
      #phantom(step) #conc($#hypo($#select($A$) and B$) #back #switch($B and$) (#select($A$) or C) and D$),
      #step #conc($B and (#hypo($#select($A$) and B$) #back (#select($A$) or C) #switch[$and D$])$),
      #step #conc($B and (#hypo($#select($A$) and B$) #back #select($A$) #switch($or C$)) and D$),
      #step #conc($B and ((#hypo($#select($A$) #switch($and B$)$) #back #select($A$)) or C) and D$),
      #step #conc($B and ((B #limp (#identity($#hypo($#select($A$)$) #back #select($A$)$))) or C) and D$),
    ) \
    
    #identity[identity] &cases(
      #step #conc($B and ((B #unit($#limp top$)) or C) and D$),
    ) \

    #unit[unit elimination] &cases(
      #step #conc($B and (#unit($top or$) C) and D$),
      #step #conc($B #unit($and top$) and D$),
      #step #conc($B and D$),
    ) \
    $
  }
  
  Variant of the *Calculus of Structures* @Guglielmi1999ACO
]

#slide(title: [Linking under quantifiers #title-right[@dnd-tactic]])[
  #only(1)[$ #conc($#hypo($exists y. forall x. R(x,y)$) #back forall x'. exists y'. R(x',y')$) $]
]

#slide(title: [Rewriting equalities])[
]

#slide(title: [Completeness])[
]


#slide(title: [Conclusion])[
  - Quelques features manquantes, mais déjà utilisable
  - Mathis a simplifié l'install -> n'hésitez pas à installer !
  - Bientôt prêt pour évaluation sur des étudiants, voire experts
]


#part-slide[Iconic Manipulations]

#new-section-slide[Symmetric Bubble Calculus]

#slide(title: [The chemical metaphor])[
]

#slide(title: [Adding bubbles])[
]

#slide(title: [Reducing non-determinism])[
]


#new-section-slide[Asymmetric Bubble Calculi]

#slide(title: [Coloring bubbles])[
]

#slide(title: [Red bubbles])[
]

#slide(title: [Blue bubbles])[
]

#slide(title: [Classical vs. Intuitionistic])[
]

#slide(title: [A change of viewpoint])[
]


#new-section-slide[Existential Graphs]

#slide(title: [The three systems of EGs])[
]

#slide(title: [The three icons of Alpha])[
]

#slide(title: [Illative transformations])[
]

#slide(title: [Example: modus ponens])[
]


#new-section-slide[Flowers]

#slide(title: [The scroll])[
]

#slide(title: [The n-ary scroll])[
]

#slide(title: [Blooming])[
]

#slide(title: [Corollaries])[
]

#slide(title: [Gardens])[
]


#new-section-slide[Flower Calculus]

#slide(title: [Iteration and Deiteration])[
]

#slide(title: [Insertion and Deletion])[
]

#slide(title: [Instantiation and Abstraction])[
]

#slide(title: [Case reasoning])[
]

#slide(title: [Scrolling])[
]

#slide(title: [QED])[
]


#new-section-slide[Metatheory: Nature vs. Culture]

#slide(title: [Natural rules])[
]

#slide(title: [Cultural rules])[
]

#slide(title: [Hypothetical provability])[
]

#slide(title: [Cult-elimination])[
]


#new-section-slide[Flower Prover]

#slide(title: [Demo])[
]

#slide(title: [Paradigm])[
]

#slide(title: [Towards Curry-Howard])[
]


#part-slide[Thank you!]


#slide(title: [Bibliography])[
  #set cite(form: none)  
  
  // @Chaudhuri2013
  // #cite(label("DBLP:conf/cade/Chaudhuri21"))
  // @clouston-annotation-free-2013
  // #cite(label("10.1145/3497775.3503692"))
  // @guenot_nested_2013
  // @Guglielmi1999ACO
  
  #bibliography(
    "main.bib",
    style: "chicago-author-date",
  )
]
