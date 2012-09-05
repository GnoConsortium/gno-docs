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

# This is where the files will eventually wind up.
TARGET_DIR		= $(GNO_PUBLIC_HTML)/$(WEB_HOME_BASE)
