#let title_page(
  title: [], 
  author: "",
  matrikel: none,
  type: none,
  supervisors: (),
  submission_date
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
      #place(top+center, image("../logo-thi.jpg", width: 3cm))
      #place(center, 
        dy: 100pt,
        box(
          stack(
            spacing: 1.5cm,
            stack(
              spacing: 10pt,
                text(12pt, "TECHNISCHE UNIVERSITÄT ILMENAU"),
                text(12pt, "Institut für Medientechnologie"),
                text(12pt, "Fakultät für Elektro-und Informationstechnik"),
                text(12pt, "Fachgebiet Elektronische Medientechnik"),
            )
            text(20pt,weight: "bold", title)          
          )
        ),
        // text(
        //   [
        //     TECHNISCHE UNIVERSITÄT ILMENAU 
        //     Institut für Medientechnologie 
        //     Fakultät für Elektro-und Informationstechnik 
        //     Fachgebiet Elektronische Medientechnik
        //   ], 
        //   size: 12pt
        // )
      )


    ]
  )
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