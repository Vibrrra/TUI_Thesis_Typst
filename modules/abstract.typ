#let generate-abstract(body) = {
  pagebreak(weak: true, to: "even")
  align(left)[
    = Abstract
    #v(1em)
    #body
  ]
} 