#!/bin/bash

. ./installer.sh "$@"

install_cppcheck() {
  if [ ! -d "${work_dir}/cppcheck" ]; then
    git clone https://github.com/danmar/cppcheck.git
    cd cppcheck
    git checkout refs/tags/1.80
  else
    cd "${work_dir}/cppcheck"
    git checkout refs/tags/1.80
    git fetch --prune
    git pull --prune
  fi
  # HAVE_RULES=yes requires pcre library
  # make install -j $CORE PREFIX=$install_dir SRCDIR=build CFGDIR=$install_dir/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
  make install -j $CORE PREFIX=$install_dir SRCDIR=build CFGDIR=$install_dir/cfg HAVE_RULES=no CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
}

main install_cppcheck
