TARGET=bls/libbls384.so
MCL_LIB=mcl/lib/libmcl.a
all: $(TARGET)

$(MCL_LIB):
	$(MAKE) -C mcl UPDATE_ASM=1 lib/libmcl.a CFLAGS_USER=-std=c++11 MCL_MAX_BIT_SIZE=384

$(TARGET): $(MCL_LIB)
	$(MAKE) -C bls

clean:
	$(MAKE) -C mcl clean
	$(MAKE) -C bls clean

.PHONY: $(MCL_LIB) $(TARGET)

PREFIX?=/workspace/build/cpp/
install: $(TARGET)
	mkdir -p $(PREFIX)lib
	cp -a $(TARGET) $(PREFIX)lib
	mkdir -p $(PREFIX)include/bls
	cp -a bls/include/bls/bls.h $(PREFIX)include/bls
	mkdir -p $(PREFIX)include/mcl
	cp -a mcl/include/mcl/bn.h $(PREFIX)include/mcl
