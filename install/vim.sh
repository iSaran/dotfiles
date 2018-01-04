#!/bin/bash

## @author Iason Sarantopoulos

# ViM config. Backup possible existing directories and files and remove
# existing symlinks.
echo "   Configuring ViM..."

echo "     Checking ~/.vim"
if [ -d ~/.vim ]; then
  if [ -L ~/.vim ]; then
    # It is a symlink!  # Symbolic link specific commands go here.
    echo "       Existing symlink found. Deleted it."
    rm ~/.vim
  else
    # It's a directory!  # Directory command goes here.
    #rmdir ~/.vim
    echo "       Existing directory found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/vim"
    mv ~/.vim "$DOTFILES_DIR/backups/$BACKUP_NAME/vim"
  fi
fi

echo "     Creating a new ~/.vim"
mkdir ~/.vim
echo "     Creating a new symlink ~/.vim/colors"
ln -s "$DOTFILES_DIR/vim/colors" ~/.vim/colors

echo "     Checking ~/.vimrc"
if [ -f ~/.vimrc ]; then
  if [ -L ~/.vimrc ]; then
    # It is a symlink!  # Symbolic link specific commands go here.
    echo "       Existing symlink found. Deleted it."
    rm ~/.vimrc
  else
    # It's a file!  # Directory command goes here.
    echo "       Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/vimrc"
    mv ~/.vimrc "$DOTFILES_DIR/backups/$BACKUP_NAME/vimrc"
  fi
fi
echo "     Creating a new symlink ~/.vimrc"
ln -s "$DOTFILES_DIR/vim/vimrc" ~/.vimrc

echo "  Installing ViM's plugins..."

# Check if git is available
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
# ...
if [ $GIT_IS_AVAILABLE -ne 0 ]; then # If $? var is not 0 then git is not installed
  echo "    Git is not installed. Installing Git for git cloning..."
  sudo apt-get install git
fi
git config --global core.editor "vim"
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3

echo "    Cloning Vudle (the plugin manager) from GitHub..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

command -v vim > /dev/null 2>&1
VIM_IS_AVAILABLE=$?
if [ $VIM_IS_AVAILABLE -eq 0 ]; then
  echo "    Installing ViM plug-ins with Vundle..."
  vim +PluginInstall +qall
fi

echo "  Installing fonts..."
echo "    Cloning powerline fonts from GitHub..."
cd $DOTFILES_DIR

if [ -d fonts ]; then
  cd fonts
  git pull origin master
  cd ..
else
  git clone https://github.com/powerline/fonts.git
fi

cd fonts
echo "    Install fonts..."
./install.sh

echo "Done. Choose one powerline font for your terminal and you are ready to go..."
