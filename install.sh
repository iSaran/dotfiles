#!/bin/bash
# Define variables

# Stop the installation if any command fail
set -e

source install/config.sh
source $INSTALL_SCRIPTS_DIR/my_echo.sh

MESSAGE="Installing Dotfiles"; blue_echo

MESSAGE="Installing Dependencies"; blue_echo
sudo apt update > /dev/null

MESSAGE="Installing dotfiles..."; blue_echo

mkdir -p $BACKUP_DIR
declare -a arr=("mybash" "vim" "tmux" "ranger" "git")

## now loop through the above array
for i in "${arr[@]}"
do
  source $INSTALL_SCRIPTS_DIR/$i.sh
done

MESSAGE="Dotfiles installed successfully!"; green_echo
