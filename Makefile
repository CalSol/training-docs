UNOCONV = python unoconv/unoconv

IMG_SRCS=$(wildcard images/*.odg)
IMG_PNGS=$(SRCS:.odg=.png)

all: images documents

images: $(PNGS)

documents: $(TEX_PDFS)

%.png : %.odg
	$(UNOCONV) -f png $<

clean:
	rm -rf images/*.png
