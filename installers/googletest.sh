#!/bin/bash

. ./installer.sh "$@"

install_googletest() {
  if [ ! -d "${work_dir}/googletest" ]; then
	git clone https://github.com/google/googletest.git
    cd "${work_dir}/googletest"
  else
    cd "${work_dir}/googletest"
    git checkout master
    git fetch --prune
    git pull --prune
  fi
  mkdir -p "${work_dir}/googletest/build"
  cd "${work_dir}/googletest/build"
  cmake -DCMAKE_INSTALL_PREFIX=$install_dir ..
  #make -j $CORE PREFIX=$install_dir && make install PREFIX=$install_dir && make clean
  make -j $CORE && make install make clean
}

main install_googletest
