#!/bin/bash

. ./installer.sh "$@"

install_valgrind() {
  if [ ! -f ${work_dir}/valgrind-3.13.0.tar.bz2 ]; then
    wget ftp://sourceware.org/pub/valgrind/valgrind-3.13.0.tar.bz2 --no-check-certificate
  fi
  untarb valgrind-3.13.0.tar.bz2
  cd "${work_dir}/valgrind-3.13.0"
  ./autogen.sh
  ./configure --prefix=$install_dir
  make -j $CORE && make install
}

main install_valgrind
