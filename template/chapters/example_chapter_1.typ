#import "../utils/global.typ" : *

This is a template for Bachelor and Master thsus or any other work that requires a nice looking template for showing your scientific in written form. 
You can use this template for your own work. 
If you need to collaborate with other people on this work you can have a look at #link("https://typst.app")[*typst.app*]. 
They provide an Online editor for collaborative writing, similar to #link("https://www.overleaf.com")[*Overleaf*] (#LaTeX).  
If you migrate from #LaTeX to Typst the #link("https://typst.app/docs/guides/guide-for-latex-users/")[*Guide for #LaTeX users*] might be helpful.
Throughout this document you will find some basic Typst examples for typical thesis elements.
Text elements with a small red circle in the top right corner are clickable and will lead you to the corresponding #link("https://typst.app/docs/reference/")[Typst] documentation.

== Installation and ressources
As mentioned above, you can use the #link("https://typst.app")[*typst.app*] online editor for solo and collaborative writing.

If you want to use Typst locally you can find instructions to install Typst on your machine #link("https://github.com/typst/typst")[*HERE*].
For a productive writing experience you may want to use a Code-editor (e.g., VSCode, Helix, Neovim,...) which supports a Typst Language-Server-Protocoll like *Tinymist*. 

#pagebreak()

== The basics about Typst syntax


In this Chapter we will provide you with some basic typst code examples. 
Typst is a markup language that allows you to create documents in a simple and easy way.
It is similar to LaTeX, but much easier to use. (Unbiased opinion... \*cough\* ).

=== Subheading <sub>
The subheading of chapter @sub[] was created like this: 
#align(center)[#text("== Subheading")]
Subsubheadings can be created using `=== Your heading`.\
Subsubsubheadings can be created using `==== Your heading`. \
Subsubsubsubheadings can be created using `===== Your heading`.\
...

=== Highliting text elements 

Using markdown syntax you can *highlight* _things_ or display them in plain `raw text`.
You can also use #link("https://typst.app/docs/reference/text/text/")[`#text`] to highlight text.
Example: `#text("This is a text")` yields: #text("This is a text").
`#text` provides a lot of options to customize the text. You can use it to create colored text, bold text, italic text, etc.
You can also you Markdown syntax for styling text elements. 

#box(fill: box-color, outset: 4pt)[
Example: To make a word bold you can use `*word*` which yields: *word*.
]

The blue box was created in the last line was created using the #link("https://typst.app/docs/reference/layout/box/")[`#box`] function.

Labels for headings and figures or else can be created using the `#label` command and used with `@label[]` to reference them like this one here: @sub[ClickMe] (`== Subheading<sub>  ....   @sub[ClickMe]`).

=== Lists<chap:lists>
Let's look at some #link("https://typst.app/docs/reference/model/list/")[lists].\
A simple bullet list can be created like this `- your bullet`. 
 
- First item
  - Sub-first item
    - Subsub-first item
      - Subsbusb-first item
- Not the first item
- Definetly not the first item
- Last item

// #pagebreak()
 
You can also create numbered lists using the `+` symbol.
+ Second.
+ Third.
+ First.
+ Stupid list.
If you need to define a term a term you can you use the `/ TERM: *your definition ` command.
Example: 
#align(center,   `/ TERM: Description of the term`)
yields: 
#align(center,   [/ TERM: Description of the term])

==== Comments 
Just write them like this `/* Your Comment */` and they will be hidden in the output.
You can also comment out whole lines using `//`.

==== Equations & Math-related stuff 

\ *INLINE MATH* \
You can write inline math like this by enclosing the math formula with `$`(NO SPACE).
Example:
#align(center,`$alpha < Theta^2$` ) 
yields: $alpha < Theta^2$  which nicely integrates into your text.

\ *BLOCK MATH* \
Or generate block math using `$ *your equation here* $` (With space before and after the `$`). 
Example:
#align(center,`$ \alpha < \Theta^2 $` )
yields: 
$ alpha < Theta^2 $