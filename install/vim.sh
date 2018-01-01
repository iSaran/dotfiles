#!/bin/bash

MESSAGE="Installing ViM configuration..."; blue_echo

MESSAGE="Installing ViM dependencies"; blue_echo
sudo apt-get update > /dev/null
sudo apt-get install -y vim vim-gtk git> /dev/null

# ViM config. Backup possible existing directories and files and remove 
# existing symlinks.
if [ -d $HOME/.vim ]; then 
  if [ -L $HOME/.vim ]; then
    # It is a symlink!  # Symbolic link specific commands go here.
    echo "       "
    MESSAGE="Existing symlink found. Deleted it."; blue_echo
    rm $HOME/.vim
  else
    # It's a directory!  # Directory command goes here.
    #rmdir ~/.vim
    MESSAGE="Existing directory found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/vim"; blue_echo
    mv $HOME/.vim "$DOTFILES_DIR/backups/$BACKUP_NAME/vim"
  fi
fi

mkdir $HOME/.vim
ln -s "$DOTFILES_DIR/vim/colors" $HOME/.vim/colors

if [ -f $HOME/.vimrc ]; then 
  if [ -L $HOME/.vimrc ]; then
    # It is a symlink!  # Symbolic link specific commands go here.
    MESSAGE="Existing symlink found. Deleted it."; blue_echo
    rm ~/.vimrc
  else
    # It's a file!  # Directory command goes here.
    MESSAGE="Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/vimrc"; blue_echo
    mv $HOME/.vimrc "$DOTFILES_DIR/backups/$BACKUP_NAME/vimrc"
  fi
fi

ln -s "$DOTFILES_DIR/vim/vimrc" ~/.vimrc

git config --global core.editor "vim"
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3

MESSAGE="Install ViM plugins"; blue_echo
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

MESSAGE="Install Powerline fonts"; blue_echo
cd $DOTFILES_DIR
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
