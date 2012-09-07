#
# Generation of HTML versions of the manual pages
#

SRCROOT		= ..
WEB_HOME_BASE	= man
SUBPROJECTS	= 

# This is the directory where the main GNO source repository
# is checked out.  If you have to modify it for your local
# installation, create the $(SRCROOT)/etc/const-local.mk file
# and set it there with a fully qualified pathname.
GNO_SOURCE	= ../../gno

TARGETS2		= $(WEB_HOME)/gsh.12.html \
	          $(WEB_HOME)/gsh.3.html \
	          $(WEB_HOME)/gsh.4.html \
	          $(WEB_HOME)/gsh.5.html \
		  $(WEB_HOME)/install.html \
		  $(WEB_HOME)/kern.html \
		  $(WEB_HOME)/man1.html \
		  $(WEB_HOME)/man2.html \
		  $(WEB_HOME)/man3.html \
		  $(WEB_HOME)/man4.html

include $(SRCROOT)/etc/const-priv.mk
include $(SRCROOT)/etc/const.mk
-include $(SRCROOT)/etc/const-local.mk

MANORG	= $(GNO_SOURCE)/usr.man
MKSO	= $(MANORG)/mkso.data

include $(SRCROOT)/etc/rules.mk


buildLocal:: manBuild

# We do a straight copy on these ones.
#$(WEB_HOME)/%.html: %.html
#	install -m644 $< $@

manBuild: manSetup
	@GNOROOT="$(GNO_SOURCE)" MANHTML="$(WEB_HOME)" NAME="$(NAME)" \
	ADDR="$(ADDRESS)" MKSO="$(MKSO)" \
	./mkhtmlman
# HTMLROOT="$(HTML_ROOT)" 

manSetup:
