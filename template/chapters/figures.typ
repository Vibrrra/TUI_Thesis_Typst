#import "@local/tui-thesis-typst:0.8.0": *
#figure(
    caption: flex-caption(
        [This symbol was found at one the ruins on the Attle Rock.
            According to script fragments found near the side, it represents what the Nomai refer to as the _Eye of the Universe_.],
        [Eye of the Universe],
    ),
)[
    #image("../images/EotU.jpg", width: 50%)
]<dd>



This chapter shows some examples on how figures and tables work in Typst. Let's start with the basics.
Figures are created with the `#figure` function. This creates a specific in which an `#image` can be placed (see @dd).
You could also use the `#image` function directly, but this would not allow you to add a caption or a label.
The label is used to reference the figure in the text. You can use the `@` symbol followed by the label name to reference it. For example, `@dd` will produce @dd.

== Subfigures - Even numbers
@fig:even_subfigs shows an example on how to deal with subfigures. This template uses the #link("https://typst.app/universe/package/subpar/")[*subpar*] package for creating subfigures. If you want to dig deeper into the Typst language and create your own custom functions this package have a look at the #link("https://github.com/tingerrr/subpar/tree/main")[respository]. It is a nice example on how to make custom overrides.


#align(top)[
    #subpar.grid(
        columns: (1fr, 1fr, 1fr),
        align: (horizon, horizon, horizon),
        caption: flex-caption(
            [This is an example of how to place subfigure. You can also reference, e.g. `@a` which produces @a or @d],
            [First Figure Example],
        ),
        figure(image("../images/EotU.jpg"), caption: ""),
        <a>,
        figure(image("../images/EotU.jpg"), caption: ""),
        <b>,
        figure(image("../images/EotU.jpg"), caption: ""),
        <c>,
        figure(image("../images/EotU.jpg"), caption: ""),
        <d>,
        figure(image("../images/EotU.jpg"), caption: ""),
        <e>,
        // figure(image("../../EotU.jpg"), caption: ""),<f>,
        // figure([There can also be text in here. In don't know why one would every need this. Anyway... \ \  ], caption: ""),<f>,
        figure(
            [There can also be text in here. In don't know why one would every need this. Anyway... \ ],
            caption: "",
        ),
        <f>,
        label: <fig:even_subfigs>,
    )
]
Subfigures can be used to arrange multiple images / graphs in a single figure. The easiest way to do this is to use the `#subpar.grid` function.
@fig:even_subfigs shows an example of how to use this function. The `columns` parameter specifies the number of columns in the grid. In this case, we have 3 columns.
In the case of an even number of subfigures, the `#subpar.grid` function will automatically arrange the subfigures in a grid.

But how to nicely center subfigures in case of having an an odd number of subfigures?



== Subfigures - Odd numbers
So here we have an example with an odd number of subfigures. The `#subpar.grid` function will automatically arrange the subfigures in a grid.
However, we can not directly center $n$ subfigures if we $m$ columns and $m > n$.
A workaround is to use the `columns` parameter in the `#grid` function.
In example @fig:odd_subfigs we have 5 subfigures. The first row specifies 3 columns with `columns(1fr, 1fr, 1fr)`.
The second row specifies 4 columns with `columns(1fr, 2fr, 2fr, 1fr)`.
This way you can insert empty (`[]`) block which centers the remaining 2 subfigures (@odd_subfigs_d, @odd_subfigs_e ).
#align(top)[
    #subpar.grid(
        columns: 1fr,
        label: <fig:odd_subfigs>,
        caption: flex-caption(
            [
                This example shows on how to nicely center subfigures in case of having an an odd number
                Using the `columns`-Parameter in the `#grid` function. The first colum is specified using same width factions for all three subfigures `colums(1fr, 1fr, 1fr)`. The second row specifies 4 columns with
                `columns(1fr, 2fr, 2fr, 1fr)`. This way you can insert empty (`[]`) block which centers the remaining 2 subfigures (@odd_subfigs_d, @odd_subfigs_e )
            ],
            [Odd number of subfigures],
        ),
        [
            #grid(
                columns: (1fr, 1fr, 1fr),
                [#figure(image("../images/EotU.jpg"), caption: "")<odd_subfigs_a>],
                [#figure(image("../images/EotU.jpg"), caption: "")<odd_subfigs_b>],
                [#figure(image("../images/EotU.jpg"), caption: "")<odd_subfigs_c>],
            )

            #grid(
                columns: (1fr, 2fr, 2fr, 1fr),
                [],
                [#figure(image("../images/EotU.jpg"), caption: "")<odd_subfigs_d>],
                [#figure(image("../images/EotU.jpg"), caption: "")<odd_subfigs_e>],
            )
        ],
    )
]

#pagebreak()
== Tables
Let's look at some #link("https://typst.app/docs/reference/model/table/")[tables].\
@tab:Table1 was created with the default styling of this template. This should be convenient for most cases. The caption for tables is automatically placed on top which is common for scientific literature. By putting tables inside a `#figure` you can also add a label to the table and reference it in the text.
This way tables will be automatically numbered and added to the list of tables.

#align()[
    #figure(
        table(
            columns: 3,
            table.header([Substance], [Effective Dosage], [Misc]),
            [Nutella], [1 table spoon], [hot take: better with butter],
            [Coffee], [1 cup], [10 cups (ask Lukas)],
            [Spice], [2 table spoons], [ > 2 table spoons],
            [Substance A], [1.0 $mu$], [ 10.2 $Mu mu$],
            [Substance A], [1.0 $mu$], [ 10.2 $Mu mu$],
            [Substance A], [1.0 $mu$], [ 10.2 $Mu mu$],
        ),
        caption: [This is an example of a table. You can also reference, e.g. `@tab:Table1`. This table uses the template's default styling.],
    )<tab:Table1>
]

$ a = b $
However, if you need to customize the table you can override the default styling of the table, look at the source code of @tab:Table2. It was created in scope `#[ ]`. Thos allows to override the default styling of the table within this scope.
You can also include images and math equations in the table. The table will automatically adjust the size of the columns and rows to fit the content.

#let small_tab = [
    #set text(size: 8pt)
    #table(
        stroke: none,
        columns: 3,
        column-gutter: 2pt,
        row-gutter: 1pt,
        table.header([], [#table.cell(fill: gray)[Item A]], [#table.cell(fill: gray)[Item B]]),
        [#table.cell(fill: gray)[Lukas]], [#table.cell(fill: green)[5]], [7],
        [#table.cell(fill: gray)[Georg]], [5], [#table.cell(fill: yellow)[7]],
    )]

#figure()[#small_tab]
#place(
    top,
    dx: 0.5em,
    dy: 17.0cm,
)[#rotate(-10deg)[#text(
            size: 24pt,
            "Ignore this small table. This ist just for testing purposes. AAAAAAAAA",
            fill: rgb("#864949"),
        )]]


#let dont-count-math-eq = {
    // show: math.equation
}

#[

    // #show figure.where(kind: table): set figure.caption(position: bottom)
    #set table.hline(stroke: 0.6pt + fill-color-gray)
    // show: dont-count-math-eq
    #set math.equation(
        numbering: n => {
            let p = counter(math.equation).get().first()
            counter(math.equation).update(p => p - 1)
        },
    )

    #figure(
        table(
            stroke: none,
            inset: 1pt,
            column-gutter: 15pt,
            // row-gutter: 0pt,
            row-gutter: auto,
            columns: 3,
            // generell alignment rules
            align: (horizon, left + horizon, left + horizon),
            table.header([Substance], [Effective Dosage], [Misc]),
            table.hline(start: 0),
            [Nutella], [1 table spoon], [hot take: \ better with butter],
            table.hline(start: 2),
            [Coffee], [1 cup], [10 cups (ask Lukas)],
            [], [], [],
            [], table.cell(colspan: 2)[#align(center)[*Shai-Hulud* recommends]],
            table.hline(start: 1),
            [Spice], [1 sniff], [10 sniffs],
            [#image("../images/logo-thi.jpg", width: 30%)], [10 courses], [#text()[$
                        integral_0^infinity x / ((sin(x) / d) +2 ) d x
                    $]],
            [McRib], [1 McRib], [1 McRib],
            [Table], [#small_tab], [#box(fill: blue)[#small_tab]]
        ),
        caption: [This is an example of a complex table. You can also reference, e.g. `@tab:Table2`.
            This table uses custom styling in a seperate scope. This table features text, images and math equations and even other tables.],
    )<tab:Table2>
]

On the next page we are going to check out some Code listings!
#pagebreak()

== Code Listings
Let's make a small listing. Code blocks are also wrapped in a caption. \
Like this:
#align(center)[
    #raw("#figure()[
     ```rust
                  println!(\"yeah\");
```]")
]

Code highliting is supported for a a lot of languages.
This is what Rust Code (@code:rust_1) looks like in the Code Block.
Adding a caption registers the code bock to the List of Listings - Outline in the front matter section.
#figure(
    caption: flex-caption(
        [This function's only purpose is to print out the agony of Stephan after seeing with another "Underfull Box (Badness: 10000)" Warning],
        [useless Rust function],
    ),
)[
    ```rust
      // This main function doesn't do shnit
      pub fn main() {
        let g: i32 = 0;
        let mut aah: String = String::new();

        aah.push("A");
        for i in 0..10 {
          aah.push("a");
        }
        aah.push("h!")
        println!("Stephan yells: {}", &aah);
      }
    ```
]<code:rust_1>
