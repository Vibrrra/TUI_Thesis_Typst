// #import "template/thesis.typ" : thesis
// #import "utils/global.typ": thesis, LaTeX
#import "@local/tui-thesis-typst:0.8.0": thesis, LaTeXLogo, BibTeXLogo
#import "abbreviations.typ": abbreviations-list

#let title = [
    This is a very long and unnecessarily complicated title for your  absolutely incredible thesis made with Typst - The best #LaTeXLogo alternative with #BibTeXLogo\-support
    
    // This is a very long title for an absolutely incredible thesis - not many people can deal with this
]

#let epigraph = [
    "What is reality? \ Obviously, no one can say, because it isn't words. \ It isn't material, that's just an idea. \
    It isn't spiritual, that's also an idea; \ a symbol..." \ --- Alan Watts.
]

#let acknowledgements = [
    #let n = 0
    #while n < 20 {
        n = n + 1
        [Thanks for everything (and nothing). \ ]
    }
]

#let abstract-en = [
    #lorem(180) //#linebreak() #lorem(180)
]

#let abstract-de = [
    #lorem(180) //#linebreak() #lorem(180)
]
#let bib = bibliography("refs.bib", title: "Bibliography", style: "ieee")

#show: thesis.with(
    title: title,
    author: "Max Mustermann",
    thesis-type: "Masterarbeit",
    supervisors: (
        "Prof. Dr. Hans-Werner Unsinn",
        "Dr. Oetker",
    ),
    matrikel: "123456",
    submission_date: datetime(year: 2069, month: 4, day: 20), //"01.01.2023",
    abstract-en: abstract-en,
    abstract-de: abstract-de,
    epigraph: epigraph,
    acknowledgements: acknowledgements,
    language: "de",
    abbreviations: abbreviations-list,
    bibliography: bib,
    print-style: "single-sided",
)

= Introduction <chap:introduction>
#include "./chapters/example_chapter_1.typ"
= Figures and tables
#include "./chapters/figures.typ"
= Bibliography
#include "./chapters/chapter_on_bibliography.typ"
#pagebreak()



