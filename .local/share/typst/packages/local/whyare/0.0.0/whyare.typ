#import "@preview/showybox:2.0.4"
#import "@preview/gentle-clues:1.2.0": *

#let notes-template(content) = {
  set page(margin: 1in)

  // Justify Text
  set par(justify: true)
  set text(hyphenate: false)
  show raw.where(block: true): set par(justify: false)

  // Font
  set text(font: ("DM Sans", "New Computer Modern"))
  show math.equation: set text(font: ("Lete Sans Math", "New Computer Modern Math"))
  show raw: set text(font: "DejaVu Sans Mono")

  // Styling links
  show link: content => box[
    #set text(fill: blue)
    #underline(content)
  ]

  content
}
