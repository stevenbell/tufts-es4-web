
RESOURCEDIR = resources
TEMPLATEDIR = templates
BUILDDIR = build


SOURCES = $(filter-out README.md, $(wildcard *.md))
PAGES = $(patsubst %.md,build/%.html,$(SOURCES))

.PHONY : all
all: builddir copy_resources $(PAGES)

builddir:
	mkdir -p $(BUILDDIR)

copy_resources:
	cp -r $(RESOURCEDIR) $(BUILDDIR)

build/%.html : %.md $(TEMPLATEDIR)/default.html
	pandoc --to html5 --template=$(TEMPLATEDIR)/default.html --css $(RESOURCEDIR)/style.css $< -o $@

# Push the pages to the web server
.PHONY : push
push : $(PAGES)
	rsync -Lrv $(BUILDDIR)/ sbell@linux.eecs.tufts.edu:/es/4/public_html

.PHONY : clean
clean :
	-rm -rf $(BUILDDIR)

