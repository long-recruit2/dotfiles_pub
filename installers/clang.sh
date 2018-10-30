#!/bin/bash

. ./installer.sh "$@"

install_clang() {
  if [ ! -d "${work_dir}/llvm" ]; then
    git clone https://github.com/llvm-mirror/llvm.git
    cd llvm
    (cd tools/; git clone https://github.com/llvm-mirror/clang.git)
    (cd projects/; git clone https://github.com/llvm-mirror/compiler-rt.git)
    cd "${work_dir}/"
  fi
  mkdir build
  cd build
  cmake -G "Unix Makefiles" ../llvm
  make -j $CORE
  cmake -DCMAKE_INSTALL_PREFIX=$install_dir -P cmake_install.cmake
}

main install_clang
