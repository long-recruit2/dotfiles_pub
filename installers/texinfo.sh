#!/bin/bash

. ./installer.sh "$@"

install_texinfo() {
  wget https://ftp.gnu.org/gnu/texinfo/texinfo-6.4.tar.gz --no-check-certificate
  tar -zxvf texinfo-6.4.tar.gz
  cd texinfo-6.4
  ./configure --prefix=$install_dir
  make -j $CORE && make install
}

main install_texinfo
