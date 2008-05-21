
   sitedir := $(shell guile -q -c '(display (%site-dir))')
   instdir := $(sitedir)/tap

usage:
	@echo "usage: make [test|clean|install]"
	@echo install directory is: $(sitedir)

clean realclean:
	rm -f *.txt *.tgz
	rm -rf tap-writer-*

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

   rel = tap-writer-0.01

dist:
	rm -rf $(rel)
	mkdir $(rel)
	cp -a Changes Makefile README src t $(rel)
	find $(rel) -name '.svn' | xargs rm -rf
	tar czf $(rel).tgz $(rel)

