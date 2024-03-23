#let template(doc) = {
  set par(
    justify: true,
  )
  set page(
    margin: auto,
  )
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
