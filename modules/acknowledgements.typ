#let generate-acknowledgements(body) = {
  pagebreak(weak: true, to: "even")
  align(left)[
    = Acknowledgements
    #v(1em)
    #body
  ]
}