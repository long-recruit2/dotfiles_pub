#!/bin/bash

. ./installer.sh "$@"

# recuires ncurses
install_lynx() {
  if [ ! -f ${work_dir}/lynx2.8.8rel.2.tar.gz ]; then
    wget http://invisible-mirror.net/archives/lynx/tarballs/lynx2.8.8rel.2.tar.gz
  fi
  tar -zxvf lynx2.8.8rel.2.tar.gz
  cd "${work_dir}/lynx2-8-8"
  ./configure --prefix=$install_dir --with-curses-dir=$install_dir
  make -j $CORE && make install && make clean
}

main install_lynx
