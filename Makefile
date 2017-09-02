SOURCES = $(wildcard songs/*.txt)
SONGS := $(patsubst %.txt,%.pdf,$(SOURCES))

all: songs songbook

songs: $(SONGS)

songbook: songbook.pdf

songbook.pdf: $(SOURCES)
	chordpro --config=chordpro.json -G $(sort $(SOURCES)) -o songbook.pdf

clean:
	rm -f *.pdf songs/*.pdf

%.pdf : %.txt
	chordpro --config=chordpro.json -G $< -o $@
