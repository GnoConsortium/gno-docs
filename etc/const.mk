#
# Before this file is included, it is assumed that you have defined
# the following constants:
#
# SRCROOT	- The relative path to the base of the docs source
#                 (that is, the relative path of the directory above
#                 the etc directory in which this const.mk file resides).
#
# WEB_HOME_BASE - This is the directory, relative GNO_PUBLIC_HTML, where
#                 the files being built should reside upon installation.
#
# SUBPROJECTS	- The child directories into which the make should recurse.
#                 If the value is empty, then recursion will stop.
#
# In addition, also before this file is included, it is assumed that
# the including makefile will also have included the const-priv.mk file,
# also in this directory.  The const-priv.mk file is not checked into
# the repository, but is expected to be created locally and containing
# the following variables:
#
#   GNO_PUBLIC_HTML
#      The directory where the GNO web pages are anchored.  This
#      top level directory is not managed by these files, but
#      the files there need to reference these files.  If you are
#      not building this for the official GNO web site, you can
#      just point this at a scratch directory somewhere.
#
# After this file is included, the including makefile is expected to
# define

# This is the name and address that will be given as contact info
# at the bottom of each of the HTML pages.  Do NOT use '<' or '>' in the
# address.
NAME	= Devin Reade
ADDRESS	= gdr@gno.org

# The directory hierarchy into which generated files get placed.
OUTPUT_DIR		= $(SRCROOT)/gen

# The base document root (see DOCROOT_INSECURE and DOCROOT_SECURE).
DOCROOT			= $(OUTPUT_DIR)

# DOCROOT_INSECURE contains files that are available via http (unencrypted)
# access.
DOCROOT_INSECURE	= $(OUTPUT_DIR)/insecure/gno

# DOCROOT_SECURE contains files that are only available via https
# (encrypted) access.
DOCROOT_SECURE		= $(OUTPUT_DIR)/secure/gno

# Full path to where we're putting our files
WEB_HOME		= $(DOCROOT_INSECURE)/$(WEB_HOME_BASE)

HTTP_SERVER		= www.gno.org
HTTP_PORT		= # :81
HTTPS_PORT		= # :8443
FTP_SERVER		= ftp.gno.org

DATE			= $(SRCROOT)/etc/getdate -date

BUILD_FILES		= GNUmakefile $(HEAD_PAGE) $(TAIL_PAGE) \
			  $(SRCROOT)/etc/const.mk \
			  $(SRCROOT)/etc/rules.mk \
			  $(SRCROOT)/etc/tailcat.mk

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

# This is where the files will eventually wind up.
TARGET_DIR		= $(GNO_PUBLIC_HTML)/$(WEB_HOME_BASE)
