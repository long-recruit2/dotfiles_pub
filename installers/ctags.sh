#!/bin/bash

. ./installer.sh "$@"

install_ctags() {
  if [ ! -d "${work_dir}/ctags-5.8" ]; then
    wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz --no-check-certificate
    tar -zxvf ctags-5.8.tar.gz
  fi
  cd "${work_dir}/ctags-5.8/"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
}

main install_ctags
