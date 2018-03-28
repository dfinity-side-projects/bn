UNAME_S=$(shell uname -s)
ifeq ($(UNAME_S),Darwin)
  LIB_SUF=dylib
else
  LIB_SUF=so
endif
TARGET=bls/libbls384.$(LIB_SUF)
MCL_LIB=mcl/lib/libmcl.$(LIB_SUF)
TARGET_STATIC=bls/libbls384.a
MCL_LIB_STATIC=mcl/lib/libmcl.a

all: $(TARGET) $(TARGET_STATIC)

$(MCL_LIB):
	$(MAKE) -C mcl UPDATE_ASM=1 lib/libmcl.$(LIB_SUF) CFLAGS_USER=-std=c++11 MCL_MAX_BIT_SIZE=384

$(MCL_LIB_STATIC):
	$(MAKE) -C mcl UPDATE_ASM=1 lib/libmcl.a CFLAGS_USER=-std=c++11 MCL_MAX_BIT_SIZE=384

$(TARGET): $(MCL_LIB)
	$(MAKE) -C bls libbls384.$(LIB_SUF) MCL_MAX_BIT_SIZE=384

$(TARGET_STATIC): $(MCL_LIB_STATIC)
	$(MAKE) -C bls libbls384.a MCL_MAX_BIT_SIZE=384

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
	cp -a $(MCL_LIB_STATIC) $(DESTDIR)$(PREFIX)/lib
	cp -a $(TARGET_STATIC) $(DESTDIR)$(PREFIX)/lib
	mkdir -p $(DESTDIR)$(PREFIX)/include/bls
	cp -a bls/include/bls/bls.h $(DESTDIR)$(PREFIX)/include/bls
	mkdir -p $(DESTDIR)$(PREFIX)/include/mcl
	cp -a mcl/include/mcl/bn.h $(DESTDIR)$(PREFIX)/include/mcl
