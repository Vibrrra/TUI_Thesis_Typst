// External imports
#import "@preview/subpar:0.2.1"
#import "@preview/physica:0.9.5": *
#import "@preview/glossarium:0.5.4": make-glossary, register-glossary
#import "@preview/codly:1.2.0": *
#import "@preview/ctheorems:1.1.3": *

// Internal modules
#import "modules/titlepage.typ" : generate-title-page,
#import "modules/abstract.typ" : generate-abstract-de, generate-abstract-en
#import "modules/epigraph.typ" : generate-epigraph,
#import "modules/acknowledgements.typ" : generate-acknowledgements,



// Helpers
#let fill-line(left-text, right-text) = [#left-text #h(1fr) #right-text]


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
            // font: "Times New Roman",
            size: 18pt,
            counter(page).display(),
          ),
        )
      } else {
        none
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
        let (left-text, right-text) = if calc.odd(page-number) {
          (counter(page).display(), upper(current-chapter.body))
        } else {
          (
            upper(current-chapter.body),
            counter(page).display(),
          )
        }
        text(
          weight: "thin",
          font:"Times New Roman",
          size: 8pt,
          fill-line(left-text, right-text)
        )
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
#let main-matter(body) = {
  set text(number-type: "old-style")
  set page(
    numbering: "1",
    // show nubmering (footer) when NO header chapter header present
    footer: context {
      let chapters = heading.where(level: 1)
      if query(chapters).any(it => it.location().page() == here().page()) {
        align(
          center,
          text(
            weight: "thin",
            font: "Times New Roman",
            size: 8pt,
            counter(page).display()  
          ),
        )
      } else {
        none
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
  set heading(numbering: "A.1.1", supplement:  [Appendix])
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
  abstract-en:  [],
  abstract-de:  [],

  // Acknkowledgements (optional)
  acknowledgements: none,
  // preface (optional)
  preface: none,
  // bibliography (optional)
  bibliography: none,
  // Display a list of all figures
  figure-list: true,
  // Display a list of all tables
  table-list: true,
  // List of abbreviations
  abbreviations: none,
  // your work
  body
) = {


  set page(
    paper: "a4",
  )

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
    // start chapter headings on odd-page
    pagebreak(weak: true, to: "odd")
    state("content.switch").update(true)
    set text(font: "Sans Serif Collection", weight: "bold", size: 24pt)
  
    let heading-number = if heading.numbering == none {
      []
    } else {
      text(
        counter(heading.where(level: 1)).display(),
        number-type: "lining",
        size: 100pt,
      )
    }

    // resetting figure numbering on every chapter start
    for kind in (image, table, raw) {
      counter(figure.where(kind: kind)).update(0)
      counter(math.equation).update(0)
    }

    v(16%)
    if heading.numbering != none {
      // stack(
      //   dir: ltr,
      //   move(
      //     dy: 54pt,
      //     polygon(
      //       fill: rgb("#b1f2eb"),
      //       stroke: rgb("#b1f2eb"),
      //       (0pt, 0pt),
      //       (5pt, 0pt),
      //       (40pt, -90pt),
      //       (35pt, -90pt),
      //     ),
      //   ),
      //   heading-number,
      // )
      // place(dy: -80pt, dx: -20pt, right, [#text(heading-number, fill: rgb("#0188884e"))])
      // v(1.0em)
      stack(
        align(left)[#text(weight: "bold", [#heading-number])],
        v(.5em),
        align(left)[#text(weight: "bold", it.body)],
        move(
          polygon(
            fill: rgb("0188884e"),
            (0pt, 10pt),
            (460pt, 10pt),
            (460pt, 5pt),
            (0pt, 5pt),
          )
        )
      )
      v(-1.5em)
    } else {
      it.body
    }
  }

  // headings -> no hyphenation
  show heading: set text(
    font: "Times New Roman",
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
            font: "Times New Roman",
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
      set text(font: ("XCharter"))
      let h1 = counter(heading).get().first()
      numbering("(1.1", h1, n)  
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

 
  set figure.caption(separator:  [ -- ])
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
  show link: it => {
    it
    // NOTE: Avoid linebreak before link indicators by using a word-joiner unicode character.
    if type(it.dest) == str {
      sym.wj
      h(1.6pt)
      sym.wj
      super(
        box(
          height: 3.8pt,
          circle(radius: 1.2pt, stroke: 0.7pt + rgb("#993333")),
        ),
      )
    }
  }

  // TABLE stuff
  let stroke-color = luma(200)
  let fill-color = luma(90.59%)
  set table(
    inset: 7pt,
    stroke: (0.5pt + stroke-color),
  )

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
          ejght: 3.8pt,
          circle(radius: 1.2pt, stroke: 0.7pt + rgb("#993333"))
        )
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
  )

  show: front-matter
  
  generate-epigraph()[#epigraph]
  generate-abstract-de()[#abstract-de]
  generate-abstract-en()[#abstract-en]
  generate-acknowledgements()[#acknowledgements]
  

  // MAIN MATTER
  show: main-matter
  body


  // BACK MATTER
  set text(font: "Times New Roman", size: 12pt)
}


