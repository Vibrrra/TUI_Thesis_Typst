// Title Page
#set page(paper: "a4", 
  // header: align(left + horizon, "Intro"),
  header: [Department of Electronic Media Technology  
    #h(1fr) Logo 
    #linebreak()
    Ilmenau University of Technology, 
],
  columns: 1,
)
#set text(
  font: "Times New Roman",
  size: 10pt
)


#let title = text(strong("Modified Reverberation in the Context of Augmented Reality"), size: 24pt,)
#align(center ,
pad(top: 80pt,[#block(height: 100pt,inset: 0pt, align(center+horizon,title), clip: true)],
))
// Author
#let author = "Christian Schneiderwind"
#align(center ,
[#block(height: 20pt,inset: 20pt, align(center+horizon,text(size: 15pt, author)))]
)

#pad("", bottom: 50pt)
#let thesis = "Disseration"
#align(center, 
  [#block(height:50pt, align(center+horizon,text(thesis,size: 20pt)))]
)

*Supervisors* 

Prof. Dr.-Ing. Karlheinz Brandenburg #linebreak()
Prof. Dr. Zoidberg                   #linebreak()
Dr. Oetker

#align(bottom,[The dissertation was submitted to the Department of Computer Science and Automation
 at the Ilmenau University of Technology on February 69, 420.
])

#pagebreak()

#outline()
#pagebreak()

= Introduction
== Audio Augmented Reality
= Theoretic Background
== Binaural Hearing
== Room Acoustics
== Dynamic Binaural Rendering
= Room matching
=== Plausibility
= Late Reverberation Modification
= Experiment I:  Late Reverb Modification in a reverberant Room
== BRIR Measurements
== Listen Test Methodology
=== Test Items 
=== Test Design
=== Results
=== Discussion of Experiment I 
= Experiment II: Late Reverb modification in a dry Room
== BRIR Measurements
== Listen Test Methodology
=== Test Items 
=== Test Design
=== Results
=== Discussion of Experiment II
= Discussion
= Conclusion



 
Perception of Late Reverberation Modification In Augmented Reality  
#set page(paper: "a4",
header: "")

$$= Introduction
This is a simple test file
with a list of


List Example
+ 2
  - FD

+ V+
+ GG

#figure(
  image("EotU.jpg", width: 50%),
  caption: [
    This is a symbol of the eye of the universe
  ]
)

A simple math equation


$
Q = sum_(integral_0^(-infinity))^(integral_0^infinity t " "d t)
$

$ 7.32 beta +
  sum_(i=0)^nabla
    (Q_i (a_i - epsilon)) / 2 
    $

#text(font: "Times New Roman", size:0.3cm)[
  This is diffierent
  
  *This* is a _*different*_ font so _suddenly_

]


