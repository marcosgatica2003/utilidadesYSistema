MAIN = main

LATEXMK = latexmk -pdf
VIEWER = zathura

CLEAN_FILES = $(MAIN).aux $(MAIN).fdb_latexmk $(MAIN).fls $(MAIN).log $(MAIN).toc *.aux *.toc *.log

.PHONY: all clean

all: 
	$(LATEXMK) $(MAIN).tex
	$(VIEWER) $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	$(LATEXMK) $(MAIN).tex

clean:
	rm -f $(CLEAN_FILES)

view:
	$(VIEWER) $(MAIN).pdf

