PREFIX	= $(HOME)
SHARE	= $(PREFIX)/share
BIN	= $(PREFIX)/bin
APPNAME = bmake
VERSION = 0.1
DISTNAME= $(APPNAME)-$(VERSION)
FILELIST= Makefile Makefile.in configure mktests/[0-9][0-9]*

all:
	@echo Nothing needs to be built

install:
	install --mode=0644 -D Makefile.in $(SHARE)/bmake/Makefile.in
	install --mode=0755 -D configure $(SHARE)/bmake/configure
	install --mode=0755 -D bmake $(BIN)/bmake
	sed -i '/^sharedir=/ csharedir='\'"$(SHARE)"\' $(BIN)/bmake

dist:
	if [ -e $(DISTNAME) ] ; then rm -rf $(DISTNAME) ; fi
	mkdir $(DISTNAME)
	cp $(FILELIST) $(DISTNAME)
	tar -zcf $(DISTNAME).tar.gz $(DISTNAME)/
	tar -jcf $(DISTNAME).tar.bz2 $(DISTNAME)/
	rm -rf $(DISTNAME)

clean:
	rm -f $(DISTNAME).tar.gz $(DISTNAME).tar.bz2

.PHONY: all install dist clean
