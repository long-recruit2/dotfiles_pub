#!/bin/bash

. ./installer.sh "$@"

install_openssl() {
  if [ ! -d "${work_dir}/openssl-1.0.1" ]; then
    wget https://www.openssl.org/source/openssl-1.0.1j.tar.gz --no-check-certificate
    tar -zxvf openssl-1.0.1j.tar.gz
  fi
  cd "${work_dir}/openssl-1.0.1j"
  ./config --prefix=$install_dir
  make -j $CORE && make install && make clean
}

main install_openssl
