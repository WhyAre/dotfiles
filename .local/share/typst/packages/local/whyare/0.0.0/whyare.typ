#import "@preview/theorion:0.3.3": *
#import cosmos.clouds: *
#import "@preview/showybox:2.0.4"
#import "@preview/gentle-clues:1.2.0": *

#let template(content) = {
  set page(margin: 1in)

  // Justify Text
  set par(justify: true)
  set text(hyphenate: false)
  show raw.where(block: true): set par(justify: false)

  // Font
  set text(font: "Inter")
  show math.equation: set text(font: "Lete Sans Math")
  show raw: set text(font: "MonoLisa")

  // Styling links
  show link: content => box[
    #set text(fill: blue)
    #underline(content)
  ]

  content
}

// #let question(content) = {
//   set heading(outlined: false)
//   set enum(numbering: "1.")

//   // Fonts
//   set text(font: "Andika")
//   show raw: set text(font: "Codelia")

//   // #block(
//   //   inset: 1em,
//   //   stroke: 1pt + black,
//   //   width: 100%,
//   //   content,
//   // )
//   content
// }

#let attempt(content) = {
  set heading(outlined: false)
  set enum(numbering: "1.")

  // Fonts
  set text(font: "Andika")
  show raw: set text(font: "Codelia")

  // #block(
  //   inset: 1em,
  //   stroke: 1pt + black,
  //   width: 100%,
  //   content,
  // )
  content
}
