#
# latex2html-specific rules.  We keep these ones separate
# so that they don't interfere with normal html generation.
#
# You would not normally include both this file and tailcat.mk
# from the same makefile (ie: this is an untested combination).
#

texBuild: texPrep texDvi texPs texPdf texHtml

texPrep:
	@if [ -z "$(TEX_SRC_BASENAME)" ]; then \
		echo "TEX_SRC_BASENAME is not set"; \
		exit 1; \
	fi

texDvi:		webHome $(TEX_DVI)
texPs:		tex_ps_ltr tex_ps_a4
texPdf:		tex_pdf_ltr tex_pdf_a4
texHtml:	webHome $(TEX_HTML)
tex_ps_ltr:	webHome $(TEX_PS_LTR)
tex_ps_a4:	webHome $(TEX_PS_A4)
tex_pdf_ltr:	webHome $(TEX_PDF_LTR)
tex_pdf_a4:	webHome $(TEX_PDF_A4)

clean::
	/bin/rm -f $(TEX_GARBAGE) $(BIBTEX_GARBAGE)

$(WEB_HOME)/%.ltr.ps: %.dvi
	$(DVIPS) -tletter $(DVIPS_FLAGS) -o $@ $<

$(WEB_HOME)/%.a4.ps: %.dvi
	$(DVIPS) -ta4 $(DVIPS_FLAGS) -o $@ $<

$(WEB_HOME)/%.ltr.pdf: %.dvi
	$(DVIPDF) -p letter $(DVIPDF_FLAGS) -o $@ $<

$(WEB_HOME)/%.a4.pdf: %.dvi
	$(DVIPDF) -p a4 $(DVIPDF_FLAGS) -o $@ $<

%.dvi: %.tex
	@for i in 1 2 3; do \
		echo "****** latex pass $$i"; \
		TEXINPUTS=$(TEXINPUTS) $(LATEX) $(LATEX_FLAGS) $<; \
		if [ "$*" = intro ]; then \
			echo "****** running bibtex"; \
			$(BIBTEX) $*; \
		fi; \
		$(MAKEINDEX) $*; \
	done; \
	echo "****** latex passes done"

$(WEB_HOME)/%.html: %.tex
	@$(TEX2HTML) -dir "$(WEB_HOME)" -local_icons \
	-up_title "$(TEX_UP_TITLE)" \
	-up_url "$(TEX_UP_URL)" \
	$(TEX2HTML_FLAGS) $<

#	-prefix "$*". -no_auto_link \
#	-info ""
