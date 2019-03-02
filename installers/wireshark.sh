
#!/bin/bash

. ./installer.sh "$@"

install_wireshark() {
  if [ ! -d "${work_dir}/libgpg-error-1.33" ]; then
    wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.33.tar.bz2 --no-check-certificate
    tar -jxvf libgpg-error-1.33.tar.bz2
  fi
  cd "${work_dir}/libgpg-error-1.33/"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
  cd -
  if [ ! -d "${work_dir}/libgcrypt-1.8.4" ]; then
    wget https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.4.tar.bz2 --no-check-certificate
    tar -jxvf libgcrypt-1.8.4.tar.bz2
  fi
  cd "${work_dir}/libgcrypt-1.8.4"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
  cd -
  if [ ! -d "${work_dir}/libpcap-1.9.0" ]; then
    wget https://www.tcpdump.org/release/libpcap-1.9.0.tar.gz --no-check-certificate
    tar -zxvf libpcap-1.9.0.tar.gz
  fi
  cd "${work_dir}/libpcap-1.9.0"
  ./configure --prefix=$install_dir
  make -j $CORE && make install && make clean
  cd -
  if [ ! -d "${work_dir}/wireshark-2.4.11" ]; then
    wget https://www.wireshark.org/download/src/wireshark-2.4.11.tar.xz --no-check-certificate
    tar -xf wireshark-2.4.11.tar.xz
  fi
  cd "${work_dir}/wireshark-2.4.11"
  ./configure --prefix=$install_dir --disable-wireshark  --enable-tshark  --enable-ipv6 --disable-gtktest --disable-glibtest  --disable-editcap --disable-capinfos  --disable-mergecap --disable-reordercap  --disable-text2pcap --disable-dftest  --disable-randpkt --disable-airpcap  --enable-dumpcap --disable-rawshark  --enable-pcap-ng-default  --without-lua --without-ssl
  make -j $CORE && make install && make clean
  # enable capture by this comand
  # sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' $install_dir/bin/dumpcap
}

main install_wireshark
