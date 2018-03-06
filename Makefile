TARGET=bls/libbls384.so
MCL_LIB=mcl/lib/libmcl.so
all: $(TARGET)

$(MCL_LIB):
	$(MAKE) -C mcl UPDATE_ASM=1 lib/libmcl.so CFLAGS_USER=-std=c++11 MCL_MAX_BIT_SIZE=384

$(TARGET): $(MCL_LIB)
	$(MAKE) -C bls MCL_MAX_BIT_SIZE=384

clean:
	$(MAKE) -C mcl clean
	$(MAKE) -C bls clean

.PHONY: $(MCL_LIB) $(TARGET)

PREFIX?=/usr/local/
install: $(TARGET)
	mkdir -p $(PREFIX)lib
	cp -a $(MCL_LIB) $(PREFIX)lib
	cp -a $(TARGET) $(PREFIX)lib
	mkdir -p $(PREFIX)include/bls
	cp -a bls/include/bls/bls.h $(PREFIX)include/bls
	mkdir -p $(PREFIX)include/mcl
	cp -a mcl/include/mcl/bn.h $(PREFIX)include/mcl
