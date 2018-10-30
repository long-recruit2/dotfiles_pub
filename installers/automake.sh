#!/bin/bash

. ./installer.sh "$@"

# this will install automake and aclocal
install_automake() {
  if [ ! -d "${work_dir}/automake-1.16" ]; then
    rm -rf "${work_dir}/automake-1.16"
  fi
  wget http://ftp.gnu.org/gnu/automake/automake-1.16.tar.gz
  tar zxvf automake-1.16.tar.gz
  cd "${work_dir}/automake-1.16"
  ./configure --prefix=$install_dir
  make -j $CORE
  make install && make clean
}

main install_automake
