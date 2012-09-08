#
# Top level GNO documentation makefile
#
SRCROOT		= .
WEB_HOME_BASE	= 
SUBPROJECTS	= refs refs.aug96 man faq

DYNAMIC_TARGETS	= $(WEB_HOME)/head.html \
		  $(WEB_HOME)/tail.html \
		  $(WEB_HOME)/index.html \
		  $(WEB_HOME)/refs.html \
		  $(WEB_HOME)/manindex.html \
		  $(WEB_HOME)/faqindex.html \
		  $(WEB_HOME)/oldnews.html

STATIC_TARGETS	= 

TARGETS		= $(STATIC_TARGETS) $(DYNAMIC_TARGETS)



include $(SRCROOT)/etc/const-priv.mk
include $(SRCROOT)/etc/const.mk
-include $(SRCROOT)/etc/const-local.mk

# Set these ones AFTER const.mk gets included:
FIX_WEB_HOME_PERMS = no


include $(SRCROOT)/etc/rules.mk

clobber::
	/bin/rm -rf $(OUTPUT_DIR)

# We do a straight copy on these ones.
$(WEB_HOME)/%.html: %.html
	install -m644 $< $@

finalWebHomePerms::
	@if [ -n "$(STATIC_TARGETS)" ]; then \
		chmod 0644 $(STATIC_TARGETS); \
	fi
	@if [ -n "$(DYNAMIC_TARGETS)" ]; then \
		chmod 0754 $(DYNAMIC_TARGETS); \
	fi
