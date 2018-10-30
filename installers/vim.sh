#!/bin/bash

. ./installer.sh "$@"

# this requires lua, ncurses, python2 and python3
install_vim() {
  cd "${work_dir}/"
  echo 'install vim'
  if [ ! -d "${work_dir}/vim" ]; then
    git clone https://github.com/vim/vim.git
  else
    cd "${work_dir}/vim"
    git checkout master
    git fetch --prune
    git pull --prune
  fi
  if [ -f ${work_dir}/vim/src/auto/config.cache ]; then
    rm "${work_dir}/vim/src/auto/config.cache"
  fi
  cd "${work_dir}/vim/src"
  export LDFLAGS="-L$install_dir/lib"
  ./configure --with-local-dir=$install_dir \
  --with-features=huge \
  --enable-luainterp=dynamic \
  --with-luajit \
  --with-lua-prefix=$install_dir \
  --with-tlib=ncurses \
  --prefix=$install_dir \
  --enable-pythoninterp \
  --enable-python3interp \
  #--with-python-config-dir=$install_dir/lib/python3.4/config-3.4m-x86_64-linux-gnu
  make -j $CORE && make install && make clean
}

main install_vim
