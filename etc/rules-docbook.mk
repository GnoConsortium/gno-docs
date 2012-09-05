#
# Rules specific to docbook-style documents
#

docbookBuild: docbookPrep docbookHtml docbookPdf

docbookPrep:
	@if [ -z "$(DOCBOOK_SRC_BASENAME)" ]; then \
		echo "DOCBOOK_SRC_BASENAME is not set"; \
		exit 1; \
	fi

docbookHtml:	webHome $(DOCBOOK_TOP_HTML)
docbookPdf:	webHome $(DOCBOOK_TOP_PDF)

$(DOCBOOK_TOP_HTML):	$(DOCBOOK_SRCS)
	docbook2html -o $(WEB_HOME) $(DOCBOOK_TOP)

# This would give more meaningful names to most *.html files, but not all
#	docbook2html -V '%use-id-as-filename%' -o $(WEB_HOME) $(DOCBOOK_TOP)

$(DOCBOOK_TOP_PDF):	$(DOCBOOK_SRCS)
	docbook2pdf -o $(WEB_HOME) $(DOCBOOK_TOP)

