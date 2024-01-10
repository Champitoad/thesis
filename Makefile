all: build

build:
	latexmk -pdf index -jobname=build/index -pdflatex=lualatex -shell-escape

watch:
	latexmk -pdf index -jobname=build/index -pdflatex=lualatex -shell-escape -interaction=nonstopmode -pvc

buffer:
	latexmk -pdf buffer -jobname=build/buffer -pdflatex=lualatex -shell-escape -interaction=nonstopmode -pvc

clean:
	latexmk -c -jobname=build/index index.tex && \
	latexmk -c -jobname=build/buffer buffer.tex

.PHONY: all build watch buffer clean