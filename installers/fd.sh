#!/bin/bash

. ./installer.sh "$@"

install_fd() {
  if [ ! -d "${work_dir}/fd" ]; then
    git clone https://github.com/sharkdp/fd.git
    cd fd
    git checkout refs/tags/v7.3.0
  else
    cd "${work_dir}/fd"
    git fetch --prune
    git checkout refs/tags/v7.3.0
    git pull --prune
  fi
  cargo build
  cargo install
}

main install_fd
