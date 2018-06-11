OUTPUT_NAME= ethereum-scalability
PATH_OF_CONTENTS= res/sections
MAIN_FILE= main
CC= latexmk
JOB_NAME=-jobname='$(OUTPUT_NAME)'
CCFLAGS= -pdflatex='pdflatex -interaction=nonstopmode' -pdf --synctex=1
SHELL := /bin/bash #Need bash not shell

all: compile

compile:
	$(CC) -C $(JOB_NAME); \
	$(CC) $(CCFLAGS) $(JOB_NAME);

clean:
	$(CC) -C $(JOB_NAME)
	if [[ -a "$(OUTPUT_NAME)" ]]; then rm -rv $(OUTPUT_NAME)/; fi;
	rm -f *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 *.lb;
	rm -f *.bbl *.bcf *.blg *-blx.aux *-blx.bib *.run.xml;
	rm -f *.fdb_latexmk *.synctex *.synctex.gz;
	rm -f *.pdfsync *.lol;
