#!/bin/bash

. ./installer.sh "$@"

# https://ja.wikipedia.org/wiki/GNU_Binutils
# oprofile has dependency to this
install_binutils() {
  if [ ! -d "${work_dir}/binutils-2.30" ]; then
    wget https://ftp.gnu.org/gnu/binutils/binutils-2.30.tar.xz
    tar xvf binutils-2.30.tar.xz
  fi
  cd "${work_dir}/binutils-2.30/"
  mkdir ${work_dir}/binutils-2.30/build
  cd ${work_dir}/binutils-2.30/build
  ../configure --prefix=$install_dir --enable-gold --enable-ld=default --enable-plugins --enable-shared --disable-werror --enable-64-bit-bfd --with-system-zlib
  nice -n 5 make -j $CORE && make install && make clean
}

main install_binutils
