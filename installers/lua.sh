#!/bin/bash

. ./installer.sh "$@"

install_lua() {
  if [ ! -d "${work_dir}/luajit-2.0" ]; then
    git clone http://luajit.org/git/luajit-2.0.git
    cd "${work_dir}/luajit-2.0"
  else
    cd "${work_dir}/luajit-2.0"
    git checkout master
    git fetch --prune
    git pull --prune
  fi
  make -j $CORE PREFIX=$install_dir && make install PREFIX=$install_dir && make clean
}

main install_lua
