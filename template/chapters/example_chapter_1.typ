#import "../utils/global.typ"

== The basics about Typst 

This is a template for Bachelor and Master thsus or any other work that requires a nice looking template for showing your scientific in written form. 

In this Chapter we will provide you with some basic typst code examples to highlight the differences in syntax to Latex

== Subheading <sub>
The subheading of chapter @sub[] was created like this: 
 #align(center)[#text("== Subheading")]

 Using markdown syntax you can *highlight* _things_ or plain `raw text`.
 Labels for headings and figures or else can be created using the `#label` command and used with `@label[]` to reference them like this one here: @sub[ClickMe] (`== Subheading<sub>  ....   @sub[ClickMe]`).

 == List<chap:lists>

 - Bullet list using `- `
 - bullet 2
 - bullet 3 

 + 1
 + 2 
 + 3 
 + using `+`

  