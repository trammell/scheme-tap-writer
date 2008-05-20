site := $(shell guile etc/display-site-dir.scm)

$(site):
	mkdir -p $(site)

install: $(site)
	@echo site: $(site)



# 	$(INSTALL) my/*.scm $(instdir)


