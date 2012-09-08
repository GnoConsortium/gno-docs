# Devin Reade, November 1997
#
# $Id: Makefile,v 1.4 1998/01/22 14:50:24 gdr Exp $
#
# Main targets:
#
# release:
#	Use this only when the FAQ is ready for news posting, and
#	after doing a 'cvs commit'.
# test:	(DEFAULT TARGET)
#	Use this to generate local copies of the text and html versions
#	of the FAQ.
# test-auto:
#	This generates a file, "faq.out" that contains what *would* be
#	posted with the 'post' target, but doesn't actually post anything.
#	Before this target will build, you must have the file "gnoFAQ.1".
#	You must manually copy "csa2g.FAQ.txt" to "gnoFAQ.1".  This is 
#	so that a draft version of the FAQ is not accidentally posted
#	by a cron job.
#
# test-post:
#	This target will post a version of the FAQ to the configured
#	test newsgroup.  (Currently, ab.test.)
# clean:
#	Deletes all scratch files except the released.* files (from the
#	previous posting).
# clobber:
#	Deletes *all* scratch files.
#

SRC	= FAQ.gno.src
CONFIG	= faq-config

AUTOFAQ	= ./auto-faq/auto-faq
MKFAQ	= mkfaq

GEN_HTML =	csa2g.FAQ.html
GEN_TEXT =	csa2g.FAQ.txt
LOG_HTML =	csa2g.LOG.html
LOG_TEXT =	csa2g.LOG.txt
LOG_PENDING =	unposted.log

GEN_POST= faq.out

# if you split the archive, change the 'release' target, below
AUTOSRC	= gnoFAQ.1

# This is the name of the file that contains the approval header.
APPROVAL =	/home/gdr/etc/GNO-FAQ.approval

# This extracts the date and version from RCS identifiers.
GETDATE	=	/home/gdr/src/gno/doc/refs/getdate

default:	test

test:		$(GEN_TEXT) $(GEN_HTML) log
test-auto:	$(GEN_POST)
log:		$(LOG_TEXT) $(LOG_HTML)
$(GEN_TEXT) $(GEN_HTML): $(SRC) $(MKFAQ);	$(MKFAQ)

$(LOG_TEXT): $(SRC)
	@echo "making $@"; \
	cat log.preamble > $@; \
	echo "  extracting log information"; \
	cvs log $(SRC) | perl -n \
		-e '(/------/) && ($$found++);' \
		-e '($$found == 1) && print;' >> $@; \
	if [ -f $(LOG_PENDING) ]; then \
		echo "  reusing $(LOG_PENDING)"; \
		cat $(LOG_PENDING) >> $@; \
	fi;

$(LOG_HTML): $(LOG_TEXT)
	@echo "making $@"; \
	echo '<html><head><title>GNO FAQ Update Log</title></head>' > $@; \
	echo '<body bgcolor="#ffffff">' >> $@; \
	echo '<h1>GNO FAQ Update Log</h1><pre>' >> $@; \
	perl -p \
		-e 's/</&lt;/g;' -e 's/>/&gt;/g;' -e 's/"/&quot;/g;' \
		< $< >> $@; \
	echo '</pre></body></html>' >> $@

$(GEN_POST): $(AUTOSRC)
	FAQ_NOSEND=1; export FAQ_NOSEND; \
	$(AUTOFAQ) GNO-faq

release: $(GEN_TEXT) $(GEN_HTML) $(LOG_TEXT) $(LOG_HTML)
	@echo "creating release files"; \
	v=`$(GETDATE) -version < $(SRC)`; \
	r=released; \
	rm -rf $$r; \
	mkdir $$r; \
	cp $(GEN_TEXT) $(AUTOSRC); \
	cp $(GEN_TEXT) $$r/faq.v$$v.txt; \
	cp $(GEN_HTML) $$r/faq.v$$v.html; \
	cp $(LOG_TEXT) $$r/log.v$$v.txt; \
	cp $(LOG_HTML) $$r/log.v$$v.html; \
	(cd $$r; tar -cf - .) | gzip --best > released.tar.gz

#	tar -cf - released*.txt released*.html| gzip --best > released.tar.gz

test-post: $(AUTOSRC)
	@g=`fgrep testgroup faq-config | \
		sed -e 's/^[^"][^"]*"//;' -e 's/".*//;'`; \
	echo "posting to test group ($$g)"; \
	if [ ! -f $(APPROVAL) ]; then \
		echo "$(APPROVAL) not found."; \
		echo "======== Are you supposed to be posting this FAQ?"; \
		exit 1; \
	fi; \
	FAQ_TEST=1; export FAQ_TEST; \
	$(AUTOFAQ) GNO-faq


post: $(AUTOSRC)
	@echo "posting to csa2g"; \
	if [ ! -f $(APPROVAL) ]; then \
		echo "$(APPROVAL) not found."; \
		echo "======== Are you supposed to be posting this FAQ?"; \
		exit 1; \
	fi; \
	$(AUTOFAQ) GNO-faq

clean:
	rm -f $(GEN_HTML) $(GEN_TEXT) $(GEN_POST) *~ gnoFAQ.? \
		$(LOG_HTML) $(LOG_TEXT)

clobber: clean
	rm -rf released.* released
