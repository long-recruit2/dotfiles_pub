#!/bin/bash

CORE=1
while getopts c:e OPT
do
  case $OPT in
     "c") CORE=$OPTARG;;
     "e") EXECUTE="TRUE" ;;
  esac
done

DIR=$(cd ~/dotfiles && pwd -P)
install_dir=$(cd $DIR/install && pwd -P)
work_dir=$(cd $DIR/work && pwd -P)

make_install_dir() {
  if [ ! -d "$install_dir" ]; then
    mkdir -p "$install_dir"
  fi
}

make_work_dir() {
  if [ ! -d "$work_dir" ]; then
    mkdir -p "$work_dir"
  fi
}

set_env() {
  export PATH="$install_dir/bin:$PATH"
}

template() {
  make_install_dir
  make_work_dir
  set_env
  pushd "${work_dir}"
  for i in `echo "$@"`
  do
      eval $i
  done
  popd
}

main() {
  if [ "$EXECUTE" = "TRUE" ]; then
    template "$@"
  fi
}
