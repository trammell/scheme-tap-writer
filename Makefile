
  sitedir := $(shell guile -c '(display (%site-dir))')
  instdir := $(sitedir)/tap

usage:
	@echo "usage: make [install]"
	@echo install directory is: $(sitedir)

$(instdir):
	install -d $(instdir)

install: $(instdir)
	install -m 0644 -t $(instdir) src/tap/writer.scm

