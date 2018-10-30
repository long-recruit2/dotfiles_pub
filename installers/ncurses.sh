#!/bin/bash

. ./installer.sh "$@"

install_ncurses() {
  if [ ! -f "${work_dir}/ncurses-6.0.tar.gz" ]; then
    wget http://ftp.yz.yamagata-u.ac.jp/pub/GNU/ncurses/ncurses-6.0.tar.gz
  fi
  tar -zxvf ncurses-6.0.tar.gz
  cd "${work_dir}/ncurses-6.0"
  ./configure --prefix=$install_dir --without-cxx-bindings --with-shared
  make -j $CORE && make install && make clean
}

main install_ncurses
