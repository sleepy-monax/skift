#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TARGET=i686-elf
GCC_VERSION=6.4.0
BINUTILS_VERSION=2.27
PREFIX=$DIR/../toolchain

mkdir -p tarballs

pushd tarballs

    echo "Downloading pakages..."
    
    if [ ! -e "binutils-$BINUTILS_VERSION.tar.gz" ]; then
        wget "http://ftp.gnu.org/gnu/binutils/binutils-$BINUTILS_VERSION.tar.gz"
    fi
    
    if [ ! -e "gcc-$GCC_VERSION.tar.gz" ]; then
        wget "http://www.netgull.com/gcc/releases/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.gz"
    fi

    echo "Unpaking..."
    
    if [ ! -d "binutils-$BINUTILS_VERSION" ]; then
        tar -xf "binutils-$BINUTILS_VERSION.tar.gz"
    fi

    if [ ! -d "gcc-$GCC_VERSION" ]; then
        tar -xf "gcc-$GCC_VERSION.tar.gz"
    fi

popd

mkdir -p "$PREFIX"
mkdir -p ../build
mkdir -p ../build/binutils
mkdir -p ../build/gcc

pushd ../build

    unset PKG_CONFIG_LIBDIR # Just in case

    pushd binutils
        $DIR/tarballs/binutils-$BINUTILS_VERSION/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror || exit 1
        make -j4
        make install
    popd

    pushd gcc
        $DIR/tarballs/gcc-$GCC_VERSION/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers || exit 1
        make -j4 all-gcc all-target-libgcc
        make install-gcc install-target-libgcc
    popd

popd