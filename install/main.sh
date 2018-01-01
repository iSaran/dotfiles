#!/bin/bash

cd $INSTALL_SCRIPTS_DIR
# AUTHARL_ERROR=0
source my_echo.sh

declare -a arr=("bash" "vim" "tmux")

MESSAGE="Installing dotfiles..."; blue_echo

## now loop through the above array
for i in "${arr[@]}"
do
  cd $INSTALL_SCRIPTS_DIR
  source $i.sh
done

MESSAGE="Dotfiles Successfully installed."; green_echo
