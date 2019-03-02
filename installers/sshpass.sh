#!/bin/bash

. ./installer.sh "$@"

install_sshpass() {
  if [ ! -d "${work_dir}/sshpass-1.06" ]; then
    echo ${work_dir}
	echo $DIR/installers/sshpass-1.06.tar.gz
    cp $DIR/installers/sshpass-1.06.tar.gz ${work_dir}
    cd ${work_dir}
    tar -zxvf sshpass-1.06.tar.gz
  fi
  cd "${work_dir}/sshpass-1.06"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
}

main install_sshpass
