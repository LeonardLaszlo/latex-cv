DOCUMENT=cv

# xelatex needs to be executed twice for the first time.
all: clean xelatex xelatex
	echo Done!

xelatex:
	xelatex -synctex=1 -interaction=nonstopmode $(DOCUMENT)

clean:
	echo Cleaning temporary files...
	rm -f *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg *.bcf *.run.xml *.synctex.gz
	rm -f *.log content/*.log include/*.log content/*.aux include/*.aux
