#import "@preview/polylux:0.3.1": *
#import "@preview/xarrow:0.3.0": xarrow
#import "@preview/curryst:0.3.0": rule, proof-tree
#import "@preview/fletcher:0.4.5" as fletcher: diagram, node, edge 
#import "@preview/ctheorems:1.1.2": *

#import "@local/svg-emoji:0.1.0": setup-emoji

#import "theme/metropolis.typ": *

#import "flower.typ"
#import "eg.typ": *
#import "notations.typ": *
#import "utils.typ": *


/********** DEFINITIONS **********/


/*** Theorems***/

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


/*** Inference rules ***/

// Finetune layout of inference rules
#let proof-tree = proof-tree.with(prem-min-spacing: 1cm)


/*** Slides ***/

// Slide for a part
#let part-slide(title) = focus-slide[
  #set text(size: 40pt, weight: 400)
  #title
]


/*** Useful shortcuts ***/

#let mt = spar($|->$)
#let to = spar($->$)
#let xrule(content) = spar(spacing: 1em, xarrow(sym: sym.arrow.r, irule(content)))


/*** Misc ***/

#let squareFocus(content) = rect(inset: 15pt, content)

#let centerFocus(content, size: 22pt) = [
  #set align(center)
  #set text(size)
  #v(1em)
  #content
  #v(1em)
]

#let titleWord(content) = underline(stroke: red + 2pt, offset: 6pt, content)


/********** BIBLIOGRAPHY **********/

#let biblio = bibliography(
  "main.bib",
  style: "chicago-author-date",
)


/********** TEMPLATE ENTRY POINT **********/



#let defense-template(title, body) = {
  show: metropolis-theme.with(
    footer: [
      #set text(size: 13pt, fill: rgb("#949494"))
      Deep Inference for Graphical Theorem Proving
    ]
  )

  // Font config
  set text(font: "Fira Sans", weight: "light", size: 20pt)
  show math.equation: set text(font: "Fira Math", weight: "light")
  set strong(delta: 100)
  show link: underline.with(offset: 3pt)
  show: setup-emoji

  // Layout config
  set par(justify: true)
  set list(spacing: 1.5em)

  // Theorem and definition environments
  show: thmrules
 
  body

  slide(title: [Bibliography])[
      #set cite(form: none)  
      
    // @Chaudhuri2013
    // #cite(label("DBLP:conf/cade/Chaudhuri21"))
    // @clouston-annotation-free-2013
    // #cite(label("10.1145/3497775.3503692"))
    // @guenot_nested_2013
    // @Guglielmi1999ACO
    
    #biblio
  ]
}