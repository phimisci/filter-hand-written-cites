html:
	pandoc $(input-file) --bibliography=$(bibliography) --filter filter/hand-written-citations.py --citeproc -s -o $(input-file).html

pdf:
	pandoc $(input-file) --bibliography=$(bibliography) --filter filter/hand-written-citations.py --biblatex -s -o $(input-file).tex
	xelatex -interaction=batchmode $(input-file).tex
	biber --quiet $(input-file)
	xelatex -interaction=batchmode $(input-file).tex
	xelatex -interaction=batchmode $(input-file).tex
	
md:
	pandoc $(input-file) --bibliography=$(bibliography) --filter filter/hand-written-citations.py -s -o $(input-file).md
	
clean:
	rm -f *.aux *.glo *.hd *.idx *.ins *.log *.out *.run.xml *.toc *.4ct *.4tc
	rm -f *.bcf *.idv *.lg *.synctex.gz *.xdv *.xref *.tmp *.bbl *.blg
