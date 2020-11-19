#!/bin/env sh

set -e

. ./conf.sh
BUILD_ROOT=`pwd`

# Install dependencies
INSTALL_PKGS $DEPENDENCIES
echo Done installing dependencies, moving on in 3 sec
sleep 3

# Init git modules
git submodule init
echo Done initializing submodules, moving on in 3 sec
sleep 3

# Make prefix folder
mkdir -p "$PREFIX"

# Build bin utils
cd $BUILD_ROOT
mkdir -p build-binutils
cd build-binutils
../binutils-gdb/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install
echo Done installing build-binutils, moving on in 3 sec
sleep 3

# Build gcc
cd $BUILD_ROOT
mkdir -p build-gcc
cd build-gcc
../gcc/configure  --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc

