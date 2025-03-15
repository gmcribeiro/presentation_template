.PHONY: all build clean cleanall clean_aux


# Vars
SRC     := ${PWD}
OUT     := ${PWD}/build
AUX     := ${PWD}/aux
SCRIPTS := ${PWD}/scripts

# Commands
LATEXMK := $(or $(shell command -v latexmk),latexmk)
LATEXMK_FLAGS := -pdf
#LATEXMK_FLAGS += -silent
LATEXMK_FLAGS += -view=none
LATEXMK_FLAGS += -auxdir=${OUT}
LATEXMK_FLAGS += -outdir=${AUX}
LATEXMK_FLAGS += -pdflatex="pdflatex"

all: build

clean_aux:
	@cd ${AUX}; \
	ls | grep -e 'main.*' | grep -v main.tex | xargs rm
	echo "Cleaned auxiliary files"

build: 
	latexmk main.tex -xelatex -bibtex -outdir=${OUT} -auxdir=${AUX}

clean: 
	@find ${OUT} -type f ! -name '*.pdf' -delete
	@find ${OUT}/* -type d -delete

cleanall: 
	@rm -rf ${OUT}/* 

