#!/bin/bash

. ./installer.sh "$@"

install_radare2() {
  if [ ! -d "${work_dir}/radare2" ]; then
    git clone https://github.com/radare/radare2.git
  fi
  cd radare2
  sys/user.sh
}

main install_radare2
