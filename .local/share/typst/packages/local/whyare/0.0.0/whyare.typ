#import "@preview/showybox:2.0.1": showybox

#let template(doc) = {
  set par(
    justify: true,
  )
  show raw.where(block: true): set par(justify: false)
  set page(
    margin: auto,
  )
  set heading(numbering: (..n) => {
    if n.pos().len() < 4 {
      numbering("1.1", ..n)
    }
  })
  set text(
    font: "Libertinus Sans",
    hyphenate: false,
  )
  show math.equation: set text(
    font: "Libertinus Math"
  )

  doc
}

#let header(content) = {
  v(5pt)
  [*#content*]
}



#let defn(title: "", body) = {
  let header = "Definition"
  if title.len() > 0 { 
  header += ": " + title
}
  showybox(
    title: header,
    frame: (
    title-color: blue,
  ),
    body
  )
}

#let theorem(body, title: "Theorem") = {
  showybox(
    title: title,
    body
  )
}

// Math Mode Problems
#let lamb=sym.lambda

#let ub = math.underbrace
#let ob = math.overbrace

#let ve(val) = {
  $bold(val)$
}

#let iff = sym.arrow.l.r.long.double
#let imp = sym.arrow.r.long.double

#let inv(val) = {
  $val^(-1)$
}

#let trans(input) = {
  $input^T$
}
