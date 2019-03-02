#!/bin/bash

. ./installer.sh "$@"

install_openssl() {
  if [ ! -d "${work_dir}/OpenSSL_1_0_2r" ]; then
    #wget https://www.openssl.org/source/openssl-1.0.1j.tar.gz --no-check-certificate
	wget https://github.com/openssl/openssl/archive/OpenSSL_1_0_2r.tar.gz --no-check-certificate
    tar -zxvf OpenSSL_1_0_2r.tar.gz
  fi
  cd "${work_dir}/openssl-OpenSSL_1_0_2r"
  #./config --prefix=$install_dir
  ./config --openssldir=$install_dir
  make -j $CORE && make install && make clean
}

main install_openssl
