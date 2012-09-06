#
# $Id: rules.mk,v 1.1 2012/08/26 02:27:36 gdr Exp $
#

build:	buildLocal $(TARGETS) webHomePerms $(BUILD_FILES) finalWebHomePerms
	@for s in X $(SUBPROJECTS); do \
		[ "$$s" = X ] && continue; \
		[ -d "$$s" ] || continue; \
		(cd $$s; $(MAKE) $(MFLAGS) $@); \
	done

# You can define additional rules for buildLocal if the default build
# rule is insufficient.
buildLocal:: webHome

webHome:
	@if [ -z "$(WEB_HOME)" ]; then \
		echo "WEB_HOME not set"; \
		exit 1; \
	fi; \
	[ -d $(WEB_HOME) ] || mkdir -p $(WEB_HOME)

webHomePerms:
	@if [ -z "$(WEB_HOME)" ]; then \
		echo "WEB_HOME not set"; \
		exit 1; \
	fi; \
	if [ "$(FIX_WEB_HOME_PERMS)" = "yes" ]; then \
	  find $(WEB_HOME) -type d \! -perm 0755 -exec chmod 0755 {} \; ; \
	  find $(WEB_HOME) -type f \! -perm 0644 -exec chmod 644 {} \; ; \
	fi

finalWebHomePerms::

install:: build
	@/bin/rm -rf $(TARGET_DIR)
	install -d -m755 $(TARGET_DIR)
	@echo "copying files to $(TARGET_DIR)"; \
	cd $(WEB_HOME); tar -cf - . | \
	  (cd $(TARGET_DIR); tar -xpBf -);
	chmod 0755 $(TARGET_DIR)

#	@echo "setting permissions on $(TARGET_DIR)"; \
#	find $(TARGET_DIR) -type d \! -perm 0755 -exec chmod 0755 {} \; ; \
#	find $(TARGET_DIR) -type f \! -perm 0644 -exec chmod 644 {} \;

clean::
	/bin/rm -f *~
	@for s in X $(SUBPROJECTS); do \
		[ "$$s" = X ] && continue; \
		[ -d "$$s" ] || continue; \
		(cd $$s; $(MAKE) $(MFLAGS) $@); \
	done

clobber:: clean
	/bin/rm -rf $(WEB_HOME)

$(WEB_HOME)/%.gif: %.gif
	install -m644 $< $@

$(WEB_HOME)/%.png: %.png
	install -m644 $< $@

$(WEB_HOME)/%.pdf: %.pdf
	install -m644 $< $@

$(WEB_HOME)/%.txt: %.txt
	install -m644 $< $@
