#import "../defense-template.typ": *

#new-section-slide[Semantics of Drag-and-Drop]

#let switch(content) = box(fill: rgb("#eb811b").transparentize(75%), outset: 3pt, content)
#let inst(content) = box(fill: rgb("#ff5fe4").transparentize(75%), outset: 3pt, content)
#let identity(content) = box(fill: rgb("#5eec33").transparentize(75%), outset: 3pt, content)
#let unit(content) = box(fill: rgb("#aaaaaa").transparentize(75%), outset: 3pt, content)

#slide(title: [Subformula Linking #title-right[@Chaudhuri2013]])[
  #v(-1cm)

  *Idea:* bring matching subformulas through #alert[switch] rules
  
  #{
    set text(size: 16.75pt)
    set math.cases(gap: 0.5em)
  
    let s2 = alternatives-match((
      "-2": $#hypo($#select($A$)$) #back A$,
      "3-": identity($#hypo($#select($A$)$) #back A$)
    ))

    let s3 = alternatives-match((
      "-3": $#limp top$,
      "4-": unit($#limp top$)
    ))
  
    $
    #only(1)[$
      &#phantom(step) quad #conc($#hypo($#select($A$) and B$) #back B and (#select($A$) or C) and D$)
    $] \

    #uncover("2-")[$
    #switch[switch] &cases(
      #phantom(step) #conc($#hypo($#select($A$) and B$) #back #switch($B and$) (#select($A$) or C) and D$),
      #step #conc($B and (#hypo($#select($A$) and B$) #back (#select($A$) or C) #switch[$and D$])$),
      #step #conc($B and (#hypo($#select($A$) and B$) #back #select($A$) #switch($or C$)) and D$),
      #step #conc($B and ((#hypo($#select($A$) #switch($and B$)$) #back #select($A$)) or C) and D$),
      #step #conc($B and ((B #limp #s2) or C) and D$),
    ) $] \
    
    #uncover("3-")[$
    #identity[identity] &cases(
      #step #conc($B and ((B #s3) or C) and D$),
    ) $] \

    #uncover("4-")[$
    #unit[unit elimination] &cases(
      #step #conc($B and (#unit($top or$) C) and D$),
      #step #conc($B #unit($and top$) and D$),
      #step #conc($B and D$),
    ) $]
    $
  }
  
  #uncover(5)[
    Variant of the *Calculus of Structures* @Guglielmi1999ACO
  ]
]

#slide(title: [Linking under quantifiers #title-right[@dnd-tactic]])[
  #set text(size: 19pt)
  
  #v(-2em)

  #side-by-side(columns: (2fr, 1fr))[
    #uncover("2-")[
      - #alert[Unify] linked subformulas
    ]
    #uncover("3-5,7")[
      - *Check* for $forall exists$ #alert[dependency cycles]
    ]
    #uncover("4-5")[
      - #switch[*Switch*] uninstantiated quantifiers
    ]
    #uncover("5")[
      - #inst[*Instantiate*] unified variables
    ]

    #let ex1 = {
      alternatives-match((
        "1-3,6-": {
          $exists y.$
        },
        "4-5": {
          switch($exists y.$)
        }
      ))
    }
    #let ex2 = {
      alternatives-match((
        "4": {
          $exists b.$
        },
        "5": {
          inst($exists b.$)
        }
      ))
    }
    
    #grid(
      columns: (auto),
      align: left,
      inset: 8pt,
      alternatives-match((
        "1-5": [$#phantom(step) #conc($#hypo($#ex1 forall x. #select($R(x,y)$)$) #back forall a. exists b. #select($R(a,b)$)$)$],
        "6-":  [$#phantom(step) #conc($#hypo($forall a. exists b. #select($R(a,b)$)$) #back exists y. forall x. #select($R(x,y)$)$)$],
      )),
      uncover("4-5")[$#step #conc($#conc($forall y. (#hypo($forall x. #select($R(x,y)$)$) #back #switch($forall a.$) exists b. #select($R(a,b)$))$)$)$],
      uncover("4-5")[$
        #step #conc($#conc($forall y. forall a. (#hypo($forall x. #select($R(x,y)$)$) #back #ex2 #select($R(a,b)$))$)$)
      $],
      uncover("5")[$#step #conc($#conc($forall y. forall a. (#hypo($#inst($forall x.$) #select($R(x,y)$)$) #back #select($R(a,y)$))$)$)$],
      uncover("5")[$#step #conc($#conc($forall y. forall a. (#identity[$#hypo($#select($R(a,y)$)$) #back #select($R(a,y)$)$])$)$)$],
      uncover("5")[$#steps #conc($top$)$],
    )
  ][
    #alternatives-fn(start: 2, count: 6, subslide => {
      let color = {
        if (subslide >= 3 and subslide < 6) { green }
        else if (subslide >= 3 and subslide > 6) { red }
        else { auto }
      }
      set text(fill: color) if (subslide >= 3 and subslide != 6)
      let edge = edge.with(stroke: color)

      grid(
        columns: (auto),
        inset: 1cm,
        align: center,
        {
          let (rmap, lmap) = if subslide < 6 { ("|->", "<-|") } else { ("<-|", "|->") }
          let (rdep, ldep) = {
              (edge("d", "->", bend: -40deg),
               edge("u", "->", bend: -40deg))
          }
          let (rdep, ldep) = {
            if subslide > 6 { (rdep, ldep) }
            else {(phantom(ldep), phantom(rdep))}
          }

          diagram($
            x edge(#rmap) #rdep & a \
            y edge(#lmap) & b #ldep \
          $)
        },
        uncover("3-")[
          #text(size: 40pt,
            if subslide < 6 { sym.checkmark }
            else if subslide == 6 { phantom(sym.times) }
            else { sym.times }
          )
        ]
      )
    })
  ]
]

#slide(title: [Rewriting equalities #title-right[@dnd-tactic]])[
  #set text(size: 19pt)

  #align(center)[
    Add 4 rules $==>$ #sys[#alert[rewrite]] tactic for free!
  ]
  $
  #conc($#hypo($#select($t$) = u$) #back A$) quad &-> quad #conc($#subst($A$, $u$, $t$)$)
  wide wide
  #conc($#hypo($t = #select($u$)$) #back A$) quad &-> quad #conc($#subst($A$, $t$, $u$)$) \
  #hypo($#hypo($#select($t$) = u$) #forw A$) quad &-> quad #hypo($#subst($A$, $u$, $t$)$)
  wide wide
  #hypo($#hypo($t = #select($u$)$) #forw A$) quad &-> quad #hypo($#subst($A$, $t$, $u$)$) \
  $
  #v(1em)

  #pause

  #alert[Compositional] with semantics of *connectives*:
  
  - *Quantifiers:* rewrite modulo _unification_
  - *Implication:* _conditional_ rewrite
  - *Arbitrary* combinations are possible:
  
  $
  &#conc($#hypo($forall x. x eq.not 0 #limp #select($f(x)$) = g(x)$) #back exists y. A(#select($f(y)$)) or B(y)$) \
  #steps &#conc($exists y. (y eq.not 0 and A(g(y))) or B(y)$)
  $
]

#slide(title: [Completeness])[
  Add the following rules:
  #v(0.5em)

  - #irule[Init] $quad conc(cfill(C^+, A limp B)) -> conc(cfill(C^+, A back B)) quad hypo(cfill(C^-, A and B)) -> hypo(cfill(C^-, A forw B))$

  - #irule[Release] $quad conc(cfill(C^+, A back B)) -> conc(cfill(C^+, A limp B)) quad hypo(cfill(C^-, A forw B)) -> hypo(cfill(C^-, A and B))$
  
  - #irule[Contraction] $quad hypo(cfill(C^-, A)) -> hypo(cfill(C^-, A and A))$
  
  #theorem("Completeness")[
    If $Gamma ent A$ is provable in sequent calculus, then
    $ and.big Gamma limp A steps top $
  ]
]

#slide(title: [Conclusion])[
  - #sys[*coq-actema*] still in development, but _already usable_ \
    #thus follow install instructions on #link("https://github.com/Champitoad/coq-actema")[GitHub]!
  
  - Based on the solid proof theory of *subformula linking*

  - Next step: exposure to _real users_

    - *Beginners/students:* introductory logic/proof assistants course
    - *Experts:* real maths codebases
]