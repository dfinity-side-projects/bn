# bn
[![Build Status](https://travis-ci.org/dfinity/bn.svg?branch=master)](https://travis-ci.org/dfinity/bn)

> Barreto-Naehrig curve implementation and BLS

## Install
Prebuilt libraries are available for select platforms.
* [bn-latest-amd64-apple-darwin16.7.tar.gz](https://s3-us-west-2.amazonaws.com/dfinity/crypto/bn/latest/bn-latest-amd64-apple-darwin16.7.tar.gz)
* [bn-latest-amd64-linux-ubuntu16.04.tar.gz](https://s3-us-west-2.amazonaws.com/dfinity/crypto/bn/latest/bn-latest-amd64-linux-ubuntu16.04.tar.gz)

```
make install
```

The default install path is `/usr/local/`.
If you want to change the include path, then use `PREFIX`.
```
make install PREFIX=/workspace/build/cpp/
```
