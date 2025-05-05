#let generate-title-page(
  title: [], 
  author: "",
  matrikel: none,
  type: none,
  supervisors: (),
  language: "en",
  submission_date: datetime,
) = {
  set document(author: author, title: title)
  page(    
    paper: "a4",
    margin: (left: 3mm, right: 3mm, top: 22mm, bottom: 27mm),
    header: none,
    footer: none,
    numbering: none,
    number-align: center,
    [
      #set text(font: "Times New Roman", size: 12pt)
      #place(top+center, 
        box(
          stack(
            spacing: 1cm,
            image("../logo-thi.jpg", width: 3cm),
            stack(
              spacing: 10pt,
                text(12pt, "TECHNISCHE UNIVERSITÄT ILMENAU"),
                text(12pt, "Institut für Medientechnologie"),
                text(12pt, "Fakultät für Elektro-und Informationstechnik"),
                text(12pt, "Fachgebiet Elektronische Medientechnik"),
            ),
          ),
           
        ),)

      #place(center+bottom, 
        dy: -140pt,
        box(
          width: 80%,
          stack(
            spacing: 2cm,
            stack(
            spacing: 1.5cm,
            text(16pt, "Dissertation"),          
            text(20pt,weight: "bold", title),
            text(12pt, "vorgelegt von"),               
            stack(
              spacing: 1em,
              text(16pt, author),
              text(16pt, matrikel),
            ),           
            ),
              align(left, 
                [
                  #stack(spacing: 2pt,
                    if lang == "de" {
                      text(12pt, "Betreuer:")
                    } else {
                      text(12pt, "Supervisors:")
                    },
                    // text(12pt, "Supervisors:"),
                    linebreak(),
                    for supervisor in supervisors {
                      text(12pt, supervisor) 
                      linebreak()
                    }
                  )
                ]
              ),
          ),
        ),
      )
      #place(dy: 666pt,
        center,
        align(center+bottom,
          text(12pt, 
            [
              Ilmenau, #submission_date.display("[day]. [month]. [year]")
            ]
          )
        )
      ),             
    ]
  )
}

#let generate-supervisor-block(supervisors, lang, thesis-type) = {
  let num_supervisors = supervisors.len()
  if lang == "de" {
    [
    #text(12pt, "Betreuer:")
    ]
  } else {
    text(12pt, [supervisors, "Supervisors: ", thesis-type])
  }
}

//   v(3pt)
//   align(center,image("logo-thi.jpg", width: 2cm))
//   align(center,[
//     TECHNISCHE UNIVERSITÄT ILMENAU #linebreak()
//     Institut für Medientechnologie #linebreak()
//     Fakultät für Elektro-und Informationstechnik #linebreak()
//     Fachgebiet Elektronische Medientechnik 
//   ])
//   v(100pt)
  
//   align(center,text(size: 17pt, "Dissertation"))

//   align(center,text(size: 20pt, text(weight: "bold", title)))
  
//   v(10pt)
  
//   align(center,text(size: 12pt, "vorgelegt von"))
  
  
//   align(center,text(size: 17pt, [
//     #author #linebreak()
//     #matrikel #linebreak()

//   ]))
  
//   v(80pt)
  
//   align(
//     center,
//     text(size: 12pt, 
//       [
//         Betreuer: #linebreak()
//         #for super in supervisors {
//           [#super #linebreak()]
//         };
//         #linebreak()
//       ]
//     )
//   )

//   align(
//     center,
//     text(
//       size: 12pt,
//       [Ilmenau, #submission_date]
//     )
//   )
  
  
// //   doc
// }