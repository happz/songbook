SOURCES = $(sort $(wildcard songs/*.txt))
SONGS := $(patsubst songs/%.txt,build/%.pdf,$(SOURCES))

OPTIONS := --config=chordpro.json

# .PHONY: build/songbook.pdf

all: songs songbook

songs: $(SONGS)

songbook: build/songbook.pdf

build/songbook.pdf: $(SOURCES) chordpro.json
	chordpro $(OPTIONS) --toc $(SOURCES) -o build/songbook.pdf

clean:
	rm -f build/*.pdf

build/%.pdf: songs/%.txt chordpro.json
	chordpro $(OPTIONS) $< -o $@
