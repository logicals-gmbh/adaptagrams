#!/bin/sh

# Builds a universeral 32/64-bet Mac Java version of the Adaptagrams libraries.

FATFLAGS="-arch x86_64  -std=c++11"

mkdir -p m4
autoreconf --install --verbose

./configure --disable-dependency-tracking CPPFLAGS="-DNDEBUG -O3 -DUSE_ASSERT_EXCEPTIONS -std=c++11" CXXFLAGS="$FATFLAGS" LDFLAGS="$FATFLAGS"

make clean
make -j8
make -f Makefile-swig-java CXXFLAGS="$FATFLAGS" LDFLAGS="$FATFLAGS"
# make -f Makefile-swig-python

