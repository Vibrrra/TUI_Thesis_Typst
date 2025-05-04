#let generate-acknowledgements(body) = {
  pagebreak(weak: true, to: "even")
  align(left)[
    = Acknkowledgements
    #v(1em)
    #body
  ]
}