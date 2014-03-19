rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))
UNOCONV = python unoconv/unoconv

IMG_SRCS=$(call rwildcard, images/, *.odg)
IMG_PNGS=$(IMG_SRCS:.odg=.png)

all: images documents

images: $(IMG_PNGS)

documents: $(TEX_PDFS)

%.png : %.odg
	$(UNOCONV) -f png $<

clean:
	rm -rf images/*.png
