DOCUMENT = lies-damned-lies-and-statistics

PYGMENTS_TEX = pygments.tex
PYGMENTIZE = pygmentize

LISTINGS_SQL = $(wildcard *.sql)
LISTINGS_TEX = $(patsubst %.sql,%.tex,$(LISTINGS_SQL))

.SECONDARY : $(LISTINGS_TEX) $(PYGMENTS_TEX)

EXTRA_CLEAN = $(wildcard *.toc *.aux *.pdf *.log \
	*.out *.nav *.snm *.vrb *.bbl *.blg *.eps $(LISTINGS_TEX)) $(PYGMENTS_TEX)

all: $(DOCUMENT).pdf

clean:
	rm -f $(EXTRA_CLEAN)

$(PYGMENTS_TEX):
	echo | $(PYGMENTIZE) -l postgres -f latex -O full | sed -n \
		'/makeatletter/,/makeatother/p' > $@

%.tex : %.sql
	$(PYGMENTIZE) -l postgres -f latex -o $@ $<

%.pdf: %.tex $(LISTINGS_TEX) $(PYGMENTS_TEX)
	pdflatex $<
	pdflatex $<
