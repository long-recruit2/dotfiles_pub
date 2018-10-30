#!/bin/bash

. ./installer.sh "$@"

install_boost() {
  if [ ! -d "${work_dir}/boost" ]; then
    git clone --recursive https://github.com/boostorg/boost.git
    git checkout boost-1.64.0
  fi
  cd boost
  ./bootstrap.sh
  ./b2 install -j $CORE --prefix=$install_dir
}

main install_boost
