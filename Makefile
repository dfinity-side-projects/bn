TARGET=bls/libbls384.so
all: $(TARGET)

mcl/lib/libmcl.a:
	$(MAKE) -C mcl UPDATE_ASM=1 lib/libmcl.a CFLAGS_USER=-std=c++11

bls/libbls384.so: mcl/lib/libmcl.a
	$(MAKE) -C bls

clean:
	$(MAKE) -C mcl clean
	$(MAKE) -C bls clean

PREFIX?=/workspace/build/cpp/
install: $(TARGET)
	mkdir -p $(PREFIX)lib
	cp -a $(TARGET) $(PREFIX)lib
	mkdir -p $(PREFIX)include/bls
	cp -a bls/include/bls/bls.h $(PREFIX)include/bls
	mkdir -p $(PREFIX)include/mcl
	cp -a mcl/include/mcl/bn.h $(PREFIX)include/mcl
