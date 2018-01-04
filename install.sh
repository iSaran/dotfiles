#!/bin/bash 
# Define variables

set -e
source install/my_echo.sh
source install/config.sh

mkdir -p $BACKUP_DIR

echo "Installing dotfiles..."

echo "  Installing dependencies"
sudo apt-get update > /dev/null
sudo apt-get install -y vim vim-gtk git qgit tmux tree subversion pandoc pandoc-citeproc 

# Edit bashrc in order to source my bashrc.
# Any further change will be added to mybashrc
# keeping original bashrc untouched.
echo "   Editing ~/.bashrc: Source mybashrc... "
echo "     Remove previous instances of sourcing mybashrc"
sed -i '/Iason Dotfiles/d' ~/.bashrc  

echo "     Adding a new instance for exporting DOTFILES_DIR var"
echo "DOTFILES_DIR=$DOTFILES_DIR # Iason Dotfiles" >> ~/.bashrc
echo "" >> ~/.bashrc

echo "     Adding a new instance for sourcing mybashrc"
echo "" >> ~/.bashrc
echo "# Iason Dotfiles: Source mybashrc" >> ~/.bashrc
echo "if [ -f $DOTFILES_DIR/bash/mybashrc ]; then # Iason Dotfiles" >> ~/.bashrc
echo "    . $DOTFILES_DIR/bash/mybashrc # Iason Dotfiles" >> ~/.bashrc
echo "fi # Iason Dotfiles" >> ~/.bashrc
echo "" >> ~/.bashrc

source $INSTALL_SCRIPTS_DIR/vim.sh
source $INSTALL_SCRIPTS_DIR/ranger.sh
