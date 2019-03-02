#!/bin/bash

. ./installer.sh "$@"

# dependency to libtools
install_gperftools() {
  if [ ! -d "${work_dir}/gperftools-2.7" ]; then
    wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.7/gperftools-2.7.tar.gz --no-check-certificate
    tar -zxvf gperftools-2.7.tar.gz
  fi
  cd "${work_dir}/gperftools-2.7/"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
}

main install_gperftools
