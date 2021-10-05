NAME := xdmod-xsede-tools
VERSION := $(shell awk '/^Version/ { print $$2 }' $(NAME).spec)
BIN_DIR ?= /usr/bin
ETC_DIR ?= /etc
SYSCONF_DIR ?= /etc/sysconfig
SBIN_DIR ?= /usr/sbin

.PHONY: all
all:
	echo ''

.PHONY: clean
clean:
	$(RM) $(NAME)-$(VERSION).tar.gz

.PHONY: install
install:
	install -m 644 -D config/pmlogger/pmlogger-config.ookami $(ETC_DIR)/pcp/pmlogger/pmlogger-config.ookami
	install -m 644 -D config/pmlogger/control.d/ookami $(ETC_DIR)/pcp/pmlogger/control.d/ookami
	install -m 644 -D config/pmie/pmie-config.ookami $(ETC_DIR)/pcp/pmie/pmie-config.ookami
	install -m 644 -D config/pmie/control.d/ookami $(ETC_DIR)/pcp/pmie/control.d/ookami
	install -m 644 -D config/pmdas/proc/hotproc.conf $(PCP_PMDAS_DIR)/proc/hotproc.conf
	install -m 644 -D config/pmdas/perfevent/perfevent.conf $(PCP_PMDAS_DIR)/perfevent/perfevent.conf.ookami
	install -m 644 -D systemd/pmlogger.service.d/override.conf $(ETC_DIR)/systemd/system/pmlogger.service.d/override.conf
	install -m 644 -D systemd/pmcd.service.d/override.conf $(ETC_DIR)/systemd/system/pmcd.service.d/override.conf

.PHONY: dist
dist:
	git archive --prefix=$(NAME)-$(VERSION)/ -o $(NAME)-$(VERSION).tar.gz HEAD


.PHONY: rpm
rpm: dist
	rpmbuild -ta $(NAME)-$(VERSION).tar.gz
