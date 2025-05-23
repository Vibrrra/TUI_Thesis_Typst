#let title_header(lang) = {
    if lang == "de" {
        stack(
            spacing: 10pt,
            text(12pt, "TECHNISCHE UNIVERSITÄT ILMENAU"),
            text(12pt, "Institut für Medientechnologie"),
            text(12pt, "Fakultät für Elektro-und Informationstechnik"),
            text(12pt, "Fachgebiet Elektronische Medientechnik"),
        )
    } else {
        stack(
            spacing: 10pt,
            text(12pt, "TECHNISCHE UNIVERSITÄT ILMENAU"),
            text(12pt, "Institute of Media Technology"),
            text(12pt, "Department of Electrical Engineering and Information Technology"),
            text(12pt, "Electronic Media Technology Group"),
        )
    }
}

#let generate-title-page(
    title: [],
    author: "",
    matrikel: none,
    thesis-type: [],
    supervisors: (),
    language: "en",
    submission_date: datetime,
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
            #place(
                top + center,
                box(
                    stack(
                        spacing: 1cm,
                        image("../../assets/logo-thi.jpg", width: 3cm),
                        title_header(language),
                    ),
                ),
            )

            #place(
                center + bottom,
                dy: -140pt,
                box(
                    width: 80%,
                    stack(
                        spacing: 2cm,
                        stack(
                            spacing: 1.5cm,
                            text(16pt, thesis-type),
                            text(20pt, weight: "bold", title),
                            text(
                                12pt,
                                [
                                    #if language == "de" {
                                        "vorgelegt von"
                                    } else {
                                        "submitted by"
                                    }
                                ],
                            ),
                            stack(
                                spacing: 1em,
                                text(16pt, author),
                                if language == "de" [
                                    #text(16pt, [Matrikel: #matrikel])
                                ] else [
                                    #text(16pt, [Reg.-Nr.:#matrikel])
                                ],
                            ),
                        ),
                        align(
                            left,
                            [
                                #stack(
                                    spacing: 2pt,
                                    if language == "de" {
                                        text(12pt, "Betreuer:")
                                    } else {
                                        text(12pt, "Supervisors:")
                                    },
                                    linebreak(),
                                    for supervisor in supervisors {
                                        text(12pt, supervisor)
                                        linebreak()
                                    },
                                )
                            ],
                        ),
                    ),
                ),
            )
            #place(
                dy: 666pt,
                center,
                align(
                    center + bottom,
                    text(
                        12pt,
                        [
                            Ilmenau, #submission_date.display("[day].[month].[year]")
                        ],
                    ),
                ),
            ),
        ],
    )
}

#let generate-supervisor-block(supervisors, lang, thesis-type) = {
    let num_supervisors = supervisors.len()
    if lang == "de" {
        [
            #text(12pt, "Betreuer:")
        ]
    } else {
        text(12pt, [supervisors, "Supervisors: ", thesis-type])
    }
}

