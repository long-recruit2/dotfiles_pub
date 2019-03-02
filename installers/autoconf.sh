#!/bin/bash

. ./installer.sh "$@"

install_autoconf() {
  if [ ! -d "${work_dir}/autoconf-2.69" ]; then
  cd ${work_dir}
	wget https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz --no-check-certificate
    tar -zxvf autoconf-2.69.tar.gz
	cd autoconf-2.69
  else
    cd "${work_dir}/autoconf-2.69"
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

main install_autoconf
#main install_autoconf2
