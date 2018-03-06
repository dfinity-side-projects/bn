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

PREFIX?=/usr/local
DESTDIR?=
install: $(TARGET)
	mkdir -p $(DESTDIR)$(PREFIX)/lib
	cp -a $(MCL_LIB) $(DESTDIR)$(PREFIX)/lib
	cp -a $(TARGET) $(DESTDIR)$(PREFIX)/lib
	mkdir -p $(DESTDIR)$(PREFIX)/include/bls
	cp -a bls/include/bls/bls.h $(DESTDIR)$(PREFIX)/include/bls
	mkdir -p $(DESTDIR)$(PREFIX)/include/mcl
	cp -a mcl/include/mcl/bn.h $(DESTDIR)$(PREFIX)/include/mcl
