#!/bin/bash

. ./installer.sh "$@"

install_autoconf() {
  if [ ! -d "${work_dir}/autoconf" ]; then
    git clone http://git.sv.gnu.org/r/autoconf.git
    cd autoconf
    #git checkout AUTOCONF-2.61
    git checkout v2.69
  else
    cd "${work_dir}/autoconf"
    #git checkout AUTOCONF-2.61
    git checkout v2.69
    git fetch --prune
    git pull --prune
  fi
  ./configure --prefix=$install_dir
  make -j $CORE
  make install && make clean
}

# has dependency to m4
install_autoconf2() {
  if [ ! -d "${work_dir}/autoconf" ]; then
    rm -rf "${work_dir}/autoconf"
  fi
  wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.68.tar.gz
  tar zxvf autoconf-2.68.tar.gz
  cd autoconf-2.68
  ./configure --prefix=$install_dir
  make -j $CORE
  make install && make clean
}

main install_autoconf2
