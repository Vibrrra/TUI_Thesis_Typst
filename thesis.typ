#import "titlepage.typ" : title_page


#let thesis(
  type: none,
  title: [], 
  author: [],
  matrikel: [],
  supervisors: (),
  submission_date: [],
  body
) = {
  set page(
    paper: "a4",
  )
  set par(justify: true)
  title_page(title: title, author: author, matrikel: matrikel, supervisors: supervisors, submission_date)
  set text(font: "Times New Roman", size: 12pt)
}


