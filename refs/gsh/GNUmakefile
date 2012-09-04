#
# GNO Shell
#
SRCROOT 	= ../..
WEB_HOME_BASE	= refs/gsh
SUBPROJECTS	= 

include $(SRCROOT)/etc/constpriv.mk
include $(SRCROOT)/etc/const.mk

WEB_HOME	= $(DOCROOT_INSECURE)/$(WEB_HOME_BASE)
HEAD_PAGE	= 
TAIL_PAGE	= 
TARGETS		= buildDocbookHtml buildDocbookPdf
DOCBOOK_TOP	= gsh.docbook

default: build

clean::
	/bin/rm -rf $(WEB_HOME)/html

include $(SRCROOT)/etc/rules.mk
include $(SRCROOT)/etc/tailcat.mk
