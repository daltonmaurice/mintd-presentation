# Makefile for Mintd Presentation Series
# Automates Quarto rendering and GitHub Pages preparation

QMD_FILES := session1-concepts.qmd session2-usage.qmd session3-advanced.qmd
HTML_FILES := $(QMD_FILES:.qmd=.html) index.html
FILES_DIRS := $(QMD_FILES:.qmd=_files)
PUBLIC_DIR := public

.PHONY: all site clean help

help:
	@echo "Available targets:"
	@echo "  make all   - Render only session .qmd files to HTML"
	@echo "  make site  - Render all and prepare the 'public/' directory"
	@echo "  make clean - Remove generated HTML files, asset directories, and 'public/'"
	@echo "  make help  - Show this help message"

all:
	quarto render session1-concepts.qmd session2-usage.qmd session3-advanced.qmd --to revealjs

site: all
	mkdir -p $(PUBLIC_DIR)
	cp *.html $(PUBLIC_DIR)/
	-cp -r $(FILES_DIRS) $(PUBLIC_DIR)/ 2>/dev/null || true
	-cp custom.scss $(PUBLIC_DIR)/ 2>/dev/null || true
	@echo "Site prepared in $(PUBLIC_DIR)/"

clean:
	rm -rf $(PUBLIC_DIR)
	rm -f session*.html
	rm -rf $(FILES_DIRS)
	@echo "Cleanup complete."
