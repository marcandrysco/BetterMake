BIN = $(bmake_PATH_BIN)
SHARE = $(bmake_PATH_SHARE)

APPNAME = bmake
VERSION = 0.5.0-alpha
DISTNAME= $(APPNAME)-$(VERSION)


all: user-all

user-all:
	@echo Nothing needs to be built

install: user-install

user-install:
	for file in share/mktests/* ; do install --mode=0755 -D "$$file" $(SHARE)/bmake/mktests/"$${file##*/}" ; done
	install --mode=0644 -D share/Makefile.in $(SHARE)/bmake/Makefile.in
	install --mode=0755 -D share/configure $(SHARE)/bmake/configure
	install --mode=0755 -D bmake $(BIN)/bmake
	sed -i '/^sharedir=/ csharedir='\'"$(SHARE)/bmake"\' $(BIN)/bmake

doc: doc-tut


user-dist:
	if [ -e $(DISTNAME) ] ; then rm -rf $(DISTNAME) ; fi
	mkdir $(DISTNAME)
	mkdir $(DISTNAME)/share
	mkdir $(DISTNAME)/share/mktests
	cp Makefile.in configure bmake user.mk $(DISTNAME)
	cp share/mktests/[0-9][0-9]-* $(DISTNAME)/share/mktests
	cp share/Makefile.in share/configure $(DISTNAME)/share
	tar -zcf $(DISTNAME).tar.gz $(DISTNAME)/
	tar -jcf $(DISTNAME).tar.bz2 $(DISTNAME)/
	rm -rf $(DISTNAME)


clean: user-clean

user-clean:

.PHONY: user-all user-install doc doc-tut user-clean
