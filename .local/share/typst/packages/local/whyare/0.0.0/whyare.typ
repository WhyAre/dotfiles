#import "@preview/showybox:2.0.1": showybox

#let template(doc) = {
  set par(
    justify: true,
  )
  show raw.where(block: true): set par(justify: false)
  set page(
    margin: auto,
  )
  // set heading(numbering: (..n) => {
  //   if n.pos().len() < 4 {
  //     numbering("1.1", ..n)
  //   }
  // })
  set text(
    hyphenate: false,
  )
  doc
}

#let iff = sym.arrow.l.r.long.double
#let imp = sym.arrow.r.long.double
