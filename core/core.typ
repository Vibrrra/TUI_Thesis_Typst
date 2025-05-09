
// External imports
#import "@preview/subpar:0.2.1"
#import "@preview/physica:0.9.5": *
#import "@preview/glossarium:0.5.4": make-glossary, register-glossary
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#import "@preview/ctheorems:1.1.3": *

// Internal modules
#import "components/titlepage.typ": generate-title-page
#import "components/abstract.typ": generate-abstract-de, generate-abstract-en
#import "components/epigraph.typ": generate-epigraph
#import "components/acknowledgements.typ": generate-acknowledgements
#import "components/abbreviations.typ": abbreviations-page
#import "./utils.typ": *





// Front matter styling rules
#let front-matter(body) = {
    set page(
        numbering: "i",
        footer: context {
            let page-number = here().page()
            let chapters = heading.where(level: 1)
            if query(chapters).any(it => it.location().page() == here().page()) {
                align(
                    center,
                    text(
                        weight: "thin",
                        fill: fill-color-gray,
                        font: "XCharter",
                        size: 10pt,
                        counter(page).display(),
                    ),
                )
            } else {
                none
            }
        },
    )
    counter(page).update(0)
    set heading(numbering: none)
    show heading.where(level: 1): it => {
        it
        v(6%, weak: true)
    }
    body
}

// Main matter styling rules
#let main-matter(author: [], thesis-type: [], print-style: "single-sided", body) = {
    set text(number-type: "old-style")
    set page(
        numbering: "1",
        // show nubmering (footer) when NO header chapter header present
        footer: context {
            line(start: (0% + 0pt, 0% + 0pt), end: (100% + 0pt, 0% + 0pt), stroke: 0.25pt + fill-color-gray)
            let chapters = heading.where(level: 1)
            // if query(chapters).any(it => it.location().page() == here().page()) {
            if false {
                //query(chapters).any(it => it.location().page() == here().page()) {
                align(
                    center,
                    text(
                        weight: "thin",
                        fill: fill-color-gray,
                        font: "XCharter",
                        size: 8pt,
                    )[#grid(
                            columns: (1fr, 1fr, 1fr),
                            [#align(left)[#thesis-type #author]], [], [#align(right)[#counter(page).display()]],
                        )],
                    // [#align(center)[#counter(page).display()]],
                )
            } else {
                [#align(
                        center,
                        text(
                            weight: "thin",
                            fill: fill-color-gray,
                            font: "XCharter",
                            size: 8pt,
                        )[
                            // #grid(
                            //     columns: (1fr, 1fr, 1fr),
                            //     [
                            #align(center)[#thesis-type #author]
                            //     ],
                            //     [],
                            //     [
                            //         #align(right)[#counter(page).display()]
                            //     ],
                            // )
                        ],
                        // [#align(center)[#counter(page).display()]],
                    )] // none
            }
        },
        header: context {
            let page-number = here().page()

            let chapters = heading.where(level: 1)
            let is-start-chapter = query(chapters).any(it => (
                it.location().page() == page-number
            ))
            if is-start-chapter {
                return []
            }
            if not state("content.switch", false).get() and not is-start-chapter {
                return []
            }

            // get current chapter
            let chapters-before = query(chapters.before(here()))
            if chapters-before.len() > 0 {
                let current-chapter = chapters-before.last()

                // Show current chapter on odd pages, current subsection on even
                if print-style == "double-sided" {
                    let (left-text, right-text) = if calc.odd(page-number) {
                        (counter(page).display(), upper(current-chapter.body))
                    } else {
                        (
                            upper(current-chapter.body),
                            counter(page).display(),
                        )
                    }
                }
                let (left-text, right-text) = {
                    (
                        upper(current-chapter.body),
                        counter(page).display(),
                    )
                }

                text(
                    weight: "thin",
                    font: "XCharter",
                    fill: fill-color-gray,
                    size: 8pt,
                    fill-line(left-text, right-text),
                )
            }
        },
    )
    counter(page).update(0)
    counter(heading).update(0)
    set heading(numbering: "1.1")
    show heading.where(level: 1): it => {
        it
        v(12%, weak: true)
    }
    body
}

#let back-matter(body) = {
    set heading(numbering: "A.1.1", supplement: [Appendix])
    counter(heading.where(level: 1)).update(0)
    counter(heading).update(0)
    body
}


#let thesis(
    // Author name
    author: "Author",
    // student id (matrikel nummer)
    matrikel: "42069",
    // Thesis title
    title: [Title],
    // Thesis type: e.g. Master Thesis
    thesis-type: "Thesis",
    // Language
    language: "en",
    // Array of supervisors
    supervisors: (),
    // Date of submission
    submission_date: datetime(year: 1969, month: 4, day: 20),
    // epigraph (optional)
    epigraph: none,
    // Abstract (mandatory)
    abstract-en: [],
    abstract-de: [],
    // Acknkowledgements (optional)
    acknowledgements: none,
    // preface (optional)
    preface: none,
    // bibliography (optional)
    bibliography: none,
    // Display a list of all figures
    figure-index: true,
    // Display a list of all tables
    table-index: true,
    // Display a list of code blocks
    listing-index: true,
    // List of abbreviations
    abbreviations: none,
    // print-style: single-sided - double-sided,
    print-style: "single-sided",
    // your work
    body,
) = {
    show: make-glossary
    // Display short-form abbreviations (smallcaps)
    let abbrs = abbreviations.map(a => {
        a.insert("short", smallcaps(a.short))
        return a
    })
    register-glossary(abbrs)

    show: codly-init.with()
    codly(
        languages: (
            rust: (name: "Rust", icon: "🦀", color: rgb("#CE412B")), // color: rgb("#CE412B")),
        ),
        header: [src/main.rs],
        inset: 0.001cm,
        lang-outset: (x: -5pt, y: 5pt),
    )

    // codly(display-name: false) //, lang-stroke:
    // codly(zebra-fill: none)

    // codly(zebra-fill: none)
    // codly(languages: codly-languages) //, lang-fill: none, lang-stroke: none, lang-radius: 0pt,)
    // codly(display-icon: true)

    // fill-color-gray, lang-radius: 0pt)

    show regex("\d?\dth"): w => {
        // 26th, ...
        let b = w.text.split(regex("th")).join()
        [#b#super([th])]
    }


    show regex("\d?\dst"): w => {
        // 1st
        let b = w.text.split(regex("st")).join()
        [#b#super([st])]
    }

    show regex("\d?\d[nr]d"): w => {
        // 2nd, 3rd, ...
        let s = w.text.split(regex("\d")).last()
        let b = w.text.split(regex("[nr]d")).join()
        [#b#super(s)]
    }

    // If we find in bibentries some ISBN, we add link to it
    show "https://doi.org/": w => {
        // handle DOIs
        [DOI:] + str.from-unicode(160) // 160 A0 nbsp
    }
    show regex("ISBN \d+"): w => {
        let s = w.text.split().last()
        link(
            "https://isbnsearch.org/isbn/" + s,
            w,
        ) // https://isbnsearch.org/isbn/1-891562-35-5
    }

    // Hanging indent for footnote
    show footnote.entry: set par(hanging-indent: 1.5em)

    // General Document specifics
    set text(font: "XCharter", size: 11pt)
    show raw: set text(font: "JetBrains Mono")

    set page(
        paper: "a4",
        margin: (
            bottom: 3cm, //5cm,
            top: 3cm, //42mm,
            left: 45mm, //inside: 45mm,
            right: 33.0mm, //outside: 33.0mm,
        ),
    ) if (print-style == "single-sided")

    set page(
        paper: "a4",
        margin: (
            bottom: 3cm, //5cm,
            top: 3cm, //42mm,
            inside: 45mm,
            outside: 33.0mm,
        ),
    ) if (print-style == "double-sided")

    // --- style paragraphs
    // set par(justify: true)
    set par(
        leading: 0.7em,
        justify: true,
        linebreaks: "optimized",
        spacing: 1.35em,
    )

    set ref(
        supplement: it => context {
            if it.func() == heading {
                if in-appendix.get() {
                    [Appendix]
                } else {
                    [Chapter]
                }
            } else {
                it.supplement
            }
        },
    )

    // heading style
    show heading.where(level: 1): it => {
        state("content.switch").update(false)
        // start chapter headings on even-page number if double-sided
        if print-style == "double-sided" {
            pagebreak(weak: true, to: "even")
        } else {
            pagebreak(weak: true)
        }

        state("content.switch").update(true)
        set text(font: "XCharter", weight: "bold", size: 24pt)

        let heading-number = if heading.numbering == none {
            []
        } else {
            text(
                counter(heading.where(level: 1)).display(),
                number-type: "lining",
                size: 100pt,
            )
        }

        v(16%)
        if heading.numbering != none {
            stack(
                align(left)[#text(weight: "bold", [#heading-number])],
                v(.5em),
                align(left)[#text(weight: "bold", it.body)],
                v(5pt),
                rect(outset: (x: 0pt, y: 0pt), height: 5pt, width: 100%, fill: rgb("0188884e")),
                // move(
                //     polygon(
                //         fill: rgb("0188884e"),
                //         (0pt, 10pt),
                //         (page.width - page.margin.right - page.margin.left, 10pt),
                //         (page.width - page.margin.right - page.margin.left, 10pt),
                //         (page.width - page.margin.right - page.margin.left, 5pt),
                //         (0pt, 5pt),
                //     ),
                //     // (0pt, 0pt),
                // ),
            )
            v(-1.5em)
        } else {
            it.body
        }
    }

    // headings -> no hyphenation
    show heading: set text(
        font: "XCharter",
        fill: fill-color-gray,
        weight: "bold",
        hyphenate: false,
    )

    set page(
        header-ascent: 30%,
        header: context {
            let page-number = here().page()

            let chapters = heading.where(level: 1)
            let is-start-chapter = query(chapters).any(it => (
                it.location().page() == page-number
            ))
            if is-start-chapter {
                return []
            }
            if not state("content.switch", false).get() and not is-start-chapter {
                return
            }

            let chapters-before = query(chapters.before(here()))
            if chapters-before.len() > 0 {
                let current-chapter = chapters-before.last()

                // select new subsection if one starts on this page, otherwise -> last one
                let current-subsection = {
                    let subsections = heading.where(level: 2)
                    let subsections-after = query(subsections.after(here()))

                    if subsections-after.len() > 0 {
                        let next-subsection = subsections-after.first()

                        if next-subsection.location().page() == page-number {
                            (next-subsection)
                        } else {
                            let subsection-before = query(subsections.before(here()))

                            if subsection-before.len() > 0 {
                                (subsection-before.last())
                            } else {
                                none // no subsection in this chapter
                            }
                        }
                    }
                }

                let spacing = h(3pt)
                let colored-slash = text(fill: rgb("#d55757"))
                let subsection-text = if current-subsection != none {
                    let subsection-numbering = current-subsection.nubmering
                    let location = current-subsection.location()
                    let subsection-count = numbering(
                        subsection-numbering,
                        ..counter(heading).at(location),
                    )

                    [#subsection-count #spacing #colored-slash #spacing #current-subsection.body]
                } else {
                    []
                }

                let chapter-text = {
                    let chapter-title = current-chapter.body
                    let chapter-number = counter(heading.where(level: 1)).display()
                    let prefix = if in-appendix.get() {
                        [APPENDIX]
                    } else {
                        [CHAPTER]
                    }

                    [#prefix #chapter-number #spacing #colored-slash #spacing #chapter-title]
                }

                if current-chapter.nubmering != none {
                    let (left-text, right-text) = if calc.odd(page-number) {
                        (counter(page).display(), chapter-text)
                    } else {
                        (
                            subsection-text,
                            counter(page).display(),
                        )
                    }
                    text(
                        weight: "thin",
                        font: "XCharter",
                        size: 8pt,
                        fill-line(upper(left-text), upper(right-text)),
                    )
                }
            }
        },
    )

    // Equation related stuff
    set math.equation(
        numbering: n => {
            set text(font: "XCharter")
            let h1 = counter(heading).get().first()
            numbering("(1.1)", h1, n)
        },
    )

    show math.equation.where(block: true): it => {
        set align(center)
        pad(left: 2em, it)
    }

    set figure(
        numbering: n => {
            let h1 = counter(heading).get().first()
            numbering("1.1", h1, n)
        },
    )


    set figure.caption(separator: [ -- ])
    show figure.caption: c => {
        if c.numbering == none {
            c
        } else {
            text(weight: "bold")[
                #c.supplement #context c.counter.display(c.numbering)
            ]
            c.separator
            c.body
        }
    }

    // Set figure caption to top of figure in case of table
    show figure.where(kind: table): set figure.caption(position: top)

    // Add spacing around figure. Figure inherits Block so we can do the following:
    show figure: set block(inset: (top: 0.5em, bottom: 0.5em))


    // TABLE stuff
    let stroke-color = luma(200)
    let fill-color = luma(91.37%)
    set table(
        inset: 5pt,
        // stroke: (0.5pt + stroke-color),
        stroke: (x, y) => if y == 0 {
            (bottom: 0.7pt + fill-color-gray)
        },
        align: (x, y) => (
            if x > 0 { center } else { left }
        ),
    )

    show table.cell.where(y: 0): strong
    show table.cell.where(y: 0): smallcaps


    show raw.where(block: false): box.with(
        fill: fill-color.darken(0%),
        inset: (x: 3pt, y: 0pt),
        outset: (y: 3pt),
        radius: 2pt,
    )

    // LINKS
    show link: it => {
        it
        if type(it.dest) == str {
            sym.wj
            super(
                box(
                    height: 3.8pt,
                    circle(radius: 1.2pt, stroke: 0.7pt + rgb("#993333")),
                ),
            )
        }
    }

    // -- Definitions and Theorems --
    show: thmrules.with(qed-symbol: $qed$)

    let list-spacing = 18pt
    let nested-list-spacing = 12pt
    set enum(indent: list-spacing, spacing: list-spacing)
    set list(indent: list-spacing, spacing: list-spacing)
    let show-list-enum(it) = {
        // Reduce spacing for nested list
        set enum(indent: nested-list-spacing, spacing: nested-list-spacing)
        set list(indent: nested-list-spacing, spacing: nested-list-spacing)
        // Reduce top and bottom padding for nested list
        let padding-y = {
            if it.spacing == list-spacing {
                v(list-spacing / 2)
            } else {
                v(1pt)
            }
        }
        padding-y
        it
        padding-y
    }
    show enum: it => {
        show-list-enum(it)
    }
    show list: it => {
        show-list-enum(it)
    }


    // FRONT MATTER
    generate-title-page(
        title: title,
        author: author,
        matrikel: matrikel,
        supervisors: supervisors,
        submission_date: submission_date,
        language: language,
        thesis-type: thesis-type,
    )

    show: front-matter

    pagebreak() // Insert a
    if print-style == "double-sided" {
        pagebreak() // blank page
    }

    generate-epigraph()[#epigraph]
    generate-abstract-de()[#abstract-de]
    generate-abstract-en()[#abstract-en]
    generate-acknowledgements()[#acknowledgements]

    // Outline
    context {
        // for convenience
        let fig-t(kind) = figure.where(kind: kind)

        // `in-outline`: short caption in list of figures
        show outline: it => {
            in-outline.update(true)

            // show table of contents, list of figures, list of tables, etc. in the table of contents
            set heading(outlined: true)
            it
            in-outline.update(false)
        }

        // Increase distance between dots on all outline fill
        set outline.entry(fill: box(width: 1fr, repeat([#h(2.5pt) . #h(2.5pt)])))

        pagebreak()

        // Padding for outline entries
        let entry-spacing-left = 0.25em
        let entry-spacing-right = 22pt

        [
            #show outline.entry: it => context {
                let page-number-spacing = (
                    entry-spacing-right - measure(it.page()).width
                )
                link(
                    it.element.location(),
                    it.indented(
                        it.prefix() + h(entry-spacing-left),
                        it.body()
                            + h(entry-spacing-left)
                            + box(width: 1fr, it.fill)
                            + h(page-number-spacing)
                            + it.page(),
                    ),
                )
            }

            #show outline.entry.where(level: 1): it => {
                set text(weight: "bold")
                set block(above: 1.5em)
                link(
                    it.element.location(),
                    it.indented(
                        it.prefix(),
                        it.body() + box(width: 1fr, none) + it.page(),
                    ),
                )
            }

            #outline(title: "Contents")
        ]

        show outline.entry: it => context {
            let prefix = {
                show "Figure": ""
                show "Table": ""
                show "Listing": ""
                set text(weight: "bold")
                it.prefix()
            }

            // calculate relatiev spacing, to line up fill regardless of page number width
            let page-number-spacing = entry-spacing-right - measure(it.page()).width
            link(
                it.element.location(),
                it.indented(
                    prefix + h(entry-spacing-left),
                    it.body() + h(entry-spacing-left) + box(width: 1fr, it.fill) + h(page-number-spacing) + it.page(),
                ),
            )
        }

        // optional outlines
        if figure-index {
            outline(title: "List of Figures", target: fig-t(image))
        }

        if table-index {
            outline(title: "List of Tables", target: fig-t(table))
        }
        if listing-index {
            outline(title: "List of Listings (Code Blocks)", target: fig-t(raw))
        }
    }

    if abbreviations != none {
        abbreviations-page(abbreviations)
    }

    // MAIN MATTER
    // set main-matter(author: author)
    show: main-matter.with(author: author, thesis-type: thesis-type)
    body


    // BACK MATTER
    show: back-matter
    // set text(font: "Times New Roman", size: 12pt)

    if bibliography != none {
        pagebreak()
        // show std-bibliography: set text(0.95em)
        show std-bibliography: set text(12pt)
        // Use default paragraph properties for bibliography.
        show std-bibliography: set par(
            leading: 0.65em,
            justify: false,
            linebreaks: auto,
        )
        bibliography
    }
}




// single-sided print
