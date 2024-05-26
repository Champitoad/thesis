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
  #image("../images/archi.png", width: 65%, height: 125%, fit: "stretch")
]
