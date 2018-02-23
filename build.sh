#!/bin/sh

export CFLAGS="-s SINGLE_FILE=1 -s LINKABLE=1 -s EXPORT_ALL=1 -s MODULARIZE=1 -s WASM=1 -O3"
export LDFLAGS="-s SINGLE_FILE=1 -s LINKABLE=1 -s EXPORT_ALL=1 -s MODULARIZE=1 -s WASM=1 -O3"
./configure
make clean
make
emcc c/src/ta_abstract/.libs/libta_abstract.a c/src/ta_func/.libs/libta_func.a c/src/ta_common/.libs/libta_common.a -s SINGLE_FILE=1 -s WASM=1 -s MODULARIZE=1 -s LINKABLE=1 -s EXPORT_ALL=1 -O3 -o talib.js
