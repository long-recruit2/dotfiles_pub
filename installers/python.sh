#!/bin/bash

. ./installer.sh "$@"

install_python() {
  wget https://www.python.org/ftp/python/3.4.2/Python-3.4.2.tgz --no-check-certificate
  tar xzvf Python-3.4.2.tgz
  cd Python-3.4.2
  ./configure --prefix=$install_dir --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
  make -j $CORE && make install && make clean
}

main install_python
