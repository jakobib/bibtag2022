OPTIONS=-s --slide-level 2 -f markdown+implicit_figures --wrap=preserve

all: html pdf

html: docs/index.html

pdf: docs/slides.pdf

# requires pandoc >= 2.17
docs/index.html: about.yml slides.md
	pandoc $(OPTIONS) -t revealjs -o $@ $^ -V theme:white -V css:style.css

# requires xetex (sudo apt-get install texlive-xetex)
docs/slides.pdf: about.yml slides.md
	pandoc $(OPTIONS) -t beamer --pdf-engine=xelatex -o $@ $^
