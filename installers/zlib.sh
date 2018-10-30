#!/bin/bash

. ./installer.sh "$@"

install_zlib(){
  if [ ! -d "${work_dir}/zlib-1.2.11" ]; then
    wget http://www.zlib.net/zlib-1.2.11.tar.gz
    tar -zxvf zlib-1.2.11.tar.gz
  fi
  cd "${work_dir}/zlib-1.2.11/"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
}

main install_zlib
