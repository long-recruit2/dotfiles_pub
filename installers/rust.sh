#!/bin/bash

. ./installer.sh "$@"

install_rust() {
  wget https://static.rust-lang.org/rustup.sh --no-check-certificate
  sh rustup.sh --prefix=$install_dir --disable-sudo
}

main install_rust
