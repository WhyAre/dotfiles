#import "@preview/showybox:2.0.4": showybox
#import "@preview/zebraw:0.5.5": *

#let ans(content) = [
  #set text(fill: red)
  #content
]

#let callout(colour: blue, title, content) = showybox(
  title-style: (
    weight: "bold",
    color: colour.darken(40%),
    sep-thickness: 0pt,
    align: left,
  ),
  frame: (
    title-color: colour.lighten(95%),
    body-color: colour.lighten(95%),
    border-color: colour.darken(40%),
    thickness: (left: 2pt),
    radius: 0pt,
  ),
  title: title,
  content,
)

#let info(title: "Info", content) = callout(colour: blue, title, content)

#let question(title: "Question", content) = callout(colour: green, title, content)

#let tip(title: "Tip", content) = callout(colour: yellow, title, content)

#let impt(title: "Important", content) = callout(colour: purple, title, content)

#let notes-template(content) = {
  // Font
  set text(font: "Pennstander", weight: "light")
  show math.equation: set text(font: "Pennstander Math", weight: "light")
  show raw: set text(font: "Codelia", size: 1.2em)

  // Justify text
  set par(justify: true)
  set text(hyphenate: false)
  show raw.where(block: true): set par(justify: false)

  // Heading
  set heading(numbering: "1.1  ")
  show heading: it => block(above: 2em, below: 1em, it)
  show heading: it => if it.level >= 4 { block(above: 2em, below: 1em, it.body) } else { it }

  // Par spacing
  set par(spacing: 1.5em, leading: 1em)

  // Remove vertical lines in table
  set table(stroke: (y: none))

  // Set link to blue
  show link: set text(fill: blue)

  // Code blocks
  show: zebraw
  show raw.where(block: false): it => box(
    fill: gray.lighten(80%),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 3pt,
    it,
  )

  content
}
