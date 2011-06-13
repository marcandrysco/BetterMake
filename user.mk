BIN = $(bmake_PATH_BIN)
SHARE = $(bmake_PATH_SHARE)

APPNAME = bmake
VERSION = 0.1.1
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

clean: user-clean

user-clean:

.PHONY: user-all user-install user-dist user-clean
