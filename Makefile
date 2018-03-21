OUTPUT_NAME= ethereum-scalability
PATH_OF_CONTENTS= res/sections
MAIN_FILE= main
CC= latexmk
JOB_NAME=-jobname='$(OUTPUT_NAME)'
CCFLAGS= -pdflatex='pdflatex -interaction=nonstopmode' -pdf
SHELL := /bin/bash #Need bash not shell

all: compile

compile:
	$(CC) -C $(JOB_NAME); \
	$(CC) $(CCFLAGS) $(JOB_NAME); \

clean:
	git clean -Xfd
	$(CC) -C $(JOB_NAME)
	if [[ -a "$(OUTPUT_NAME)" ]]; then rm -rv $(OUTPUT_NAME)/; fi;
