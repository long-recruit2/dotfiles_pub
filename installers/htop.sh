#!/bin/bash

. ./installer.sh "$@"

# this depends on autoconf
install_htop() {
  if [ ! -d "${work_dir}/htop" ]; then
    git clone https://github.com/hishamhm/htop.git
  fi
  cd "${work_dir}/htop"
  ./autogen.sh
  ./configure --prefix=$install_dir --disable-unicode
  make -j $CORE && make install && make clean
}

main install_htop
