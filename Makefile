OPTIONS=-s --slide-level 2

all: slides.html slides.pdf

slides.html: about.yml slides.md
	pandoc $(OPTIONS) -t revealjs -o $@ $^

# requires xetex (sudo apt-get install texlive-xetex)
slides.pdf: about.yml slides.md
	pandoc $(OPTIONS) -t beamer --pdf-engine=xelatex -o $@ $^
