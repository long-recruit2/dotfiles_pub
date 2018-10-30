#!/bin/bash

. ./installer.sh "$@"

install_dstat() {
  if [ ! -d "${work_dir}/dstat" ]; then
    git clone https://github.com/dagwieers/dstat
  fi
  cd "${work_dir}/dstat"
  cp ./dstat $install_dir/bin
#  if [ ! -d "${work_dir}/dstat-0.7.2" ]; then
#    wget http://dag.wieers.com/home-made/dstat/dstat-0.7.2.tar.bz2
#    tar jxf dstat-0.7.2.tar.bz2
#  fi
#  cd "${work_dir}/dstat-0.7.2"
#  cp "${work_dir}/dstat-0.7.2/dstat" $install_dir/bin

}

main install_dstat
