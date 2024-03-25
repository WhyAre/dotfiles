#import "@preview/showybox:2.0.1": showybox

#let template(doc) = {
  set par(
    justify: true,
  )
  set page(
    margin: auto,
  )
  set heading(numbering: "1.")
  set text(
    font: "Libertinus Sans"
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


#let trans(input) = {
  $input^T$
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

#let bigo = math.cal("O")

#let ve(val) = {
  $accent(#val, arrow)$
}
