#
# Docbook-specific constants
#

# The top-level file that includes all other docbook files
DOCBOOK_TOP	= $(DOCBOOK_SRC_BASENAME).docbook

# The name of the top level index file created by docbook2html.
# Override in the local makefile if necessary.
DOCBOOK_TOP_HTML	= $(WEB_HOME)/book1.html

DOCBOOK_TOP_PDF		= $(WEB_HOME)/$(DOCBOOK_SRC_BASENAME).pdf
