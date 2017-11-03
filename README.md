# bn
[![Build Status](https://travis-ci.org/dfinity/bn.svg?branch=master)](https://travis-ci.org/dfinity/bn)

Barreto-Naehrig curve implementation and BLS

## Install

### Requirements

Your system needs have installed first llvm, g++, gmp and openssl{-dev}.

### From source

To install from source, you can run the following commands:
```bash
git clone https://github.com/dfinity/bn
cd bn
make
make install
```
The library is then installed under `/usr/local/`.
In order to use it as a library for any project (see [go-dfinity-crypto](https://github.com/dfinity/go-dfinity-crypto) for example), your loader must be aware of this location. There are two common solutions:
 - To use it for the current session:
```bash
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib
```
 - To use it permanently, add `/usr/local/lib` to `/etc/ld.so.conf` , then run `ldconfig` as root

If you wish to change the path where the libraries are installed, you can use:
```bash
make install PREFIX=/my/custom/path
```

### From latest release

Prebuilt libraries are available for select platforms.
* [bn-latest-amd64-apple-darwin16.7.tar.gz](https://s3-us-west-2.amazonaws.com/dfinity/crypto/bn/latest/bn-latest-amd64-apple-darwin16.7.tar.gz)
* [bn-latest-amd64-linux-ubuntu16.04.tar.gz](https://s3-us-west-2.amazonaws.com/dfinity/crypto/bn/latest/bn-latest-amd64-linux-ubuntu16.04.tar.gz)

You may need to place the libraries in the correct path as explained in the above section.
