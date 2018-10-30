#!/bin/bash

. ./installer.sh "$@"

install_gdb() {
  wget http://ftp.gnu.org/gnu/gdb/gdb-7.12.tar.gz --no-check-certificate
  tar -zxvf gdb-7.12.tar.gz
  cd gdb-7.12
  ./configure --prefix=$install_dir
  make -j $CORE && make install
}

main install_gdb
