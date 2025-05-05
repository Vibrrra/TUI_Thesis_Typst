#let generate-abstract-de(body) = {
  pagebreak(weak: true, to: "even")
  align(left)[
    = Kurzfassung
    #v(1em)
    #body
  ]
} 
#let generate-abstract-en(body) = {
  pagebreak(weak: true, to: "even")
  align(left)[
    = Abstract
    #v(1em)
    #body
  ]
} 