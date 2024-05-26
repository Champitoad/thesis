#new-section-slide[Context]

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
