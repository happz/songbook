SOURCES = $(wildcard songs/*.txt)
SONGS := $(patsubst songs/%.txt,build/%.pdf,$(SOURCES))

all: songs songbook

songs: $(SONGS)

songbook: build/songbook.pdf

build/songbook.pdf: $(SOURCES)
	chordpro --toc --config=chordpro.json -G $(sort $(SOURCES)) -o build/songbook.pdf

clean:
	rm -f build/*.pdf

build/%.pdf: songs/%.txt
	chordpro --config=chordpro.json -G $< -o $@
