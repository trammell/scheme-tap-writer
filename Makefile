
   sitedir := $(shell guile -q -c '(display (%site-dir))')
   instdir := $(sitedir)/tap

usage:
	@echo "usage: make [install]"
	@echo install directory is: $(sitedir)

site:
	-@echo guile site directory is: $(sitedir)
	-@echo install directory is: $(instdir)

$(instdir):
	install -d $(instdir)

install: $(instdir)
	install -m 0644 -t $(instdir) src/tap/writer.scm

test: testout.txt t/correct-test-output.txt
	diff testout.txt t/correct-test-output.txt

testout.txt:
	guile -L src t/*.scm > testout.txt

