#!/bin/bash

. ./installer.sh "$@"

install_nvim() {
  if [ ! -d "${work_dir}/neovim" ]; then
    git clone https://github.com/neovim/neovim.git
  fi
  cd "${work_dir}/neovim"
  make -j $CORE CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$install_dir" && make install
}

main install_nvim
