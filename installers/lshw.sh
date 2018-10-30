#!/bin/bash

. ./installer.sh "$@"

# this will install automake and aclocal
install_lshw() {
  if [ ! -d "${work_dir}/lshw-B.02.18" ]; then
    rm -rf "${work_dir}/lshw-B.02.18"
  fi
  wget https://www.ezix.org/software/files/lshw-B.02.18.tar.gz --no-check-certificate
  tar zxvf lshw-B.02.18.tar.gz
  cd "${work_dir}/lshw-B.02.18"
  ./configure --prefix=$install_dir
  make -j $CORE
  # cannot set prefix for make install
  # make install && make clean
  mv src/lshw $install_dir/bin
}

main install_lshw

