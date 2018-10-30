
#!/bin/bash

. ./installer.sh "$@"

install_cmake() {
  if [ ! -d "${work_dir}/cmake-3.8.0-rc1" ]; then
    wget https://cmake.org/files/v3.8/cmake-3.8.0-rc1.tar.gz --no-check-certificate
    tar -zxvf cmake-3.8.0-rc1.tar.gz
  fi
  cd "${work_dir}/cmake-3.8.0-rc1/"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
}

main install_cmake
