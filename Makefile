.PHONY: help all clean

PANDOC_OPTS = --syntax-highlighting=custom.theme \
  -V fontsize=12pt \
  -V geometry:margin=1in \
  --lua-filter=clearpage.lua

FILENAME := Notes


%.pdf: %.ipynb
#	uv run ruff format  # Uncomment to run the formatter.
	uv run jupyter execute --inplace $<
	uv run jupyter nbconvert $< --to markdown
	pandoc $*.md -o $@ $(PANDOC_OPTS)
	uv run jupyter nbconvert $< --to notebook --ClearOutputPreprocessor.enabled=True --ClearMetadataPreprocessor.enabled=True --inplace
	rm -rf $*.md $*_files/

all: $(FILENAME).pdf

help:
	@echo "Usage:"
	@echo "  make [all]       -> convert $(FILENAME).ipynb to $(FILENAME).pdf"
	@echo "  make MyNotes.pdf -> convert MyNotes.ipynb to MyNotes.pdf"
