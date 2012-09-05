#
# GNO Shell Reference Manual
#
SRCROOT 	= ../..
WEB_HOME_BASE	= refs/gsh
SUBPROJECTS	= 

DOCBOOK_SRC_BASENAME	= gsh
DOCBOOK_SRCS		= $(shell /bin/ls -1 *.docbook)

include $(SRCROOT)/etc/const-priv.mk
include $(SRCROOT)/etc/const.mk
include $(SRCROOT)/etc/const-docbook.mk
-include $(SRCROOT)/etc/const-local.mk

include $(SRCROOT)/etc/rules.mk
include $(SRCROOT)/etc/rules-docbook.mk

buildLocal:: docbookBuild
