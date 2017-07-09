PDFLATEX = pdflatex -interaction=nonstopmode

all: PfadiralalaIV.pdf PfadiralalaIV-2.pdf 
	

PfadiralalaIV: PfadiralalaIV.pdf
	open $<
PfadiralalaIV.pdf: PfadiralalaIV.tex Lieder-neu/*.tex GrifftabelleUkuleleGCEA.tex PfadiralalaIV.sbx basic-design.tex songs.sty GrifftabelleGitarre.tex GrifftabelleUkuleleADFisH.tex GrifftabelleUkuleleDGHE.tex 
	@echo "### $@"
	$(PDFLATEX) $(basename $@).tex > /dev/null
PfadiralalaIV.sbx: PfadiralalaIV.sxd
	@echo "### $@"
	songidx $< &> $@.log	
PfadiralalaIV.sxd: PfadiralalaIV.tex
	@echo "### $@"
	$(PDFLATEX) $(basename $@).tex > /dev/null
	make $(basename $@).sbx
	$(PDFLATEX) $(basename $@).tex > /dev/null
	
PfadiralalaIV-print.pdf: PfadiralalaIV.pdf
	PRINT=true $(PDFLATEX) -jobname=$(basename $@) $(basename $<).tex > /dev/null
PfadiralalaIV-pics.pdf: PfadiralalaIV.pdf
	PICS=true $(PDFLATEX) -jobname=$(basename $@) $(basename $<).tex > /dev/null


PfadiralalaIV-2: PfadiralalaIV-2.pdf
	open $<
PfadiralalaIV-2.pdf: PfadiralalaIV-2.tex Lieder-neu/*.tex GrifftabelleUkuleleGCEA.tex PfadiralalaIV-2.sbx basic-design.tex songs.sty GrifftabelleGitarre.tex GrifftabelleUkuleleADFisH.tex GrifftabelleUkuleleDGHE.tex 
	@echo "### $@"
	$(PDFLATEX) $(basename $@).tex > /dev/null
PfadiralalaIV-2.sbx: PfadiralalaIV-2.sxd PfadiralalaIV-2.tex
	@echo "### $@"
	songidx $< &> $@.log
PfadiralalaIV-2.sxd: PfadiralalaIV-2.tex
	@echo "### $@"
	$(PDFLATEX) $(basename $@).tex > /dev/null
	make $(basename $@).sbx
	$(PDFLATEX) $(basename $@).tex > /dev/null
	
PfadiralalaIV-2-print.pdf: PfadiralalaIV-2.pdf
	PRINT=true $(PDFLATEX) -jobname=$(basename $@) $(basename $<).tex > /dev/null
PfadiralalaIV-2-pics.pdf: PfadiralalaIV-2.pdf
	PICS=true $(PDFLATEX) -jobname=$(basename $@) $(basename $<).tex > /dev/null


clean:
	@rm -f *.lb *.aux *.log *.sxc *.sxd *.sbx *.synctex.gz *.out *.fls Pfadiralala*.pdf

	
PDFs/%: Lieder*/%.tex
	mkdir -p PDFs
	SONG=$< pdflatex -jobname=$@ Single-Song.tex
	rm $@.log
	rm $@.aux
	open $@.pdf