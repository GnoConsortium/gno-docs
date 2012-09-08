#
# Frequently Asked Questions
#

SRCROOT		= ..
WEB_HOME_BASE	= faq
SUBPROJECTS	= 

GEN_TEXT	= $(WEB_HOME)/csa2g.FAQ.txt
GEN_HTML	= $(WEB_HOME)/csa2g.FAQ.html

TARGETS		= $(GEN_TEXT) $(GEN_HTML)

MKFAQ		= ./mkfaq
FAQ_SRC		= FAQ.gno.src

include $(SRCROOT)/etc/const-priv.mk
include $(SRCROOT)/etc/const.mk
-include $(SRCROOT)/etc/const-local.mk

include $(SRCROOT)/etc/rules.mk

$(GEN_TEXT) $(GEN_HTML): $(FAQ_SRC) $(MKFAQ)
	$(MKFAQ)
	install -m0644 csa2g.FAQ.html $(GEN_HTML)
	install -m0644 csa2g.FAQ.txt $(GEN_TEXT)

clean::
	/bin/rm -f csa2g.FAQ.html csa2g.FAQ.txt
