#import "../utils/global.typ" : *


This chapter shows<ds> some examples on how figures and tables work in Typst. Let's start with the basics.
Look at #ref(<dd>).
#figure(caption: [This symbol was found at one the ruins on the Attle Rock. According to script fragments found near the side, it represents what the Nomai refer to as the _Eye of the Universe_.], )[#image("../../EotU.jpg", width: 50%)]<dd>

#block[

#subpar.grid(
  columns: (1fr,1fr,1fr),
  figure(image("../../EotU.jpg"), caption: "", ),
  figure(image("../../EotU.jpg"), caption: ""),
  figure(image("../../EotU.jpg"), caption: ""),
  figure(image("../../EotU.jpg"), caption: ""),
  figure(image("../../EotU.jpg"), caption: ""),
)
  // #set figure(numbering: (..numbers) => {
  //   return numbering("2", 2)
  // })
  // #show: figure
  // #subpar.grid(
  // columns: (1fr, 2fr,2fr,1fr),
  // [],
  // figure(image("../../EotU.jpg"), caption: ""),
  // figure(image("../../EotU.jpg")),
  
)
]