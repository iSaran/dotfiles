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

echo "   Configuring tmux..."

echo "     Checking ~/.tmux.conf"
if [ -f ~/.tmux.conf ]; then
  echo "       Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
  mv ~/.tmux.conf "$DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
else
  if [ -L ~/.tmux.conf ]; then 
    echo "       Existing tmux.conf found"
    if [ -h ~/.tmux.conf ]; then
      # It is a symlink!  # Symbolic link specific commands go here.
      echo "       Existing symlink found. Deleted it."
      rm ~/.tmux.conf
    else
      # It's a file!  # Directory command goes here.
      echo "       Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
      mv ~/.tmux.conf "$DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
    fi
  fi
fi

echo "     Creating a new symlink ~/.tmux.conf"
ln -s "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf

source $INSTALL_SCRIPTS_DIR/vim.sh
source $INSTALL_SCRIPTS_DIR/ranger.sh
