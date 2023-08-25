all: build

build:
	tectonic -X build

watch:
	tectonic -X watch

%: %.tex
	latexmk -pdf $(basename $<) -jobname=output-buffer/$(basename $<) -pdflatex=xelatex -shell-escape -interaction=nonstopmode -pvc

.PHONY: all