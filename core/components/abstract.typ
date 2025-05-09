#let generate-abstract-de(body) = {
    pagebreak(weak: true, to: "odd")
    align(left)[
        = Kurzfassung
        #v(1em)
        #body
    ]
}
#let generate-abstract-en(body) = {
    align(left)[
        = Abstract
        #v(1em)
        #body
    ]
    pagebreak(weak: true, to: "odd")
}
