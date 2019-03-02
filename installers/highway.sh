#!/bin/bash

. ./installer.sh "$@"

# dependency to autotool, automake and gperftools
install_highway() {
  if [ ! -d "${work_dir}/highway-1.1.0" ]; then
    wget https://github.com/tkengo/highway/archive/v1.1.0.tar.gz --no-check-certificate
    tar -zxvf v1.1.0.tar.gz
  fi
  cd "${work_dir}/highway-1.1.0/"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
}

main install_highway
