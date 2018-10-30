#!/bin/bash

. ./installer.sh "$@"

install_m4() {
  if [ ! -d "${work_dir}/m4-1.4.18" ]; then
    rm -rf "${work_dir}/m4-1.4.18"
  fi
  wget http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.gz
  tar zxvf m4-1.4.18.tar.gz
  cd "${work_dir}/m4-1.4.18"
  ./configure --prefix=$install_dir
  make -j $CORE
  make install && make clean
}

main install_m4
