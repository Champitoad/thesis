#import "utils.typ": *

/********** Symbols **********/

#let thus = [
  #sym.arrow.curve
  #h(5pt)
]

#let limp = $=>$
#let ent = math.class("relation", sym.tack.r)
#let kent = math.class("relation", sym.tack.r.double)
#let csup = math.class("relation", "⫐")

#let back = math.class("relation", text(font: "STIX Two Math", "⧁"))
#let forw = math.class("relation", text(font: "STIX Two Math", "⊛"))

#let step = spar(spacing: 3mm, math.class("relation", sym.arrow.r))
#let steps = spar(spacing: 3mm, math.class("relation", math.attach(sym.arrow.r, tr: $*$)))

#let eqdef = math.class("relation", sym.eq.delta)
#let simeq = scale(x: 150%, y: 150%, reflow: true, math.class("relation", sym.tilde.eq))
#let eqq = math.class("relation", sym.colon.double.eq)

#let nature = text(font: "STIX Two Math", size: 26pt, "❀")
#let culture = text(font: "STIX Two Math", size: 26pt, "✂")

#let hole = sym.square


/********** Operations **********/

#let select(content) = {
  math.underline(content)
}

#let cfill(ctx, content) = {
  ctx
  h(1pt)
  context {
    rect(inset: 5pt, stroke: text.fill, content)
  }
}

#let subst(vt, vu, vx) = {
  $vt[vu\/vx]$
}

#let interp(x) = $bracket.l.double #x bracket.r.double$


/********** Notions **********/

// Proof system
#let sys(name) = text(font: "Fira Code", name)

// Inference rule name
#let irule(name) = text(font: "Libertinus Sans", name)


/********** Misc **********/

#let hypo_color = rgb("#007bff")
#let conc_color = rgb("#dc3545")
#let hypo(content) = text(fill: hypo_color, content)
#let conc(content) = text(fill: conc_color, content)