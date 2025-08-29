
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates


#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  institut: none,
  keywords: none,
  confidential: false,
  thesis-type: none,
  degree-type: none,
  study-year: none,
  submission-date: none,
  study-direction: none,
  correctors: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: ("Arial", "Helvetica Neue", "Helvetica", "Liberation Sans", "DejaVu Sans", "Noto Sans"),
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "libertinus serif",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  number-depth: none,
  pagenumbering: "1",
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: none,
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(
    numbering: if sectionnumbering != none {
      (..nums) => if nums.pos().len() <= number-depth {
        numbering(sectionnumbering, ..nums)
      }
    } else { none }
  )
  // Pagebreaks are handled by Lua filter to avoid container conflicts
  
  // Title page
  if title != none or authors != none {
    page(numbering: none)[
      #align(center)[
        #if lang == "en" [
          ZURICH UNIVERSITY OF APPLIED SCIENCES \
          DEPARTEMENT LIFE SCIENCES AND FACILITY MANAGEMENT
        ] else [
          ZÜRCHER HOCHSCHULE FÜR ANGEWANDTE WISSENSCHAFTEN \
          DEPARTEMENT LIFE SCIENCES UND FACILITY MANAGEMENT
        ]
        #if institut != none [
          \ #upper(institut)
        ]
      ]
      #v(1fr)
      #if title != none {
        align(center)[#block(inset: 2em)[
          #set par(leading: heading-line-height)
          #if (heading-family != none or heading-weight != "bold" or heading-style != "normal"
               or heading-color != black) {
            set text(font: heading-family, weight: heading-weight, style: heading-style, fill: heading-color)
            text(size: title-size)[#title]
            if subtitle != none {
              parbreak()
              text(size: subtitle-size)[#subtitle]
            }
            if confidential {
              parbreak()
              if lang == "en" [
                text(size: subtitle-size)[CONFIDENTIAL]
              ] else [
                text(size: subtitle-size)[VERTRAULICH]
              ]
            }
            if thesis-type != none {
              v(1.5cm)
              text(size: subtitle-size)[#thesis-type]
            }
          } else {
            text(weight: "bold", size: title-size)[#title]
            if subtitle != none {
              parbreak()
              text(weight: "bold", size: subtitle-size)[#subtitle]
            }
            if confidential {
              parbreak()
              if lang == "en" [
                text(weight: "bold", size: subtitle-size)[CONFIDENTIAL]
              ] else [
                text(weight: "bold", size: subtitle-size)[VERTRAULICH]
              ]
            }
            if thesis-type != none {
              v(1.5cm)
              text(weight: "bold", size: subtitle-size)[#thesis-type]
            }
          }
        ]]
      }

      #v(1.5cm)

      #if authors != none {
        align(center)[
          #if lang == "en" [
            by \
          ] else [
            von \
          ]
          #for author in authors [
            #author.name \
          ]
          #if degree-type != none and study-year != none [
            \ #degree-type #study-year
          ]
          #if submission-date != none [
            \ #if lang == "en" [
              Submission date #submission-date
            ] else [
              Abgabedatum #submission-date
            ]
          ]
          #if study-direction != none [
            \ Studienrichtung #study-direction
          ]
        ]
      }

      #v(1fr)
      
      #if correctors != none {
        align(left)[
          #if lang == "en" [
            *Supervisors:* \
          ] else [
            *Fachkorrektoren/Fachkorrektorinnen:* \
          ]
          #for corrector in correctors [
            #if corrector.title != none [#corrector.title] #corrector.name \
            #corrector.affiliation \
            \
          ]
        ]
      }
    ]
  }

  // Imprint page (second page)
  if title != none or authors != none {
    page(numbering: none)[
      #v(1fr)
      
      #align(left)[
        #if lang == "en" [
          *Imprint*
        ] else [
          *Impressum*
        ]
      ]
      
      #v(2em)
      
      // Citation section
      #if authors != none and title != none {
        align(left)[
          #if lang == "en" [
            *Recommended Citation:*
          ] else [
            *Zitiervorschlag:*
          ]
        ]
        
        align(left)[
          #text(size: 10pt)[
            #for author in authors [
              #author.name
              #if author != authors.last() [, ]
            ]
            #if date != none [(#date). ] else [(n.d.). ]
            #emph[#title#if subtitle != none [: #subtitle]]. 
            #if institut != none {
              if lang == "en" [
                Zurich University of Applied Sciences, Department Life Sciences and Facility Management, #institut.
              ] else [
                Zürcher Hochschule für Angewandte Wissenschaften, Departement Life Sciences und Facility Management, #institut.
              ]
            }
          ]
        ]
        
        v(2em)
      }
      
      // Keywords
      #if keywords != none {
        align(left)[
          #if lang == "en" [
            *Keywords:* #keywords
          ] else [
            *Schlagworte:* #keywords
          ]
        ]
        v(2em)
      }
      
      // Institute
      #if institut != none {
        align(left)[
          #if lang == "en" [
            #institut \
            Department Life Sciences and Facility Management \
            Zurich University of Applied Sciences
          ] else [
            #institut \
            Departement Life Sciences und Facility Management \
            Zürcher Hochschule für Angewandte Wissenschaften
          ]
        ]
      }
    ]
  }

  // Start page numbering for main content with header
  set page(
    numbering: pagenumbering,
    header: [
      #text(size: 0.8em)[
        #grid(
          columns: (1fr, 1fr, 1fr),
          align: (left, center, right),
          gutter: 1em,
          [ZHAW LSFM],
          [#if thesis-type != none [#thesis-type]],
          [#if authors != none [
            #for author in authors [
              #author.name
              #if author != authors.last() [, ]
            ]
          ]]
        )
      ]
      #line(length: 100%, stroke: 0.5pt)
    ]
  )
  counter(page).update(1)

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)
