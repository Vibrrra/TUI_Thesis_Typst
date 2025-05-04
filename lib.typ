#import "@preview/subpar:0.2.1"
#import "@preview/physica:0.9.5": *
#import "@preview/glossarium:0.5.4": make-glossary, register-glossary
#import "@preview/codly:1.2.0": *
#import "@preview/ctheorems:1.1.3": *

#import "modules/titlepage.typ" : title_page




// #import "titlepage.typ" : title_page


#let thesis(
  type: none,
  title: [], 
  author: [],
  matrikel: [],
  supervisors: (),
  submission_date: "",
  body
) = {
  set page(
    paper: "a4",
  )
  set par(justify: true)
  title_page(title: title, author: author, matrikel: matrikel, supervisors: supervisors, submission_date: submission_date)
  set text(font: "Times New Roman", size: 12pt)
}


