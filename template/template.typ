// #import "template/thesis.typ" : thesis
#import "utils/global.typ" : thesis

#let epigraph = [
  "What is reality? Obviously, no one can say, because it isn't words. \ It isn't material, that's just an idea. \
  It isn't spiritual, that's also an idea; \ a symbol.""  \ --- Alan Watts.
]

#let acknowledgements = [
  Danke für nichts.
]

#show: thesis.with(
  title: [
    This is a very long title for an absolutely incredible thesis - not many people can deal with this
    // This is a very long title for an absolutely incredible thesis - not many people can deal with this
  ], 
  author: "Max Mustermann", 
  thesis-type: "Master Thesis",
  supervisors: (
    "Prof. Dr. Kleist", 
    "Prof. Dr. Hans-Werner Unsinn",
    ),
  matrikel: "1234567",
  submission_date: "01.01.2023",
  abstract: lorem(80),
  epigraph: epigraph,
  acknowledgements: acknowledgements

) 
