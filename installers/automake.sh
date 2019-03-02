#!/bin/bash

. ./installer.sh "$@"

# this will install automake and aclocal
install_automake() {
  if [ ! -d "${work_dir}/automake-1.15" ]; then
    rm -rf "${work_dir}/automake-1.15"
  fi
  wget https://ftp.gnu.org/gnu/automake/automake-1.15.tar.gz  --no-check-certificate
  tar zxvf automake-1.15.tar.gz
  cd "${work_dir}/automake-1.15"
  ./configure --prefix=$install_dir
  make -j $CORE
  make install && make clean
}

main install_automake
