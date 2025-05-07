// #import "template/thesis.typ" : thesis
#import "utils/global.typ" : thesis

#let title = [
  This is a very long title and complicated title for an absolutely incredible thesis - not many people can deal with this $ alpha < Theta^2$
  // This is a very long title for an absolutely incredible thesis - not many people can deal with this
]

#let epigraph = [
  "What is reality? Obviously, no one can say, because it isn't words. \ It isn't material, that's just an idea. \
  It isn't spiritual, that's also an idea; \ a symbol.""  \ --- Alan Watts.
]

#let acknowledgements = [
  #let n = 0
  #while n < 20 {
      n = n + 1
      [Thanks for everything (and nothing).   \ ]

  }
]

#let abstract-en = [
  #lorem(180) //#linebreak() #lorem(180)
]

#let abstract-de = [
  #lorem(180) //#linebreak() #lorem(180)
]

#show: thesis.with(
  title:title,
  author: "Max Mustermann", 
  thesis-type: "Master Thesis",
  supervisors: (
    "Prof. Dr. Kleist", 
    "Prof. Dr. Hans-Werner Unsinn",
    ),
  matrikel: "123456",
  submission_date: datetime(year: 2069, month: 4, day: 20),//"01.01.2023",
  abstract-en: abstract-en,
  abstract-de: abstract-de,
  epigraph: epigraph,
  acknowledgements: acknowledgements,
  language: "de",
) 

= Introduction <chap:introduction>
#include "./chapters/example_chapter_1.typ"
= Figures and Tables 
#include "./chapters/figures.typ"
#pagebreak()



