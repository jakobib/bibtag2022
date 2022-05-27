OPTIONS=-s --slide-level 2 -f markdown+implicit_figures --wrap=preserve

all: slides.html slides.pdf

slides.md: img/eva-prinzip.png img/pipes.png

slides.html: about.yml slides.md
	pandoc $(OPTIONS) -t revealjs -o $@ $^ -V theme:white -V css:style.css

# requires xetex (sudo apt-get install texlive-xetex)
slides.pdf: about.yml slides.md
	pandoc $(OPTIONS) -t beamer --pdf-engine=xelatex -o $@ $^


.PHONY: clean
clean:
	-rm -f slides.pdf slides.html
