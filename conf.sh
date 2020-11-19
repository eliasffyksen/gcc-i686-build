#!/bin/env sh

# Configured from https://wiki.osdev.org/GCC_Cross-Compiler#Installing_Dependencies
export INSTALL_PKG="yay -Syu"
export DEPENDENCIES="base-devel gmp libmpc mpfr"

export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"
