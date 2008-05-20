sitedir := $(shell guile -c '(display (%site-dir))(newline)')

usage:
	@echo "usage: make [install]"
	@echo install directory is: $(sitedir)

$(site):
	mkdir -p $(site)

install: $(site)
	@echo site: $(site)

