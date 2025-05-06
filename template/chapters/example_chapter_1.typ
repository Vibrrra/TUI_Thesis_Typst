#import "../utils/global.typ"

== The basics about Typst 

This is a template for Bachelor and Master thsus or any other work that requires a nice looking template for showing your scientific in written form. 

In this Chapter we will provide you with some basic typst code examples to highlight the differences in syntax to Latex

== Subheading <sub>
The subheading of chapter @sub[] was created like this: 
#align(center)[#text("== Subheading")]
Subsubheadings can be created using `=== Your heading`.\
Subsubsubheadings can be created using `==== Your heading`. \
Subsubsubsubheadings can be created using `===== Your heading`.\
...

== Highliting text elements 

Using markdown syntax you can *highlight* _things_ or plain `raw text`.
Labels for headings and figures or else can be created using the `#label` command and used with `@label[]` to reference them like this one here: @sub[ClickMe] (`== Subheading<sub>  ....   @sub[ClickMe]`).

== List<chap:lists>
Let's look at some lists.
A simple bullet list can be created like this `- your bullet`.
 
- First item
- Not the first item
- Definetly not the first item
- Last item

// #pagebreak()
 
You can also create numbered lists using the `+` symbol.
+ Second.
+ Third.
+ First.
+ Stupid list
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