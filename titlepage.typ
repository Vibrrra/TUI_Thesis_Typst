#let title_page(
  title: none, 
  author: none,
  matrikel: none,
  type: none,
  supervisors: (),
  submission_date
) = {

  v(3pt)
  align(center,image("logo-thi.jpg", width: 2cm))
  align(center,[
    TECHNISCHE UNIVERSITÄT ILMENAU #linebreak()
    Institut für Medientechnologie #linebreak()
    Fakultät für Elektro-und Informationstechnik #linebreak()
    Fachgebiet Elektronische Medientechnik 
  ])
  v(100pt)
  
  align(center,text(size: 17pt, "Dissertation"))

  align(center,text(size: 20pt, text(weight: "bold", title)))
  
  v(10pt)
  
  align(center,text(size: 12pt, "vorgelegt von"))
  
  
  align(center,text(size: 17pt, [
    #author #linebreak()
    #matrikel #linebreak()

  ]))
  
  v(80pt)
  
  align(
    center,
    text(size: 12pt, 
      [
        Betreuer: #linebreak()
        #for super in supervisors {
          [#super #linebreak()]
        };
        #linebreak()
      ]
    )
  )

  align(
    center,
    text(
      size: 12pt,
      [Ilmenau, #submission_date]
    )
  )
  
  
//   doc
}