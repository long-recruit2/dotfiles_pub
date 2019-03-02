#!/bin/bash

. ./installer.sh "$@"

install_libtool() {
  if [ ! -d "${work_dir}/libtool-2.4.6" ]; then
    wget http://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz --no-check-certificate
    decompress libtool-2.4.6.tar.gz
  fi
  cd "${work_dir}/libtool-2.4.6/"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
}

main install_libtool
