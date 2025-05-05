#let generate-epigraph(body) = {
  page(
    numbering: none,
    align(right + bottom)[
      #body
    ],
  )
}