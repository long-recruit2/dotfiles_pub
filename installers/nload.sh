#!/bin/bash

. ./installer.sh "$@"

install_nload() {
  if [ ! -d "${work_dir}/nload-0.7.4" ]; then
    rm -rf "${work_dir}/nload-0.7.4"
  fi
  wget http://www.roland-riegel.de/nload/nload-0.7.4.tar.gz
  tar zxvf nload-0.7.4.tar.gz
  cd "${work_dir}/nload-0.7.4"
  ./configure --prefix=$install_dir
  make -j $CORE
  make install && make clean
}

main install_nload
