#import "../utils/global.typ" : *

#figure(caption: [This symbol was found at one the ruins on the Attle Rock. According to script fragments found near the side, it represents what the Nomai refer to as the _Eye of the Universe_.], )[#image("../../EotU.jpg", width: 50%)]<dd>

This chapter shows<ds> some examples on how figures and tables work in Typst. Let's start with the basics.
Look at #ref(<dd>). Nicely done!



#align(top)[
#subpar.grid(
  columns: (1fr,1fr,1fr),
  caption: [This is an example of how to place subfigure. You can also reference, e.g. `@a` which produces @a or @d],
  figure(image("../../EotU.jpg"), caption: ""),<a>,
  figure(image("../../EotU.jpg"), caption: ""),<b>,
  figure(image("../../EotU.jpg"), caption: ""),<c>,
  figure(image("../../EotU.jpg"), caption: ""),<d>,
  figure(image("../../EotU.jpg"), caption: ""),<e>,
  // figure(image("../../EotU.jpg"), caption: ""),<f>,
  figure([There can also be text in here. In don't know why one would every need this. Anyway... \ \  ], caption: ""),<f>,
  label: <fig:even_subfigs>
)
]

@fig:even_subfigs shows an example on how to deal with subfigures. This template uses the #link("https://typst.app/universe/package/subpar/")[*subpar*] package for creating subfigures. If you want to dig deeper into the Typst language and create your own custom functions this package have a look at the #link("https://github.com/tingerrr/subpar/tree/main")[respository]. It is a nice example on how to make custom overrides.  



#align(bottom)[
#subpar.grid(
  columns: (1fr),
  label: <fig:odd_subfigs>,
  caption: [
    This example shows on how to nicely center subfigures in case of having an an odd number 
    Using the `columns`-Parameter in the `#grid` function. The first colum is specified using same width factions for all three subfigures `colums(1fr, 1fr, 1fr)`. The second row specifies 4 columns with 
    `columns(1fr, 2fr, 2fr, 1fr)`. This way you can insert empty (`[]`) block which centers the remaining 2 subfigures (@odd_subfigs_d, @odd_subfigs_e ) ],
  [
    #grid( columns: (1fr, 1fr, 1fr),
      [#figure(image("../../EotU.jpg"), caption: "", )<odd_subfigs_a>], 
      [#figure(image("../../EotU.jpg"), caption: "", )<odd_subfigs_b>], 
      [#figure(image("../../EotU.jpg"), caption: "", )<odd_subfigs_c>], 
    )
  
    #grid( columns: (1fr, 2fr, 2fr, 1fr),
      [],
      [#figure(image("../../EotU.jpg"), caption: "", )<odd_subfigs_d>],
      [#figure(image("../../EotU.jpg"), caption: "", )<odd_subfigs_e>],
         
    )
  ],  
)
]




