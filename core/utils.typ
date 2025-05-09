// This file contains utility functions and variables used throughout the document.

// Colors
#let fill-color-gray = rgb("#212427")
#let box-color = rgb("#b3d0e7")

// convenience
#let std-bibliography = bibliography

// state variables
#let in-appendix = state("in-appendix", false)
#let in-outline = state("in-outline", false)

// generating short and long titles
// useful for the table of contents
#let flex-caption(long, short) = context if in-outline.get() { short } else { long }

// Helpers
#let fill-line(left-text, right-text) = [#left-text #h(1fr) #right-text]

// Helper to create a code block with a filename
#let code-block(filename, content) = raw(content, block: true, lang: filename.split(".").at(-1))

// CSV Table formatting
#let csv-table(
    tabledata: "",
    columns: 1,
    header-row: rgb(255, 231, 230),
    even-row: rgb(255, 255, 255),
    odd-row: rgb(228, 234, 250),
) = {
    let tableheadings = tabledata.first()
    let data = tabledata.slice(1).flatten()
    table(
        columns: columns, fill: (_, row) => if row == 0 {
            header-row // color for header row
        } else if calc.odd(row) {
            odd-row // each other row colored
        } else {
            even-row
        }, align: (col, row) => if row == 0 { center } else {
            left
        }, ..tableheadings.map(x => [*#x*]), // bold headings
        ..data,
    )
}






// TeX and LaTeX logos
#let TeX = {
    set text(font: "New Computer Modern", weight: "regular")
    box(
        width: 1.7em,
        {
            [T]
            place(top, dx: 0.56em, dy: 0.22em)[E]
            place(top, dx: 1.1em)[X]
        },
    )
}

#let LaTeX = {
    set text(font: "New Computer Modern", weight: "regular")
    box(
        width: 2.55em,
        {
            [L]
            place(top, dx: 0.3em, text(size: 0.7em)[A])
            place(top, dx: 0.7em)[#TeX]
        },
    )
}

#let BibTeX = {
    set text(font: "New Computer Modern", weight: "regular")
    box(
        width: 3.4em,
        {
            [Bib]
            place(top, dx: 1.5em)[#TeX]
        },
    )
}
