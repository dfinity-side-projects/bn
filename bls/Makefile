include ../mcl/common.mk

CFLAGS += -std=c++11 -I../mcl/include -I./include -DMCL_MAX_BIT_SIZE=384 -L../mcl/lib

SRC=src/bls_c.cpp
HEADER=include/bls/bls.h

all: libbls384.so

libbls384.so: $(SRC) $(HEADER)
	$(CXX) -o $@ $(SRC) -shared $(CFLAGS) -D"MCLBN_FP_UNIT_SIZE=6" -lmcl -lgmpxx -lgmp -lcrypto

libbls384.o: $(SRC) $(HEADER)
	$(CXX) -o $@ -c $(SRC) $(CFLAGS) -D"MCLBN_FP_UNIT_SIZE=6"

libbls384.a: libbls384.o ; ar rcs $@ $^

clean:
	$(RM) libbls384.so
