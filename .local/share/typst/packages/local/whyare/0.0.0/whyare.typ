#import "@preview/showybox:2.0.4": showybox
#import "@preview/zebraw:0.5.5": *

// For usage in math mode
#let raw1(content) = raw(content)
#let text1(content) = text(font: "DM Sans", content)
#let zebraw = zebraw.with(lang: false, indentation: 4, numbering: false)

// Boxes
#let section-box(title: [Title], color: black, content) = box(inset: (left: 0.25em), showybox(
  title: title,
  title-style: (
    color: white,
    boxed-style: (
      anchor: (x: left, y: horizon),
      offset: (x: -1.25em),
      radius: 0pt,
    ),
  ),
  frame: (
    title-color: color,
    border-color: color,
    thickness: 1pt,
    radius: 0pt,
  ),
  content,
))

#let admonition(title: [], color: black, content) = showybox(
  title-style: (
    sep-thickness: 0pt,
  ),
  frame: (
    body-color: white,
    border-color: color,
    thickness: (left: 2pt),
    radius: 0pt,
  ),
  [#text(fill: color, strong(title)) #h(1em) #content],
)

#let note(content) = admonition(
  title: [#emoji.book.blue Note],
  color: rgb("#015ccd"),
  content,
)

#let tip(content) = admonition(
  title: [#emoji.sparkles Tip],
  color: rgb("#10712b"),
  content,
)

#let danger(content) = admonition(
  title: [#emoji.sign.stop Danger],
  color: rgb("#c01722"),
  content,
)

#let warning(content) = admonition(
  title: [#emoji.warning Warning],
  color: rgb("#915f00"),
  content,
)

#let impt(content) = admonition(
  title: [#emoji.excl Important],
  color: rgb("#7544d1"),
  content,
)

#let notes-template(content) = {
  set page(margin: 1in)

  // Justify Text
  set par(justify: true)
  set text(hyphenate: false)
  show raw.where(block: true): set par(justify: false)

  show link: set text(fill: blue)
  // Gray box around inline code
  show raw.where(block: false): box.with(
    fill: gray.lighten(60%),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
  )

  set heading(numbering: "1.1  ")

  // Font
  set text(font: ("New Computer Modern Sans", "New Computer Modern"))
  show math.equation: set text(font: ("Lete Sans Math", "New Computer Modern Math"))
  show raw: set text(font: ("0xProto NL", "DejaVu Sans Mono"))

  content
}

