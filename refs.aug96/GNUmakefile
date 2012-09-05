#
# Legacy reference manuals from August 1996, for GNO 2.0.4
#

SRCROOT		= ..
WEB_HOME_BASE	= refs.aug96
SUBPROJECTS	= 

TARGETS		= $(WEB_HOME)/gsh.12.html \
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

include $(SRCROOT)/etc/rules.mk

# We do a straight copy on these ones.
$(WEB_HOME)/%.html: %.html
	install -m644 $< $@
