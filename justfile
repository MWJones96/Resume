# Both editions come out of Matthew_Jones_CV.tex; the UK one is selected by
# defining \cvuk before the file is read. -jobname keeps the two builds'
# aux files from overwriting each other.
#
# They differ in three things only: phone number, status line, and spelling.

src := "Matthew_Jones_CV.tex"

default: us uk

us:
    latexmk -pdf -jobname=Matthew_Jones_CV_US {{src}}

uk:
    latexmk -pdf -jobname=Matthew_Jones_CV_UK \
        -pdflatex='pdflatex %O "\def\cvuk{}\input{%S}"' {{src}}

clean:
    latexmk -C -jobname=Matthew_Jones_CV_US {{src}}
    latexmk -C -jobname=Matthew_Jones_CV_UK {{src}}
