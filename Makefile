all: build

build:
	latexmk -pdf main -jobname=build/main -pdflatex=lualatex -shell-escape -indexfudge

watch:
	latexmk -pdf main -jobname=build/main -pdflatex=lualatex -shell-escape -interaction=nonstopmode -pvc

buffer:
	latexmk -pdf buffer -jobname=build/buffer -pdflatex=lualatex -shell-escape -interaction=nonstopmode -pvc

clean:
	latexmk -c -jobname=build/main main.tex && \
	latexmk -c -jobname=build/buffer buffer.tex

.PHONY: all build watch buffer clean