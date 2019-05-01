src = $(wildcard *.c)
obj = $(src:.c=.o)

LDFLAGS = -lz -lm
CFLAGS = -Iklib -O3

quack: $(obj)
	$(CC) -o $@ $^ $(LDFLAGS)

klib/kseq.h:
	git submodule update --init --recursive

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

.PHONY: clean images
clean:
	rm -f $(obj) quack ERR1438847_1.fastq.gz ERR1438847_2.fastq.gz

images: quack
	$(MAKE) -C images all