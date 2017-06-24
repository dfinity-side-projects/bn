include ../mcl/common.mk

CFLAGS += -std=c++11 -I../mcl/include -I./include -DMCL_MAX_BIT_SIZE=384

SRC=src/bls_c.cpp
HEADER=include/bls/bls.h

all: libbls384.so

libbls384.so: $(SRC) $(HEADER)
	$(CXX) -o $@ $(SRC) -shared $(CFLAGS) -D"MCLBN_FP_UNIT_SIZE=6" ../mcl/lib/libmcl.a

clean:
	$(RM) libbls384.so
