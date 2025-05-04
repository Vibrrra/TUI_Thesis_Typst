// External imports
#import "@preview/subpar:0.2.1"
#import "@preview/physica:0.9.5": *
#import "@preview/glossarium:0.5.4": make-glossary, register-glossary
#import "@preview/codly:1.2.0": *
#import "@preview/ctheorems:1.1.3": *

// Internal modules
#import "modules/titlepage.typ" : generate-title-page,
#import "modules/abstract.typ" : generate-abstract,
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


#let thesis(
  // Author name
  author: "Author",
  // student id (matrikel nummer)
  matrikel: "42069",
  // Thesis title
  title: [Title],
  // Thesis type: e.g. Master Thesis  
  thesis-type: "Thesis",
  // Array of supervisors
  supervisors: (),
  // Date of submission
  submission_date: datetime(year: 1969, month: 4, day: 20),
  // epigraph (optional)
  epigraph: none,
  // Abstract (mandatory)
  abstract:  [],
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

  // FRONT MATTER
  generate-title-page(
    title: title, 
    author: author, 
    matrikel: matrikel, 
    supervisors: supervisors, 
    submission_date: submission_date
  )

  show: front-matter
  
  generate-epigraph()[#epigraph]
  generate-abstract()[#abstract]
  generate-acknowledgements()[#acknowledgements]
  

  // MAIN MATTER

  // BACK MATTER
  set text(font: "Times New Roman", size: 12pt)
}


