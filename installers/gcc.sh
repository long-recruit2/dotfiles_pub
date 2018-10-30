#!/bin/bash

. ./installer.sh "$@"

install_gcc() {
  if [ ! -d "${work_dir}/gcc-7.3.0.tar.gz" ]; then
    rm -rf "${work_dir}/gcc-7.3.0.tar.gz"
  fi
  if [ ! -d "${work_dir}/gcc-7.3.0" ]; then
    rm -rf "${work_dir}/gcc-7.3.0"
  fi
  cd ${work_dir}
  wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-7.3.0/gcc-7.3.0.tar.gz
  tar xf gcc-7.3.0.tar.gz
  cd gcc-7.3.0
  ./contrib/download_prerequisites
  if [ ! -d "${work_dir}/build" ]; then
    rm -rf "${work_dir}/build"
  fi
  mkdir "${work_dir}/build"
  cd "${work_dir}/build"
  ../gcc-7.3.0/configure -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --prefix=$install_dir/gcc-7.3.0 --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib
  nice -n  5 make -j $CORE
  make install
}

main install_gcc
