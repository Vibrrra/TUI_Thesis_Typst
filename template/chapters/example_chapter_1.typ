#import "@local/tui-thesis-typst:0.8.0": *

This is a template for Bachelor and Master thsus or any other work that requires a nice looking template for showing your scientific in written form.
You can use this template for your own work.
If you need to collaborate with other people on this work you can have a look at #link("https://typst.app")[*typst.app*].
They provide an Online editor and hosting of your document as well as the possibility for collaborative writing, similar to #link("https://www.overleaf.com")[*Overleaf*] (#LaTeX).
Limited space per project and a stripped-down feature set is *free*.

If you migrate from #LaTeX to Typst the #link("https://typst.app/docs/guides/guide-for-latex-users/")[*Guide for #LaTeX users*] might be helpful.
Throughout this document you will find some basic Typst examples for typical thesis elements.
Text elements with a small red circle in the top right corner are clickable and will lead you to the corresponding #link("https://typst.app/docs/reference/")[Typst] documentation.
The following chapters only a few selected examples taken from the official only resources #footnote("https://typst.app/docs", numbering: "1,") #footnote("https://github.com/typst/typst").

== Install Typst locally (offline)
As mentioned above, you can use the #link("https://typst.app")[*typst.app*] online editor for solo and collaborative writing.

If you want to use Typst locally you can find instructions to install Typst on your machine #link("https://github.com/typst/typst")[*HERE*].

#pagebreak()
#underline(offset: 2pt)[ *Quickstart* ]\

For Windows users, install via Winget in the console:
#align(center)[`winget install --id Typst.Typst`]
Mac users:
#align(center)[`brew install typst`]
Linux: users:
#align(center)[View Typst on #link("https://repology.org/project/typst/versions")[Repology] \ or #link("https://snapcraft.io/typst")[Snap]]

Alternatively, you install Typst via the Rust toolchain if available on your on your system:
#align(center)[latest version: \ `cargo install --locked typst-cli`]
#align(center)[develop version: \ `cargo install --git https://github.com/typst/typst --locked typst-cli`]

== Basic usage from command line window:
In your shell of choice (e.g. CMD or PowerShell on Windows) you can run the following commands.
#align(left)[
    Create \`file.pdf \` in working directory \
    #align(center)[`typst compile file.typ`]
    Creates PDF file at desired path:
    #align(center)[`typst compile path/to/source.typ path/to/output.pdf`]
    Watches source files and recompiles on changes:
    #align(center)[`typst watch file.typ`]
    Lists available subcommands and options:
    #align(center)[`typst help`]
    Print detailed info and usage of a subcommand (e.g. typst watch):
    #align(center)[`typst help watch `]
]
#pagebreak()
== Using Typst in an IDE
For a productive and comfortable writing experience you may want to use a code editor which supports the @lsp to unlock code highliting, completition, formatting, refactoring... \ \
Three recommended options:
- #link("https://code.visualstudio.com/")[VSCode]
- #link("https://helix-editor.com/")[Helix]
- #link("https://neovim.io/")[Neovim] (if you dare)
Best language server option for Typst as of now: The #link("https://github.com/Myriad-Dreamin/tinymist")[*Tinymist*] language server.
(Available as VSCode Extension )

#figure(
    caption: flex-caption(
        [Using VSCode Editor for writing a Typst document. The Tinymist extension allows for syntax highliting as well as live-preview with hot-reload in keypress for instant viewing your changes.],
        [VSCode],
    ),
)[#image("../images/screenshot.png")]

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
            - @drr
- Not the first item
- Definetly not the first item
- Last item (@drr)

// #pagebreak()

You can also create numbered lists using the `+` symbol.
+ Second.
+ Third.
+ First.
+ Stupid list.
If you need to define a term a term you can you use the `/ TERM: *your definition ` command.
Example:
#align(center, `/ TERM: Description of the term`)
yields:
#align(center, [/ TERM: Description of the term])

=== Comments
Just write them like this `/* Your Comment */` and they will be hidden in the output.
You can also comment out whole lines using `//`.

=== Equations & Math-related stuff
Math equations are constructed similar to #LaTeX. Math mode is created by wrapping the formula in `$`-signs.
You can insert equation inlined or as a numbered stand-alone block.

\ *INLINE MATH* \
You can write inline math like this by enclosing the math formula with `$`(NO SPACE).
Example:
#align(center, `$alpha < Theta^2$`)
yields: $alpha < Theta^2$ which nicely integrates into your text.

\ *BLOCK MATH* \
Or generate block math using `$ *your equation here* $` (With space before and after the `$`).
Example:
#align(center, `$ \alpha < \Theta^2 $`)
yields:
$ alpha < Theta^2 $

Block equations are consecutivley numbered like this `2.13`, where 2 and 13 would denote the chapter-number and global equation-count, respectively.
