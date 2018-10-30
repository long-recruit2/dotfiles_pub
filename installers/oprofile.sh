#!/bin/bash

. ./installer.sh "$@"

# this depends on autoconf and binutils
install_oprofile() {
  if [ ! -d "${work_dir}/oprofile" ]; then
    cd ${work_dir}
    git clone https://github.com/marcusmueller/oprofile.git
  fi
  cd "${work_dir}/oprofile"
  ./autogen.sh
  CFLAGS="-m64" CXXFLAGS="-m64" ./configure --libdir=$install_dir/lib64 --prefix=$install_dir --with-kernel-support
  # INCLUDES=-I$install_dir/include nice -n 5 make -j $CORE
  export INCLUDES=-I$install_dir/include; nice -n 5 make -j $CORE
  make install && make clean
}

main install_oprofile
