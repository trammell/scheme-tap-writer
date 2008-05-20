sitedir := $(shell guile -c '(display (%site-dir))')

usage:
	@echo "usage: make [install]"
	@echo install directory is: $(sitedir)

$(sitedir):
	mkdir -p $(sitedir)

install: $(site)
	install -t $(sitedir)/tap/ src/tap/writer.scm

