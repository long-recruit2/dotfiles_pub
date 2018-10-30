#!/bin/bash

. ./installer.sh "$@"

# this depends on autoconf and automake
# this should work in home environment, lets check
install_ag() {
  if [ ! -d "${work_dir}/the_silver_searcher-2.1.0" ]; then
    cd ${work_dir}
    wget https://geoff.greer.fm/ag/releases/the_silver_searcher-2.1.0.tar.gz
    # git clone https://github.com/ggreer/the_silver_searcher.git
    tar xzf the_silver_searcher-2.1.0.tar.gz
  fi
  cd "${work_dir}/the_silver_searcher-2.1.0"
  aclocal
  autoconf
  autoheader
  automake --add-missing
  ./configure --prefix=$install_dir LZMA_CFLAGS="-I$install_dir/include/" LZMA_LIBS="-L$install_dir/lib"
  make -j $CORE && make install && make clean
}

main install_ag
