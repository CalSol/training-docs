UNOCONV = python unoconv/unoconv

SRCS=$(wildcard images/*.odg)
PNGS=$(SRCS:.odg=.png)

all: images

images: $(PNGS)

%.png : %.odg
	$(UNOCONV) -f png $<

clean:
	rm -rf images/*.png
