#import "@preview/showybox:2.0.4": showybox
#import "@preview/zebraw:0.5.5": *

// Clues
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
    body-color: color.lighten(95%),
    border-color: color,
    thickness: (left: 2pt),
    radius: 0pt,
  ),
  [#text(strong(title)) #h(1em) #content],
)

#let tip(content) = admonition(
  title: [#emoji.lightbulb Tip],
  color: yellow,
  content,
)


#let danger(content) = admonition(
  title: [#emoji.excl Danger],
  color: red,
  content,
)


#let notes-template(content) = {
  set page(margin: 1in)

  // For usage in math mode
  let raw1(content) = raw(content)
  let text1(content) = text(font: "DM Sans", content)

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

  let zebraw = zebraw.with(lang: false, indentation: 4, numbering: false)
  set heading(numbering: "1.1  ")

  // Font
  set text(font: ("New Computer Modern Sans", "New Computer Modern"))
  show math.equation: set text(font: ("Lete Sans Math", "New Computer Modern Math"))
  show raw: set text(font: ("0xProto NL", "DejaVu Sans Mono"))

  content
}

