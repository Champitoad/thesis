all:
	tectonic -X build

%: %.tex
	latexmk -pdf $(basename $<) -jobname=output-buffer/$(basename $<) -pdflatex=xelatex -shell-escape -interaction=nonstopmode -pvc

.PHONY: all