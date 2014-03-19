rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))
UNOCONV = python unoconv/unoconv
TEX = pdflatex

IMG_SRCS=$(call rwildcard, images/, *.odg)
IMG_PNGS=$(IMG_SRCS:.odg=.png)

TEX_SRCS=$(call rwildcard, , *.tex)
TEX_PDFS=$(IMG_SRCS:.tex=.pdf)

all: images documents

images: $(IMG_PNGS)

documents: $(TEX_PDFS)

%.png : %.odg
	$(UNOCONV) -f png $<

%.pdf : %.tex
	mkdir pdf-docs; $(TEX) -output-directory pdf-docs $<
    
clean:
	rm -rf images/*.png
