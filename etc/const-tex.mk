#
# LATEX-specific constants
#

TEX_DVI			= $(TEX_SRC_BASENAME).dvi
TEX_PS_LTR		= $(WEB_HOME)/$(TEX_SRC_BASENAME).ltr.ps
TEX_PS_A4		= $(WEB_HOME)/$(TEX_SRC_BASENAME).a4.ps
TEX_PDF_LTR		= $(WEB_HOME)/$(TEX_SRC_BASENAME).ltr.pdf
TEX_PDF_A4		= $(WEB_HOME)/$(TEX_SRC_BASENAME).a4.pdf
TEX_HTML		= $(WEB_HOME)/$(TEX_SRC_BASENAME).html

# Build artifacts
TEX_GARBAGE	= \
	$(TEX_SRC_BASENAME).err \
	$(TEX_SRC_BASENAME).aux \
	$(TEX_SRC_BASENAME).log \
	$(TEX_SRC_BASENAME).toc \
	$(TEX_SRC_BASENAME).idx \
	$(TEX_SRC_BASENAME).ilg \
	$(TEX_SRC_BASENAME).ind \
	$(TEX_SRC_BASENAME).out \
	$(TEX_SRC_BASENAME).dvi

BIBTEX_GARBAGE	= $(TEX_SRC_BASENAME).bbl $(TEX_SRC_BASENAME).blg

# Various latex-related paths
DVIPS		= dvips
DVIPDF		= dvipdfm
LATEX		= latex
TEX2HTML	= latex2html
MAKEINDEX	= makeindex
BIBTEX		= bibtex

# Varous latex-related variables
DVIPS_FLAGS	=
LATEX_FLAGS	=
#TEXINPUTS	= ':/usr/local/lib/latex2html'
TEXINPUTS	= ''

# This link will appear as the "up" link at the top page of of
# latex2html-generatd documents.  You can override it in the local
# makefile if desired.
TEX_UP_URL	 = ../../refs.html

# This is the link name that will be displayed for the TEX_UP_URL, above.
# You can override it in the local makefile if desired.
TEX_UP_TITLE	 = GNO Documentation

# This one assumes that all latex-based documents are at the same directory
# depth in the filesystem.  If one differs, you can override this in the
# local makefile.
TEX_FEEDBACK_URL = ../../feedback.html

# TEX_CONTACT will appear at the bottom of latex2html generated pages
#TEX_CONTACT	= '$(NAME) <a href="mailto:$(ADDRESS)" title="GNO Documentation Feedback">&lt;$(ADDRESS)&gt;</a>'
TEX_CONTACT	= '<a href="$(TEX_FEEDBACK_URL)" title="GNO Documentation Feedback">Feedback</a>'

# Additional flags get defined in tex-rules.mk and local makefiles.
TEX2HTML_FLAGS	= -local_icons -address $(TEX_CONTACT) 
