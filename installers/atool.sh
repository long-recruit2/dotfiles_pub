#!/bin/bash

. ./installer.sh "$@"

install_atool() {
  if [ ! -d "${work_dir}/atool-0.39.0" ]; then
	wget http://savannah.nongnu.org/download/atool/atool-0.39.0.tar.gz --no-check-certificate
    tar -zxvf atool-0.39.0.tar.gz
  fi
  cd "${work_dir}/atool-0.39.0/"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
}

main install_atool
