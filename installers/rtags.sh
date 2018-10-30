#!/bin/bash

. ./installer.sh "$@"

# dont remember this version of clang is needed for rtags....
# maybe we need to make cfe here to produce libclang.so
#install_clang() {
#  cd "${work_dir}/"
#  echo 'install clang'
#  if [ ! -d "${work_dir}/llvm-3.9.1.src" ]; then
#    wget http://releases.llvm.org/3.9.1/llvm-3.9.1.src.tar.xz
#    tar Jxfv llvm-3.9.1.src.tar.xz
#  fi
#  if [ ! -d "${work_dir}/cfe-3.9.1.src" ]; then
#    wget http://releases.llvm.org/3.9.1/cfe-3.9.1.src.tar.xz
#    tar Jxfv cfe-3.9.1.src.tar.xz
#  fi
#  if [ ! -d "${work_dir}/compiler-rt-3.9.1.src" ]; then
#    wget http://releases.llvm.org/3.9.1/compiler-rt-3.9.1.src.tar.xz
#    tar Gxfv compiler-rt-3.9.1.src.tar.xz
#  fi
#  if [ ! -d "build" ]; then
#    mkdir -p "build"
#  fi
#  cd build
#  $install_dir/bin/cmake -G "Unix Makefiles" ../llvm-3.9.1.src
#  make
#  cmake -DCMAKE_INSTALL_PREFIX=$install_dir -P cmake_install.cmake
#}

# this may require cmake, clang, zlib, openssl
install_rtags() {
  if [ ! -d "${work_dir}/rtags" ]; then
    git clone https://github.com/Andersbakken/rtags
  fi
  cd rtags
  git submodule init
  git submodule update
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$install_dir ..
  make && make install
}

#main install_clang install_rtags
main install_rtags
